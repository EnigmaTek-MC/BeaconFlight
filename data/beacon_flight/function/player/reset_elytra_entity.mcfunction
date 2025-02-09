$item replace entity @s contents from entity @p[tag=beacon_flight.operator] $(arg1)$(arg2)
data remove entity @s item.components."!minecraft:glider"
$item replace entity @p[tag=beacon_flight.operator] $(arg1)$(arg2) from entity @s contents
kill @s