##
 # transferEnchantmentTags.mcfunction
 #
 # @s[type=fishing_bobber] 
 #
 # Created by Galdeveer.
##
say transfer_enchant_tags

#For lure, higher level gets all lower level ones
execute if entity @s[scores={veer.df.lure=1}] run tag @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] add veer.deep_fishing.lure_1
execute if entity @s[scores={veer.df.lure=2}] run tag @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] add veer.deep_fishing.lure_2
execute if entity @s[scores={veer.df.lure=3}] run tag @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] add veer.deep_fishing.lure_3

#Debug
# execute if entity @s[scores={veer.df.lure=3}] run say howdy

#Luck of the Sea
execute if entity @s[scores={veer.df.los=1}] run tag @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] add veer.deep_fishing.luck_of_the_sea_1
execute if entity @s[scores={veer.df.los=2}] run tag @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] add veer.deep_fishing.luck_of_the_sea_2
execute if entity @s[scores={veer.df.los=3}] run tag @e[type=armor_stand,tag=veer.dsf.fishing.helper,limit=1] add veer.deep_fishing.luck_of_the_sea_3