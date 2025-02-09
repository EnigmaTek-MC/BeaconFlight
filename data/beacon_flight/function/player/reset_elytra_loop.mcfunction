execute store result score $slot beacon_flight.__vars__ run data get storage beacon_flight:data slots[0]
execute unless score $slot beacon_flight.__vars__ matches 0..35 run data remove storage beacon_flight:data slots[0]
execute unless score $slot beacon_flight.__vars__ matches 0..35 run return run function beacon_flight:player/reset_elytra_loop

execute store result storage beacon_flight:macro arg2 int 1 run scoreboard players get $slot beacon_flight.__vars__
execute summon minecraft:item_display run function beacon_flight:player/reset_elytra_entity with storage beacon_flight:macro

data remove storage beacon_flight:data slots[0]
execute if data storage beacon_flight:data slots[0] run return run function beacon_flight:player/reset_elytra_loop