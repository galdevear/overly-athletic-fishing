##
 # transferEnchantmentTags.mcfunction
 #
 # @s[type=fishing_bobber] 
 #
 # Created by Galdeveer.
##
# say transfer_enchant_tags_to_item

#>@private
#declare entity @e[type=item,tag=veer.dsf.hookedItem.cur]

#For lure, higher level gets all lower level ones
scoreboard players operation @e[type=item,tag=veer.dsf.hookedItem.cur] veer.df.lure = @s veer.df.lure

#Debug
# execute if entity @s[scores={veer.df.lure=3}] run say transfer_enchant_tags_to_item lure = 3

#Luck of the Sea
scoreboard players operation @e[type=item,tag=veer.dsf.hookedItem.cur] veer.df.los = @s veer.df.los