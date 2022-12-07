##
 # offhand.mcfunction.mcfunction
 # 
 #
 # Created by .
##
##
 # offhand.mcfunction
 # 
 #
 # Created by Galdeveer.
##

#todo: convert to scoreboard

execute if predicate veer:deep_fishing/enchants/offhand_has_luck_of_the_sea_1 run scoreboard players set @s veer.df.los 1
execute if predicate veer:deep_fishing/enchants/offhand_has_luck_of_the_sea_2 run scoreboard players set @s veer.df.los 2
execute if predicate veer:deep_fishing/enchants/offhand_has_luck_of_the_sea_3 run scoreboard players set @s veer.df.los 3

execute if predicate veer:deep_fishing/enchants/offhand_has_lure_1 run scoreboard players set @s veer.df.lure 1
execute if predicate veer:deep_fishing/enchants/offhand_has_lure_2 run scoreboard players set @s veer.df.lure 2
execute if predicate veer:deep_fishing/enchants/offhand_has_lure_3 run scoreboard players set @s veer.df.lure 3