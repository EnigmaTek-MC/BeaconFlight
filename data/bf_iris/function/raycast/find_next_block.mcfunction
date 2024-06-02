#> bf_iris:raycast/find_next_block
#
# Find the coordinates of the next tile that should be traversed by the ray
#
# @private
# @within bf_iris:raycast/loop
# @writes
#   scores $[x] $[y] $[z] bf_iris
#       The new position
#   scores $last_[x] $last_[y] $last_[z] bf_iris
#       The previous position
# @output
#   Result: The distance to the next block
#   Success: 1

# Save previous coordinates
scoreboard players operation $last_[x] bf_iris = $[x] bf_iris
scoreboard players operation $last_[y] bf_iris = $[y] bf_iris
scoreboard players operation $last_[z] bf_iris = $[z] bf_iris

# See what distance the ray needs to travel to hit another tile with a different x coordinate
execute if score $dx bf_iris matches 0.. run scoreboard players set $to_next_x bf_iris 1000000000
execute if score $dx bf_iris matches ..-1 run scoreboard players set $to_next_x bf_iris 0
scoreboard players operation ${x}*1000 bf_iris = ${x} bf_iris
scoreboard players operation ${x}*1000 bf_iris *= $1000 bf_iris
scoreboard players operation $to_next_x bf_iris -= ${x}*1000 bf_iris
scoreboard players operation $to_next_x bf_iris /= $dx bf_iris

# See what distance the ray needs to travel to hit another tile with a different y coordinate
execute if score $dy bf_iris matches 0.. run scoreboard players set $to_next_y bf_iris 1000000000
execute if score $dy bf_iris matches ..-1 run scoreboard players set $to_next_y bf_iris 0
scoreboard players operation ${y}*1000 bf_iris = ${y} bf_iris
scoreboard players operation ${y}*1000 bf_iris *= $1000 bf_iris
scoreboard players operation $to_next_y bf_iris -= ${y}*1000 bf_iris
scoreboard players operation $to_next_y bf_iris /= $dy bf_iris

# See what distance the ray needs to travel to hit another tile with a different z coordinate
execute if score $dz bf_iris matches 0.. run scoreboard players set $to_next_z bf_iris 1000000000
execute if score $dz bf_iris matches ..-1 run scoreboard players set $to_next_z bf_iris 0
scoreboard players operation ${z}*1000 bf_iris = ${z} bf_iris
scoreboard players operation ${z}*1000 bf_iris *= $1000 bf_iris
scoreboard players operation $to_next_z bf_iris -= ${z}*1000 bf_iris
scoreboard players operation $to_next_z bf_iris /= $dz bf_iris

# Determine which distance is the shortest
execute if score $to_next_x bf_iris <= $to_next_y bf_iris if score $to_next_x bf_iris <= $to_next_z bf_iris run data merge storage bf_iris:data {NextCoordinateChange: "x"}
execute if score $to_next_y bf_iris <= $to_next_x bf_iris if score $to_next_y bf_iris <= $to_next_z bf_iris run data merge storage bf_iris:data {NextCoordinateChange: "y"}
execute if score $to_next_z bf_iris <= $to_next_x bf_iris if score $to_next_z bf_iris <= $to_next_y bf_iris run data merge storage bf_iris:data {NextCoordinateChange: "z"}

# Calculate the new coordinates when the ray reaches the next tile
execute if data storage bf_iris:data {NextCoordinateChange: "x"} run data modify storage bf_iris:args {} merge value {a: "x", b: "y", c: "z"}
execute if data storage bf_iris:data {NextCoordinateChange: "y"} run data modify storage bf_iris:args {} merge value {a: "y", b: "z", c: "x"}
execute if data storage bf_iris:data {NextCoordinateChange: "z"} run data modify storage bf_iris:args {} merge value {a: "z", b: "x", c: "y"}
function bf_iris:raycast/macro_functions/find_next_block_aux with storage bf_iris:args

# Return the added distance
return run scoreboard players operation $to_next_block bf_iris *= $1000 bf_iris
