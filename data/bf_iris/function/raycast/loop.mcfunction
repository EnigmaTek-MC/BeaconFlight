#> bf_iris:raycast/loop
#
# Loops forward until an obstacle is hit or until the maximum recursion depth has been reached
#
# @context a marker and the current ray position
# @within bf_iris:get_target
# @within bf_iris:raycast/loop

# Test for collisions
execute store success score $block_hit bf_iris store result score $block_distance bf_iris run function bf_iris:raycast/test_for_block
execute store success score $entity_hit bf_iris store result score $entity_distance bf_iris run function bf_iris:raycast/test_for_entity
execute if score $block_hit bf_iris matches 1 run return run function bf_iris:raycast/on_hit
execute if score $entity_hit bf_iris matches 1 run return run function bf_iris:raycast/on_hit

# Proceed to the next block
execute store result score $to_next_block bf_iris run function bf_iris:raycast/find_next_block
scoreboard players operation $total_distance bf_iris += $to_next_block bf_iris

# Fail if the maximum recursion depth is reached and nothing was found
scoreboard players add $depth bf_iris 1
execute if score $depth bf_iris = $max_depth bf_iris run tag @s remove bf_iris.executing
execute if score $depth bf_iris = $max_depth bf_iris run return fail

# Otherwise, loop this function at the next block
execute if data storage bf_iris:data {NextCoordinateChange: "x"} if score $dx bf_iris matches 0.. positioned ~1 ~ ~ run return run function bf_iris:raycast/loop
execute if data storage bf_iris:data {NextCoordinateChange: "x"} if score $dx bf_iris matches ..-1 positioned ~-1 ~ ~ run return run function bf_iris:raycast/loop
execute if data storage bf_iris:data {NextCoordinateChange: "y"} if score $dy bf_iris matches 0.. positioned ~ ~1 ~ run return run function bf_iris:raycast/loop
execute if data storage bf_iris:data {NextCoordinateChange: "y"} if score $dy bf_iris matches ..-1 positioned ~ ~-1 ~ run return run function bf_iris:raycast/loop
execute if data storage bf_iris:data {NextCoordinateChange: "z"} if score $dz bf_iris matches 0.. positioned ~ ~ ~1 run return run function bf_iris:raycast/loop
execute if data storage bf_iris:data {NextCoordinateChange: "z"} if score $dz bf_iris matches ..-1 positioned ~ ~ ~-1 run return run function bf_iris:raycast/loop
execute if score $depth bf_iris < $max_depth bf_iris at @s run return run function bf_iris:raycast/loop
