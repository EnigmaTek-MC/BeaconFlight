scoreboard players remove @s beacon_flight.timer 1
execute if score @s beacon_flight.timer matches 0 run function beacon_flight:player/deactivate
execute if score @s beacon_flight.timer matches 0 run scoreboard players set @s beacon_flight.timer -1