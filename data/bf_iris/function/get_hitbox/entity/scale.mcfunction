#> bf_iris:get_hitbox/entity/scale
#
# Scales a living entity according to its generic.scale attribute
#
# @within bf_iris:get_hitbox/entity

execute store result score $attribute_scale bf_iris run attribute @s minecraft:scale get 1000
execute if score $attribute_scale bf_iris matches 0 run return fail
execute if score $attribute_scale bf_iris matches 1000 run return 0

scoreboard players operation $entity_width bf_iris /= $10 bf_iris
scoreboard players operation $entity_width bf_iris *= $attribute_scale bf_iris
scoreboard players operation $entity_width bf_iris /= $100 bf_iris

scoreboard players operation $entity_height bf_iris /= $10 bf_iris
scoreboard players operation $entity_height bf_iris *= $attribute_scale bf_iris
scoreboard players operation $entity_height bf_iris /= $100 bf_iris
