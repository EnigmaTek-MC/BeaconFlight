attribute @s minecraft:gravity modifier remove beacon_flight:no_gravity
attribute @s minecraft:gravity modifier remove beacon_flight:boost

scoreboard players set @s beacon_flight.active 2
execute if items entity @s armor.chest minecraft:elytra[!minecraft:glider={}] run function beacon_flight:player/reset_elytra

execute if predicate beacon_flight:on_ground run function beacon_flight:player/deactivate_fd_reduction
return 1