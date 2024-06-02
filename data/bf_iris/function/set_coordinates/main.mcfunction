#> bf_iris:set_coordinates
#
# Teleports the executing entity at a given position from six scores.
# Meant to be executed as the ray marker after raycasting, scores are then set to the player's targeted position:
#    execute as @p at @s anchored eyes positioned ^ ^ ^ run function bf_iris:get_target
#    execute as @e[type=minecraft:marker, tag=bf_iris.ray] run function bf_iris:set_coordinates
#
# @public
# @context any entity
# @input
#   score $[x] bf_iris
#       The integer value of the new X position
#   score ${x} bf_iris
#       The fractional value of the new X position, as a number between 0 and 1000000

execute unless entity @s run return fail

# Clamp to 0..999999
execute if score ${x} bf_iris matches ..0 run scoreboard players set ${x} bf_iris 0
execute if score ${y} bf_iris matches ..0 run scoreboard players set ${y} bf_iris 0
execute if score ${z} bf_iris matches ..0 run scoreboard players set ${z} bf_iris 0
execute if score ${x} bf_iris matches 1000000.. run scoreboard players set ${x} bf_iris 999999
execute if score ${y} bf_iris matches 1000000.. run scoreboard players set ${y} bf_iris 999999
execute if score ${z} bf_iris matches 1000000.. run scoreboard players set ${z} bf_iris 999999

# Get integer coordinates for the first teleport command (absolute coordinates)
execute store result storage bf_iris:args x int 1 run scoreboard players get $[x] bf_iris
execute store result storage bf_iris:args y int 1 run scoreboard players get $[y] bf_iris
execute store result storage bf_iris:args z int 1 run scoreboard players get $[z] bf_iris

# Get fractional coordinates for the second teleport command (relative coordinates)
execute store result storage bf_iris:args value int 1 run scoreboard players get ${x} bf_iris
function bf_iris:set_coordinates/pad_with_zeros with storage bf_iris:args
data modify storage bf_iris:args dx set string storage bf_iris:data String -6

execute store result storage bf_iris:args value int 1 run scoreboard players get ${y} bf_iris
function bf_iris:set_coordinates/pad_with_zeros with storage bf_iris:args
data modify storage bf_iris:args dy set string storage bf_iris:data String -6

execute store result storage bf_iris:args value int 1 run scoreboard players get ${z} bf_iris
function bf_iris:set_coordinates/pad_with_zeros with storage bf_iris:args
data modify storage bf_iris:args dz set string storage bf_iris:data String -6

# Generate the two teleport commands
function bf_iris:set_coordinates/teleport with storage bf_iris:args