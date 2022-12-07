##
 # fishing-a.mcfunction
 # 
 #
 # Created by Galdeveer.
##

# Convert hooked item to catch result (helper mainhand) if catch chance succeeded
data modify entity @s Item set from entity @e[limit=1,type=armor_stand,tag=veer.dsf.fishing.helper] HandItems[0]

# if caught item is not alive and the is not empty, run a function (Only once)
execute if entity @s[tag=veer.dsf.fishing.doNonlivingCatch] run function veer:deep_fishing/nonliving_catch