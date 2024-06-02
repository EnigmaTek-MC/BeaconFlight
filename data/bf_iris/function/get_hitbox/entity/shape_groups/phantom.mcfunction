scoreboard players set $entity_width bf_iris 900000
scoreboard players set $entity_height bf_iris 500000

execute store result score $phantom_size bf_iris run data get entity @s Size
execute if score $phantom_size bf_iris matches 0 run return 0
scoreboard players set $phantom_extra_width bf_iris 135000
scoreboard players operation $phantom_extra_width bf_iris *= $phantom_size bf_iris
scoreboard players operation $entity_width bf_iris += $phantom_extra_width bf_iris
scoreboard players set $phantom_extra_height bf_iris 75000
scoreboard players operation $phantom_extra_height bf_iris *= $phantom_size bf_iris
scoreboard players operation $entity_height bf_iris += $phantom_extra_height bf_iris
