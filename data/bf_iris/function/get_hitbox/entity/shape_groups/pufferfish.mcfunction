execute store result score $pufferfish_puffstate bf_iris run data get entity @s PuffState
execute if score $pufferfish_puffstate bf_iris matches 0 run scoreboard players set $entity_width bf_iris 350000
execute if score $pufferfish_puffstate bf_iris matches 1 run scoreboard players set $entity_width bf_iris 500000
execute if score $pufferfish_puffstate bf_iris matches 2 run scoreboard players set $entity_width bf_iris 700000
scoreboard players operation $entity_height bf_iris = $entity_width bf_iris

