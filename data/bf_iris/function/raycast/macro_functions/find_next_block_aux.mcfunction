#> bf_iris:raycast/find_next_block_aux
#
# Auxiliary command for running macros from find_next_block
# Note: because there are only three possible input value combinations, they should all be cached and so the overhead from runtime compilation of macro lines should be minimal
#
# @input
#   a: The axis along which we are moving (for example, if the ray moves one tile up, this is 'y'). One of 'x', 'y', or 'z'.
#   b: Another axis. One of 'x', 'y', or 'z'.
#   c: The third axis. One of 'x', 'y', or 'z'.

$scoreboard players operation $to_next_block bf_iris = $to_next_$(a) bf_iris

# Find the exact position of the ray when it leaves the current tile
$execute if score $d$(a) bf_iris matches 0.. run scoreboard players add $[$(a)] bf_iris 1
$execute if score $d$(a) bf_iris matches 0.. run scoreboard players set ${$(a)} bf_iris 0
$execute if score $d$(a) bf_iris matches ..-1 run scoreboard players remove $[$(a)] bf_iris 1
$execute if score $d$(a) bf_iris matches ..-1 run scoreboard players set ${$(a)} bf_iris 1000000

# Calculate new position on the second axis
scoreboard players operation $delta bf_iris = $to_next_block bf_iris
$scoreboard players operation $delta bf_iris *= $d$(b) bf_iris
scoreboard players operation $delta bf_iris /= $1000 bf_iris
$scoreboard players operation ${$(b)} bf_iris += $delta bf_iris

# Calculate new position on the third axis
scoreboard players operation $delta bf_iris = $to_next_block bf_iris
$scoreboard players operation $delta bf_iris *= $d$(c) bf_iris
scoreboard players operation $delta bf_iris /= $1000 bf_iris
$scoreboard players operation ${$(c)} bf_iris += $delta bf_iris
