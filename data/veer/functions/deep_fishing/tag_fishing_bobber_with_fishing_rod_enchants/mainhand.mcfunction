##
 # mainhand.mcfunction
 # 
 #
 # Created by Galdeveer.
##

#declare entity @e[type=item,tag=veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber] tagged bobber to be given scoreboard values

#todo: convert to scoreboard values

execute if predicate veer:deep_fishing/enchants/mainhand_has_luck_of_the_sea_1 run scoreboard players set @e[type=fishing_bobber,tag=veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber] veer.df.los 1
execute if predicate veer:deep_fishing/enchants/mainhand_has_luck_of_the_sea_2 run scoreboard players set @e[type=fishing_bobber,tag=veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber] veer.df.los 2
execute if predicate veer:deep_fishing/enchants/mainhand_has_luck_of_the_sea_3 run scoreboard players set @e[type=fishing_bobber,tag=veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber] veer.df.los 3

execute if predicate veer:deep_fishing/enchants/mainhand_has_lure_1 run scoreboard players set @e[type=fishing_bobber,tag=veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber] veer.df.lure 1
execute if predicate veer:deep_fishing/enchants/mainhand_has_lure_2 run scoreboard players set @e[type=fishing_bobber,tag=veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber] veer.df.lure 2
execute if predicate veer:deep_fishing/enchants/mainhand_has_lure_3 run scoreboard players set @e[type=fishing_bobber,tag=veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber] veer.df.lure 3

# execute as @e[scores={veer.df.lure=3}] run say hi
# say hi as well