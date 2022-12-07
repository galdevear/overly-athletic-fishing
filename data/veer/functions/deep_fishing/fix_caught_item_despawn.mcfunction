##
 # fix_caught_item_despawn.mcfunction
 # Reeled in items reset the time until they despawn. This ensures they despawn within 6 seconds 
 #
 # Created by Galdeveer.
##

schedule function veer:deep_fishing/fix_caught_item_despawn 2s

kill @e[type=item,tag=veer.deep_fishing.schedule.despawn.t-0]
tag @e[type=item,tag=veer.deep_fishing.schedule.despawn.t-1] add veer.deep_fishing.schedule.despawn.t-0
tag @e[type=item,tag=veer.deep_fishing.schedule.despawn.t-2] add veer.deep_fishing.schedule.despawn.t-1
tag @e[type=item,tag=veer.deep_fishing.nonliving_catch.item] add veer.deep_fishing.schedule.despawn.t-2
tag @e[type=item,tag=veer.dsf.fishing.caught] add veer.deep_fishing.schedule.despawn.t-2