advancement revoke @s only beacon_flight:place_beacon

execute anchored eyes positioned ^ ^ ^ run function bf_iris:get_target
execute unless data storage bf_iris:output {TargetType: "BLOCK"} run return run tellraw @s {"text":"Failed to mark beacon - this beacon will not work for beacon flight\nBreak and replace the beacon to retry","color": "red"}

execute at @e[type=minecraft:marker,tag=bf_iris.targeted_block,limit=1] if block ~ ~ ~ minecraft:beacon run return run summon minecraft:marker ~ ~ ~ {Tags:["beacon_flight.beacon_marker"]}
tellraw @s {"text":"Failed to mark beacon - this beacon will not work for beacon flight\nBreak and replace the beacon to retry","color": "red"}