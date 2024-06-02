execute unless score @s beacon_flight.active matches 1 run function beacon_flight:player/activate

attribute @s minecraft:generic.gravity modifier remove beacon_flight:boost
attribute @s minecraft:generic.gravity modifier add beacon_flight:boost -0.025 add_value
scoreboard players set @s beacon_flight.active 1