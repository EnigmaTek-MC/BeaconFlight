#> bf_iris:raycast/check_intersection/loop
#
# Tests for ray-box intersections with all axis-aligned bounding boxes of a hitbox
#
# @reads
#   storage bf_iris:data Shape
#       A list of axis-aligned bounding boxes of the form {min: [x, y, z], max: [x, y, z]}
# @output
#   Success: 1 if a box is hit, 0 otherwise
#   Result: the distance to the first box that is hit
# @private
# @within bf_iris:raycast/test_for_block
# @within bf_iris:raycast/test_for_entity
# @within bf_iris:raycast/check_intersection/loop

# Test for intersection with a single bounding box
data modify storage bf_iris:data Box set from storage bf_iris:data Shape[-1]
data remove storage bf_iris:data Shape[-1]
execute store success score $is_hit bf_iris store result score $distance bf_iris run function bf_iris:raycast/check_intersection/ray_box

# If this box is indeed hit before any other this far, remember the targeted box and the targeted face
execute if score $is_hit bf_iris matches 1 if score $distance bf_iris >= $min_distance bf_iris run scoreboard players set $is_hit bf_iris 0
execute if score $is_hit bf_iris matches 1 run data modify storage bf_iris:data TargetedBox set from storage bf_iris:data Box
execute if score $is_hit bf_iris matches 1 if score $hits_x_face bf_iris matches 1 if score $to_aabb bf_iris = $to_x_face bf_iris run data modify storage bf_iris:data TargetedFace set from storage bf_iris:data Faces[0]
execute if score $is_hit bf_iris matches 1 if score $hits_y_face bf_iris matches 1 if score $to_aabb bf_iris = $to_y_face bf_iris run data modify storage bf_iris:data TargetedFace set from storage bf_iris:data Faces[1]
execute if score $is_hit bf_iris matches 1 if score $hits_z_face bf_iris matches 1 if score $to_aabb bf_iris = $to_z_face bf_iris run data modify storage bf_iris:data TargetedFace set from storage bf_iris:data Faces[2]
execute if score $is_hit bf_iris matches 1 run scoreboard players operation $min_distance bf_iris = $distance bf_iris

# Loop this function until all boxes have been analyzed
execute if data storage bf_iris:data Shape[-1] run return run function bf_iris:raycast/check_intersection/loop
execute if score $min_distance bf_iris matches 2147483647 run return fail
scoreboard players operation $min_distance bf_iris *= $1000 bf_iris
return run scoreboard players get $min_distance bf_iris
