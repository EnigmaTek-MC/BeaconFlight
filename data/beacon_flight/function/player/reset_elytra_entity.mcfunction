item replace entity @s contents from entity @p[tag=beacon_flight.operator] armor.chest
data remove entity @s item.components."!minecraft:glider"
item replace entity @p[tag=beacon_flight.operator] armor.chest from entity @s contents
kill @s