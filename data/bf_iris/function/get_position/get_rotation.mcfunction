#> bf_iris:get_position/get_rotation
#
# Returns the context rotation as a vector
#
# @within bf_iris:get_position/main
# @context A marker and a rotation

execute positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1000000
data modify storage bf_iris:data Pos set from entity @s Pos
execute store result score $dx bf_iris run data get storage bf_iris:data Pos[0]
execute store result score $dy bf_iris run data get storage bf_iris:data Pos[1]
execute store result score $dz bf_iris run data get storage bf_iris:data Pos[2]
