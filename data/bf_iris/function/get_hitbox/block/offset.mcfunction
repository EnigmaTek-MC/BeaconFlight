#> bf_iris:get_hitbox/block/offset
#
# Computes seeded block offset for e.g. flowers, assuming the shape comprises a single box
#
# @writes
#	storage bf_iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

# Compute seed(x, y, z)
scoreboard players operation $a bf_iris = $[x] bf_iris
scoreboard players operation $a bf_iris *= $3129871 bf_iris
scoreboard players operation $b bf_iris = $[z] bf_iris
scoreboard players operation $b bf_iris *= $116129781 bf_iris
execute store result score $a^b bf_iris run function bf_iris:get_hitbox/block/xor

scoreboard players operation $(a^b)² bf_iris = $a^b bf_iris
scoreboard players operation $(a^b)² bf_iris *= $a^b bf_iris
scoreboard players operation $11*(a^b) bf_iris = $a^b bf_iris
scoreboard players operation $11*(a^b) bf_iris *= $11 bf_iris

scoreboard players operation $seed bf_iris = $(a^b)² bf_iris
scoreboard players operation $seed bf_iris *= $42317861 bf_iris
scoreboard players operation $seed bf_iris += $11*(a^b) bf_iris
scoreboard players operation $seed bf_iris /= $65536 bf_iris

# Compute offsets
scoreboard players operation $x_offset bf_iris = $seed bf_iris
scoreboard players operation $x_offset bf_iris %= $16 bf_iris
scoreboard players operation $x_offset bf_iris *= $33333 bf_iris

scoreboard players operation $z_offset bf_iris = $seed bf_iris
scoreboard players operation $z_offset bf_iris /= $256 bf_iris
scoreboard players operation $z_offset bf_iris %= $16 bf_iris
scoreboard players operation $z_offset bf_iris *= $33333 bf_iris

# Adjust/clamp for pointed dripstone blocks
execute if block ~ ~ ~ minecraft:pointed_dripstone run scoreboard players remove $x_offset bf_iris 125000
execute if block ~ ~ ~ minecraft:pointed_dripstone run scoreboard players remove $z_offset bf_iris 125000
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $x_offset bf_iris matches ..0 run scoreboard players set $x_offset bf_iris 0
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $x_offset bf_iris matches 250000.. run scoreboard players set $x_offset bf_iris 250000
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $z_offset bf_iris matches ..0 run scoreboard players set $z_offset bf_iris 0
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $z_offset bf_iris matches 250000.. run scoreboard players set $z_offset bf_iris 250000

# Apply offsets to the generated shape
execute store result score $min_x bf_iris run data get storage bf_iris:data Shape[0].min[0] 1000000
execute store result storage bf_iris:data Shape[0].min[0] double 0.000001 run scoreboard players operation $min_x bf_iris += $x_offset bf_iris
execute store result score $min_z bf_iris run data get storage bf_iris:data Shape[0].min[2] 1000000
execute store result storage bf_iris:data Shape[0].min[2] double 0.000001 run scoreboard players operation $min_z bf_iris += $z_offset bf_iris
execute store result score $max_x bf_iris run data get storage bf_iris:data Shape[0].max[0] 1000000
execute store result storage bf_iris:data Shape[0].max[0] double 0.000001 run scoreboard players operation $max_x bf_iris += $x_offset bf_iris
execute store result score $max_z bf_iris run data get storage bf_iris:data Shape[0].max[2] 1000000
execute store result storage bf_iris:data Shape[0].max[2] double 0.000001 run scoreboard players operation $max_z bf_iris += $z_offset bf_iris
