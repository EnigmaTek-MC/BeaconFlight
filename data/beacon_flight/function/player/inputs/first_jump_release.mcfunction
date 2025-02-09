scoreboard players set @s beacon_flight.space_state 2

execute if score @s beacon_flight.active matches 1 run function beacon_flight:player/reset_boost