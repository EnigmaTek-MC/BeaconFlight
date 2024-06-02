scoreboard players set $entity_width bf_iris 510000
scoreboard players set $entity_height bf_iris 510000
execute store result score $slime_size bf_iris run data get entity @s Size
scoreboard players add $slime_size bf_iris 1
scoreboard players operation $entity_width bf_iris *= $slime_size bf_iris
scoreboard players operation $entity_height bf_iris *= $slime_size bf_iris
