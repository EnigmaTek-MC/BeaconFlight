execute unless block ~ ~ ~ minecraft:beacon run return run kill @s
execute unless predicate beacon_flight:has_beam run return fail
execute if data block ~ ~ ~ {Levels:0} run return fail
# execute unless data block ~ ~ ~ primary_effect run return 0

# Horizontal offset
execute store result score $range beacon_flight.__vars__ store result score $duration beacon_flight.__vars__ run data get block ~ ~ ~ Levels
scoreboard players operation $range beacon_flight.__vars__ *= #10 beacon_flight.__vars__
execute store result storage beacon_flight:macro macro.offset int 1 run scoreboard players operation $range beacon_flight.__vars__ += #10 beacon_flight.__vars__

# Vertical range
scoreboard players operation $y_range beacon_flight.__vars__ = $range beacon_flight.__vars__
execute store result storage beacon_flight:macro macro.y_range int 1 run scoreboard players add $y_range beacon_flight.__vars__ 384

# Horizontal range (after offset)
scoreboard players operation $range beacon_flight.__vars__ *= #2 beacon_flight.__vars__
execute store result storage beacon_flight:macro macro.range int 1 run scoreboard players add $range beacon_flight.__vars__ 1

scoreboard players operation $duration beacon_flight.__vars__ *= #2 beacon_flight.__vars__
scoreboard players add $duration beacon_flight.__vars__ 9
execute store result storage beacon_flight:macro macro.duration int 1 run scoreboard players operation $duration beacon_flight.__vars__ *= #20 beacon_flight.__vars__

function beacon_flight:marker/activate_range with storage beacon_flight:macro macro
# data remove storage beacon_flight:macro macro