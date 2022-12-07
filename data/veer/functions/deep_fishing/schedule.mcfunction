##
 # schedule.mcfunction
 # 
 #
 # Created by Galdeveer.
##

#declare tag veer.deep_fishing.fishing_bobber.new
#define tag veer.deep_fishing.fishing_bobber
#define tag veer.deep_fishing.luck_of_the_sea_1
#define tag veer.deep_fishing.luck_of_the_sea_2
#define tag veer.deep_fishing.luck_of_the_sea_3
#define tag veer.deep_fishing.lure_1
#define tag veer.deep_fishing.lure_2
#define tag veer.deep_fishing.lure_3
#declare tag veer.deep_fishing.hologram 

# Set schedule to continue looping
schedule function veer:deep_fishing/schedule 2s append

# Kill fishing holograms
kill @e[type=armor_stand,tag=veer.deep_fishing.hologram]

# Tag new fishing bobbers
tag @e[type=fishing_bobber,tag=!veer.deep_fishing.fishing_bobber] add veer.deep_fishing.fishing_bobber.new
# Tag it so it only gets initialized once
tag @e[type=fishing_bobber,tag=!veer.deep_fishing.fishing_bobber] add veer.deep_fishing.fishing_bobber

#TODO: Fix so its not on a two second interval
#initialize bobber
execute as @e[type=fishing_bobber,tag=veer.deep_fishing.fishing_bobber.new] run function veer:deep_fishing/tag_fishing_bobber_with_fishing_rod_enchants
# remove new tag
tag @e[type=fishing_bobber,tag=veer.deep_fishing.fishing_bobber.new] remove veer.deep_fishing.fishing_bobber.new

# run fishing commands as the hooked item
#TODO: move enchant info stored on bobber to hooked item
execute at @e[type=fishing_bobber] as @e[type=item,distance=..0.3,tag=!global.ignore,tag=!global.ignore.pos] at @s run function veer:deep_fishing/fishing