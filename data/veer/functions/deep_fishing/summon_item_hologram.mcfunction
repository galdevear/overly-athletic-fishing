##
 # summon_item_hologram.mcfunction
 #
 # Currently unmodular
 # Created by Galdeveer.
##

#declare tag veer.dsf.hologram.x_pos
#declare tag veer.dsf.hologram.x_neg
#declare tag veer.dsf.hologram.z_pos
#declare tag veer.dsf.hologram.z_neg

#declare tag veer.deep_fishing.hologram
#prevents multiplayer conflicts.
#TODO: Change new to cur
#declare tag veer.deep_fishing.hologram.new


tag @s[predicate=veer:deep_fishing/rng/50] add veer.dsf.hologram.x_pos
tag @s[predicate=veer:deep_fishing/rng/50] add veer.dsf.hologram.x_neg
tag @s[predicate=veer:deep_fishing/rng/50] add veer.dsf.hologram.z_pos
tag @s[predicate=veer:deep_fishing/rng/50] add veer.dsf.hologram.z_neg

#todo randomize offset and motion

execute at @s run tp @s[tag=veer.dsf.hologram.x_pos, tag=!veer.dsf.hologram.x_neg] ~1.5 ~ ~ facing ~ ~ ~
execute at @s run tp @s[tag=!veer.dsf.hologram.x_pos, tag=veer.dsf.hologram.x_neg] ~-1.5 ~ ~ facing ~ ~ ~
execute at @s run tp @s[tag=veer.dsf.hologram.z_pos, tag=!veer.dsf.hologram.z_neg] ~ ~ ~1.5 facing ~ ~ ~
execute at @s run tp @s[tag=!veer.dsf.hologram.z_pos, tag=veer.dsf.hologram.z_neg] ~ ~ ~-1.5 facing ~ ~ ~

# execute at @e[tag=veer.deep_fishing.hologram.new,limit=1] run teleport @e[tag=veer.deep_fishing.hologram,limit=1] ~ ~ ~ facing entity @s

#TODO: Convert to parameter
data modify entity @e[type=armor_stand,tag=veer.deep_fishing.hologram.new,limit=1] HandItems[0] set from entity @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] HandItems[0]

# debug
# effect give @e[type=armor_stand,tag=veer.deep_fishing.hologram.new] glowing 

tag @e[type=armor_stand,tag=veer.deep_fishing.hologram.new] remove veer.deep_fishing.hologram.new