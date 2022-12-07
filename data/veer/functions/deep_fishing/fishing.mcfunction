##
 # fishing.mcfunction
 # Created by Galdeveer.
 # 
##

#declare tag veer.dsf.fishing.helper Permanent.
#declare entity @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] Kill at end
#declare tag veer.dsf.fishing.caught Permanent
#declare tag veer.dsf.fishing.caught.new Remove at end
#declare tag veer.dsf.fishing.offhandIsAir Remove at end
#declare tag veer.dsf.fishing.doHologram Remove at end
#declare tag veer.dsf.fishing.doLivingCatch Permanent
#declare tag veer.dsf.fishing.doNonlivingCatch Remove at end
#declare tag veer.dsf.hookedItem Permanent
#declare tag veer.dsf.hookedItem.new Remove at end
#declare tag veer.dsf.hookedItem.cur Add at start and remove at end each iteration.


# say -------------------

#> Initialize hooked item
tag @s[tag=!veer.dsf.hookedItem] add veer.dsf.hookedItem.new
tag @s[tag=!veer.dsf.hookedItem] add veer.dsf.hookedItem
tag @s add veer.dsf.hookedItem.cur

# Transfer enchant info from bobber to item for easy access
execute if entity @s[tag=veer.dsf.hookedItem.new] as @e[type=fishing_bobber,distance=..0.5,limit=1] run function veer:deep_fishing/transfer_enchant_tags_to_item

#> Badly named header
# Summon helper entity
summon armor_stand ~ ~ ~ {Tags:["veer.dsf.fishing.helper","global.ignore","global.ignore.pos"],Marker:1b,Invisible:1b,DisabledSlots:4144959}

# Convert to simply checking item
execute if entity @s[scores={veer.df.los=1}] run attribute @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] generic.luck modifier add 4ac042b0-37a9-4bc9-bec4-bb74357b26e8 "luck_of_the_sea_1" 1 add
execute if entity @s[scores={veer.df.los=2}] run attribute @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] generic.luck modifier add c2eb3ed9-0f67-4949-8d52-804c6c277f0e "luck_of_the_sea_2" 2 add
execute if entity @s[scores={veer.df.los=3}] run attribute @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] generic.luck modifier add 9265aacf-f228-4768-b0c0-affaa75f7298 "luck_of_the_sea_3" 3 add

#> Helper Construction
# Only here can the helper be edited

#> -Offhand
# Copy hooked item to helper offhand
data modify entity @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] HandItems[1] set from entity @s Item

#> -Mainhand
# Generate item in helper mainhand from fishing loot table
# Note: The selector in the loot command does not control execution context.
execute as @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] at @s run loot replace entity @s weapon.mainhand fish veer:deep_fishing/fishing ~ ~ ~

#> Tagging

# If mainhand is empty, flag with veer.dsf.fishing.offhandIsAir
execute if entity @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1,predicate=veer:deep_fishing/mainhand_is_empty] run tag @s add veer.dsf.fishing.offhandIsAir

# Give veer.dsf.fishing.canRollForCatch if it can
tag @s[tag=!veer.dsf.fishing.offhandIsAir,tag=!veer.dsf.fishing.caught] add veer.dsf.fishing.canRollForCatch
# Catch rolls
# -Base Case
tag @s[tag=veer.dsf.fishing.canRollForCatch,predicate=veer:deep_fishing/catch_chance] add veer.dsf.fishing.caught.new
# -Lure Cases
tag @s[tag=veer.dsf.fishing.canRollForCatch,scores={veer.df.lure=1},predicate=veer:deep_fishing/lure_1_catch_chance] add veer.dsf.fishing.caught.new
tag @s[tag=veer.dsf.fishing.canRollForCatch,scores={veer.df.lure=2},predicate=veer:deep_fishing/lure_2_catch_chance] add veer.dsf.fishing.caught.new
tag @s[tag=veer.dsf.fishing.canRollForCatch,scores={veer.df.lure=3},predicate=veer:deep_fishing/lure_3_catch_chance] add veer.dsf.fishing.caught.new
# Debug
# execute if entity @s[tag=veer.dsf.fishing.canRollForCatch,scores={veer.df.lure=3}] run say Might have rerolled because of lure.
# Remove veer.dsf.fishing.canRollForCatch
tag @s remove veer.dsf.fishing.canRollForCatch
# and perminately mark as caught
tag @s[tag=veer.dsf.fishing.caught.new] add veer.dsf.fishing.caught

# If there should be a hologram, tag it. (Not if there's already a fish on the line)
tag @s[tag=!veer.dsf.fishing.offhandIsAir,tag=!veer.dsf.fishing.caught] add veer.dsf.fishing.doHologram

# If something is or was previous caught, what AI should it be given (Alive vs Other)
# Note: Currently cannot have bundles as anything but fish because of this.

execute if entity @s[tag=veer.dsf.fishing.caught.new] if entity @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1,predicate=veer:deep_fishing/mainhand_is_fish] run tag @s add veer.dsf.fishing.doLivingCatch
execute if entity @s[tag=veer.dsf.fishing.caught.new] if entity @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1,predicate=!veer:deep_fishing/mainhand_is_fish] run tag @s add veer.dsf.fishing.doNonlivingCatch
#If clam, convert to non-living ai
execute if entity @s[tag=veer.dsf.fishing.doLivingCatch,predicate=veer:deep_fishing/mainhand_is_clam] run tag @s add veer.dsf.fishing.doNonlivingCatch
execute if entity @s[tag=veer.dsf.fishing.doLivingCatch,predicate=veer:deep_fishing/mainhand_is_clam] run tag @s remove veer.dsf.fishing.doLivingCatch


#> Badly named header

# Only run these if something was caught
execute if entity @s[tag=veer.dsf.fishing.caught.new] run function veer:deep_fishing/internal/fishing-a

# If caught item is alive and the hand is not empty, run a function
execute if entity @s[tag=veer.dsf.fishing.caught,tag=veer.dsf.fishing.doLivingCatch] run function veer:deep_fishing/living_catch

# Holograms for when a fish is not caught
execute if entity @s[tag=veer.dsf.fishing.doHologram] run summon armor_stand ~ ~-1 ~ {Marker:1b,Small:1b,Invisible:1b,NoGravity:1b,Tags:["veer.deep_fishing.hologram","veer.deep_fishing.hologram.new"]}
execute if entity @s[tag=veer.dsf.fishing.doHologram] as @e[tag=veer.deep_fishing.hologram.new] run function veer:deep_fishing/summon_item_hologram

# debug
# data modify entity @s Glowing set value 1b

# Kill loot table target 
kill @e[type=armor_stand, tag=veer.dsf.fishing.helper]

# Remove tags which specify doing so
tag @s remove veer.dsf.fishing.caught.new
tag @s remove veer.dsf.fishing.offhandIsAir
tag @s remove veer.dsf.fishing.doHologram
tag @s remove veer.dsf.fishing.doNonlivingCatch
tag @s remove veer.dsf.hookedItem.new
tag @s remove veer.dsf.hookedItem.cur