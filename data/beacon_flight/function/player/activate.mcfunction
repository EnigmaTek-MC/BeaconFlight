attribute @s generic.safe_fall_distance modifier add beacon_flight:safe_fall 1024 add_value

execute store result storage beacon_flight:macro gravity double -0.001 run attribute @s minecraft:generic.gravity get 1000
function beacon_flight:player/nullify with storage beacon_flight:macro
data remove storage beacon_flight:data gravity