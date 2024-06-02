#> bf_iris:get_position/get_coordinates
#
# Gets the coordinates of the executing entity
#
# @context A marker
# @within bf_iris:get_position/main
# @within bf_iris:get_hitbox/entity

# Get integer coordinates
data modify storage bf_iris:data Pos set from entity @s Pos
execute store result score $[x] bf_iris store result storage bf_iris:args x int -1 run data get storage bf_iris:data Pos[0]
execute store result score $[y] bf_iris store result storage bf_iris:args y int -1 run data get storage bf_iris:data Pos[1]
execute store result score $[z] bf_iris store result storage bf_iris:args z int -1 run data get storage bf_iris:data Pos[2]

# Get fractional coordinates
function bf_iris:get_position/teleport with storage bf_iris:args
data modify storage bf_iris:data Pos set from entity @s Pos
execute store result score ${x} bf_iris run data get storage bf_iris:data Pos[0] 1000000
execute store result score ${y} bf_iris run data get storage bf_iris:data Pos[1] 1000000
execute store result score ${z} bf_iris run data get storage bf_iris:data Pos[2] 1000000

# Clean up
data remove storage bf_iris:data Pos
kill @s
