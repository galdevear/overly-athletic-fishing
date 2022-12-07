##
 # living_catch.mcfunction
 # 
 #
 # Created by .
##

#declare tag veer.dsf.living_catch.x_pos
#declare tag veer.dsf.living_catch.x_neg
#declare tag veer.dsf.living_catch.z_pos
#declare tag veer.dsf.living_catch.z_neg
#declare tag veer.dsf.living_catch.y_pos
#declare tag veer.dsf.living_catch.y_neg
#declare tag veer.dsf.living_catch.x_mag_low
#declare tag veer.dsf.living_catch.y_mag_low
#declare tag veer.dsf.living_catch.z_mag_low
#>@private
#define tag veer.dsf.living_catch.skipSettingTime

#>Section 1

tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.x_pos
tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.x_neg
tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.z_pos
tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.z_neg
tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.y_pos
tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.y_neg

tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.x_mag_low
tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.y_mag_low
tag @s[predicate=veer:deep_fishing/living_catch_motion_chance] add veer.dsf.living_catch.z_mag_low


data modify entity @s[tag=veer.dsf.living_catch.x_pos,tag=!veer.dsf.living_catch.x_neg] Motion[0] set value 0.7
data modify entity @s[tag=!veer.dsf.living_catch.x_pos,tag=veer.dsf.living_catch.x_neg] Motion[0] set value -0.7
data modify entity @s[tag=veer.dsf.living_catch.z_pos,tag=!veer.dsf.living_catch.z_neg] Motion[2] set value 0.7
data modify entity @s[tag=!veer.dsf.living_catch.z_pos,tag=veer.dsf.living_catch.z_neg] Motion[2] set value -0.7

data modify entity @s[tag=veer.dsf.living_catch.x_pos,tag=!veer.dsf.living_catch.x_neg,tag=veer.dsf.living_catch.x_mag_low] Motion[0] set value 0.5
data modify entity @s[tag=!veer.dsf.living_catch.x_pos,tag=veer.dsf.living_catch.x_neg,tag=veer.dsf.living_catch.x_mag_low] Motion[0] set value -0.5
data modify entity @s[tag=veer.dsf.living_catch.z_pos,tag=!veer.dsf.living_catch.z_neg,tag=veer.dsf.living_catch.z_mag_low] Motion[2] set value 0.5
data modify entity @s[tag=!veer.dsf.living_catch.z_pos,tag=veer.dsf.living_catch.z_neg,tag=veer.dsf.living_catch.z_mag_low] Motion[2] set value -0.5

data modify entity @s[tag=veer.dsf.living_catch.y_pos,tag=!veer.dsf.living_catch.y_neg] Motion[1] set value 0.7
#Note: Unless[!] means or
#Create y motion if it is in water and/or it is raining
execute at @s unless entity @s[predicate=!veer:deep_fishing/in_water,predicate=!veer:deep_fishing/is_raining] run data modify entity @s[tag=veer.dsf.living_catch.y_pos,tag=!veer.dsf.living_catch.y_neg,tag=veer.dsf.living_catch.y_mag_low] Motion[1] set value 0.5
data modify entity @s[tag=!veer.dsf.living_catch.y_pos,tag=veer.dsf.living_catch.y_neg] Motion[1] set value -0.4

# remove
tag @s remove veer.dsf.living_catch.x_neg
tag @s remove veer.dsf.living_catch.x_pos
tag @s remove veer.dsf.living_catch.z_neg
tag @s remove veer.dsf.living_catch.z_pos
tag @s remove veer.dsf.living_catch.y_pos
tag @s remove veer.dsf.living_catch.y_neg
tag @s remove veer.dsf.living_catch.x_mag_low
tag @s remove veer.dsf.living_catch.y_mag_low
tag @s remove veer.dsf.living_catch.z_mag_low


#>Section 2

# Make it so it despawns after a few second
data modify entity @s[tag=!veer.dsf.living_catch.skipSettingTime] Time set value 5800s

# Never remove this tag. It ensures the despawn time is set only once in a while
tag @s add veer.dsf.living_catch.skipSettingTime