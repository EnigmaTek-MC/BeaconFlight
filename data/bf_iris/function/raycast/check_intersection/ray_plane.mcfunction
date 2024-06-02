#> bf_iris:raycast/check_intersection/ray_plane
#
# Tests for ray-plane intersections with a face
#
# @reads
#   storage bf_iris:data Face: compound
#       Direction: string
#           The axis that is perpendicular to this face
#           One of WEST_EAST, UP_DOWN, NORTH_SOUTH
#       min: float[]
#       max: float[]
# @output
#   Success: 1 if the face is hit, 0 otherwise
#   Result: the distance, in mm, before the face is hit
# @private
# @within bf_iris:raycast/check_intersection/ray_box

# Save face coordinates
execute store result score $x0 bf_iris run data get storage bf_iris:data Face.min[0] 1000000
execute store result score $y0 bf_iris run data get storage bf_iris:data Face.min[1] 1000000
execute store result score $z0 bf_iris run data get storage bf_iris:data Face.min[2] 1000000
execute store result score $x1 bf_iris run data get storage bf_iris:data Face.max[0] 1000000
execute store result score $y1 bf_iris run data get storage bf_iris:data Face.max[1] 1000000
execute store result score $z1 bf_iris run data get storage bf_iris:data Face.max[2] 1000000

# Get distance (in mm) to the plane, i.e. how long the ray should extend before it hits the plane
# This value should be at most sqrt(3)*1000; if it's more than 2000, we fail (otherwise we risk overflow errors)
execute if data storage bf_iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance bf_iris = $x0 bf_iris
execute if data storage bf_iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance bf_iris -= ${x} bf_iris
execute if data storage bf_iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance bf_iris = $y0 bf_iris
execute if data storage bf_iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance bf_iris -= ${y} bf_iris
execute if data storage bf_iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance bf_iris = $z0 bf_iris
execute if data storage bf_iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance bf_iris -= ${z} bf_iris
scoreboard players operation $distance bf_iris *= $1000 bf_iris
execute if data storage bf_iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance bf_iris /= $dx bf_iris
execute if data storage bf_iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance bf_iris /= $dy bf_iris
execute if data storage bf_iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance bf_iris /= $dz bf_iris
execute if score $distance bf_iris matches ..-1 run return fail
execute if score $distance bf_iris matches 2000.. run return fail

# Get x position of the ray/plane intersection
scoreboard players operation $x_intersection bf_iris = $distance bf_iris
scoreboard players operation $x_intersection bf_iris *= $dx bf_iris
scoreboard players operation $x_intersection bf_iris /= $1000 bf_iris
scoreboard players operation $x_intersection bf_iris += ${x} bf_iris
execute if data storage bf_iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $x_intersection bf_iris = $x0 bf_iris

# Get y position of the ray/plane intersection
scoreboard players operation $y_intersection bf_iris = $distance bf_iris
scoreboard players operation $y_intersection bf_iris *= $dy bf_iris
scoreboard players operation $y_intersection bf_iris /= $1000 bf_iris
scoreboard players operation $y_intersection bf_iris += ${y} bf_iris
execute if data storage bf_iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $y_intersection bf_iris = $y0 bf_iris

# Get z position of the ray/plane intersection
scoreboard players operation $z_intersection bf_iris = $distance bf_iris
scoreboard players operation $z_intersection bf_iris *= $dz bf_iris
scoreboard players operation $z_intersection bf_iris /= $1000 bf_iris
scoreboard players operation $z_intersection bf_iris += ${z} bf_iris
execute if data storage bf_iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $z_intersection bf_iris = $z0 bf_iris

# Save the position of the intersection
data modify storage bf_iris:data Face.Collision set value [0.0d, 0.0d, 0.0d]
execute store result storage bf_iris:data Face.Collision[0] double 0.000001 run scoreboard players get $x_intersection bf_iris
execute store result storage bf_iris:data Face.Collision[1] double 0.000001 run scoreboard players get $y_intersection bf_iris
execute store result storage bf_iris:data Face.Collision[2] double 0.000001 run scoreboard players get $z_intersection bf_iris

# See if that intersection falls within the face
execute if score $x_intersection bf_iris >= $x0 bf_iris if score $x_intersection bf_iris <= $x1 bf_iris \
        if score $y_intersection bf_iris >= $y0 bf_iris if score $y_intersection bf_iris <= $y1 bf_iris \
        if score $z_intersection bf_iris >= $z0 bf_iris if score $z_intersection bf_iris <= $z1 bf_iris \
        run return run scoreboard players get $distance bf_iris

return fail
