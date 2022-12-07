##
 # tag_fishing_bobber_with_fishing_rod_enchants.mcfunction
 # 
 #
 # Created by Galdeveer.
##

#>
#@internal
#declare tag veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber 

# tag
tag @s add veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber

# Call routing function
execute at @s as @p run function veer:deep_fishing/tag_fishing_bobber_with_fishing_rod_enchants/route

# untag
tag @s remove veer.deep_fishing.tag_fishing_bobber_with_fishing_rod_enchants.fishing_bobber