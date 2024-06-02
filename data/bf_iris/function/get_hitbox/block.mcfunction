#> bf_iris:get_hitbox/block
#
# Returns the shape of the current block
#
# @within bf_iris:raycast/test_for_block
# @output
#	storage bf_iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

execute if block ~ ~ ~ #bf_iris:tree/0 run return run function bf_iris:get_hitbox/block/tree/0
execute if block ~ ~ ~ #bf_iris:tree/1 run return run function bf_iris:get_hitbox/block/tree/1
execute if block ~ ~ ~ #bf_iris:tree/2 run return run function bf_iris:get_hitbox/block/tree/2
execute if block ~ ~ ~ #bf_iris:tree/3 run return run function bf_iris:get_hitbox/block/tree/3
execute if block ~ ~ ~ #bf_iris:tree/4 run return run function bf_iris:get_hitbox/block/tree/4
