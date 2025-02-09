execute if score @s beacon_flight.active matches 1 run return fail

attribute @s minecraft:safe_fall_distance modifier add beacon_flight:safe_fall 1024 add_value

execute store result storage beacon_flight:macro gravity double -0.001 run attribute @s minecraft:gravity get 1000
function beacon_flight:player/nullify with storage beacon_flight:macro
data remove storage beacon_flight:data gravity

scoreboard players set @s beacon_flight.active 1

return 1