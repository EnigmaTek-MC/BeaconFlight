data modify storage bf_iris:data EntityTag set from entity @s
execute if data storage bf_iris:data EntityTag{Small: 1b} run scoreboard players set $entity_width bf_iris 250000
execute if data storage bf_iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height bf_iris 987500
execute unless data storage bf_iris:data EntityTag{Small: 1b} run scoreboard players set $entity_width bf_iris 500000
execute unless data storage bf_iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height bf_iris 1975000
execute if data storage bf_iris:data EntityTag{Marker: 1b} store result score $entity_width bf_iris run scoreboard players set $entity_height bf_iris 0