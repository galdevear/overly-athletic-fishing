##
 # living_catch.mcfunction
 # 
 #
 # Created by Galdeveer.
##

#declare tag veer.deep_fishing.nonliving_catch.skipMotion

# Dunk item to indicate catch (only once)
data modify entity @s[tag=!veer.deep_fishing.nonliving_catch.skipMotion] Motion[1] set value -0.05
tag @s add veer.deep_fishing.nonliving_catch.skipMotion

# Make it so it despawns after a few second
data modify entity @s Time set value 5820s