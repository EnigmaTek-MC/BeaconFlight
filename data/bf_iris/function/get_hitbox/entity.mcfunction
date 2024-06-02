#> bf_iris:get_hitbox/entity
#
# Returns the shape of the executing entity
#
# @within bf_iris:raycast/test_for_entity
# @writes
#	storage bf_iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

# Get entity dimensions
scoreboard players set $entity_found bf_iris 0
execute if score $entity_found bf_iris matches 0 if entity @s[type=#bf_iris:tree/0] run function bf_iris:get_hitbox/entity/tree/0
execute if score $entity_found bf_iris matches 0 if entity @s[type=#bf_iris:tree/1] run function bf_iris:get_hitbox/entity/tree/1
execute if score $entity_found bf_iris matches 0 if entity @s[type=#bf_iris:tree/2] run function bf_iris:get_hitbox/entity/tree/2
execute if score $entity_found bf_iris matches 0 if entity @s[type=#bf_iris:tree/3] run function bf_iris:get_hitbox/entity/tree/3
execute if score $entity_found bf_iris matches 0 if entity @s[type=#bf_iris:tree/4] run function bf_iris:get_hitbox/entity/tree/4
execute if score $entity_found bf_iris matches 0 if entity @s[type=#bf_iris:tree/5] run function bf_iris:get_hitbox/entity/tree/5

# Scale
function bf_iris:get_hitbox/entity/scale
execute if predicate bf_iris:baby run scoreboard players operation $entity_width bf_iris /= $2 bf_iris
execute if predicate bf_iris:baby run scoreboard players operation $entity_height bf_iris /= $2 bf_iris

# Get the entity's coordinates
scoreboard players operation $entity_[x] bf_iris = $[x] bf_iris
scoreboard players operation $entity_[y] bf_iris = $[y] bf_iris
scoreboard players operation $entity_[z] bf_iris = $[z] bf_iris
scoreboard players operation $entity_{x} bf_iris = ${x} bf_iris
scoreboard players operation $entity_{y} bf_iris = ${y} bf_iris
scoreboard players operation $entity_{z} bf_iris = ${z} bf_iris
execute at @s summon minecraft:marker run function bf_iris:get_position/get_coordinates
scoreboard players operation $entity_[x] bf_iris >< $[x] bf_iris
scoreboard players operation $entity_[y] bf_iris >< $[y] bf_iris
scoreboard players operation $entity_[z] bf_iris >< $[z] bf_iris
scoreboard players operation $entity_{x} bf_iris >< ${x} bf_iris
scoreboard players operation $entity_{y} bf_iris >< ${y} bf_iris
scoreboard players operation $entity_{z} bf_iris >< ${z} bf_iris

# Save how many blocks away the entity is from the block origin
scoreboard players operation $entity_dx bf_iris = $entity_[x] bf_iris
scoreboard players operation $entity_dx bf_iris -= $[x] bf_iris
scoreboard players operation $entity_dx bf_iris *= $1000000 bf_iris
scoreboard players operation $entity_dx bf_iris += $entity_{x} bf_iris
scoreboard players operation $entity_dy bf_iris = $entity_[y] bf_iris
scoreboard players operation $entity_dy bf_iris -= $[y] bf_iris
scoreboard players operation $entity_dy bf_iris *= $1000000 bf_iris
scoreboard players operation $entity_dy bf_iris += $entity_{y} bf_iris
scoreboard players operation $entity_dz bf_iris = $entity_[z] bf_iris
scoreboard players operation $entity_dz bf_iris -= $[z] bf_iris
scoreboard players operation $entity_dz bf_iris *= $1000000 bf_iris
scoreboard players operation $entity_dz bf_iris += $entity_{z} bf_iris

# Get the coordinates of the bounding box
scoreboard players operation $entity_half_width bf_iris = $entity_width bf_iris
scoreboard players operation $entity_half_width bf_iris /= $2 bf_iris
scoreboard players operation $entity_x0 bf_iris = $entity_dx bf_iris
scoreboard players operation $entity_x0 bf_iris -= $entity_half_width bf_iris
execute if score $entity_x0 bf_iris matches ..0 run scoreboard players set $entity_x0 bf_iris 0
scoreboard players operation $entity_y0 bf_iris = $entity_dy bf_iris
execute if score $entity_y0 bf_iris matches ..0 run scoreboard players set $entity_y0 bf_iris 0
scoreboard players operation $entity_z0 bf_iris = $entity_dz bf_iris
scoreboard players operation $entity_z0 bf_iris -= $entity_half_width bf_iris
execute if score $entity_z0 bf_iris matches ..0 run scoreboard players set $entity_z0 bf_iris 0
scoreboard players operation $entity_x1 bf_iris = $entity_dx bf_iris
scoreboard players operation $entity_x1 bf_iris += $entity_half_width bf_iris
execute if score $entity_x1 bf_iris matches 1000000.. run scoreboard players set $entity_x1 bf_iris 1000000
scoreboard players operation $entity_y1 bf_iris = $entity_dy bf_iris
scoreboard players operation $entity_y1 bf_iris += $entity_height bf_iris
execute if score $entity_y1 bf_iris matches 1000000.. run scoreboard players set $entity_y1 bf_iris 1000000
scoreboard players operation $entity_z1 bf_iris = $entity_dz bf_iris
scoreboard players operation $entity_z1 bf_iris += $entity_half_width bf_iris
execute if score $entity_z1 bf_iris matches 1000000.. run scoreboard players set $entity_z1 bf_iris 1000000

# Store these coordinates to storage
data modify storage bf_iris:data Shape append value {type: "ENTITY", min: [0.0, 0.0, 0.0], max: [0.0, 0.0, 0.0]}
execute store result storage bf_iris:data Shape[-1].min[0] double 0.000001 run scoreboard players get $entity_x0 bf_iris
execute store result storage bf_iris:data Shape[-1].min[1] double 0.000001 run scoreboard players get $entity_y0 bf_iris
execute store result storage bf_iris:data Shape[-1].min[2] double 0.000001 run scoreboard players get $entity_z0 bf_iris
execute store result storage bf_iris:data Shape[-1].max[0] double 0.000001 run scoreboard players get $entity_x1 bf_iris
execute store result storage bf_iris:data Shape[-1].max[1] double 0.000001 run scoreboard players get $entity_y1 bf_iris
execute store result storage bf_iris:data Shape[-1].max[2] double 0.000001 run scoreboard players get $entity_z1 bf_iris

# Special case for item frames and paintings which are annoying
execute if score $entity_found bf_iris matches 0 store success score $entity_found bf_iris store success score $entity.is_item_frame bf_iris if entity @s[type=#bf_iris:item_frames]
execute if score $entity.is_item_frame bf_iris matches 1 run function bf_iris:get_hitbox/entity/item_frame

# Give this entity a tag and an ID, and store the ID in the hitbox
tag @s add bf_iris.possible_target
scoreboard players operation @s bf_iris.id = $max_entity_id bf_iris.id
execute store result storage bf_iris:data Shape[-1].entity_id int 1 run scoreboard players get @s bf_iris.id
scoreboard players add $max_entity_id bf_iris.id 1
