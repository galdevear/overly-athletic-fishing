##
 # tag_fishing_bobber_with_fishing_rod_enchants.mcfunction
 # 
 # @s[type=player]
 #
 # Created by Galdeveer.
##

execute as @s[predicate=veer:deep_fishing/fishing_rod_is_in_mainhand] run function veer:deep_fishing/tag_fishing_bobber_with_fishing_rod_enchants/mainhand
execute as @s[predicate=!veer:deep_fishing/fishing_rod_is_in_mainhand] run function veer:deep_fishing/tag_fishing_bobber_with_fishing_rod_enchants/offhand