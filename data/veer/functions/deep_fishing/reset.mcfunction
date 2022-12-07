##
 # reset.mcfunction
 # deep_fishing
 #
 # Created by Galdeveer.
##

schedule clear veer:deep_fishing/schedule
schedule clear veer:deep_fishing/fix_caught_item_despawn
# schedule clear veer:deep_fishing/schedule_a
schedule function veer:deep_fishing/schedule 1t append
schedule function veer:deep_fishing/fix_caught_item_despawn 1t append
# schedule function veer:deep_fishing/schedule_a 1t append


scoreboard objectives add veer.df.los dummy "Luck of the Sea"
scoreboard objectives add veer.df.lure dummy "Lure"