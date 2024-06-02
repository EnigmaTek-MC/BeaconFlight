#> bf_iris:get_hitbox/block/xor
#
# Compute bitwise XOR (^) on two scores
#
# @private
# @within bf_iris:get_hitbox/block/offset
# @reads
#   score $a bf_iris
#       The first operand
#   score $b bf_iris
#       The second operand
# @output
#   Return: The result of the XOR operation on both operands
#   Success: 1

scoreboard players operation $a^b bf_iris = $a bf_iris
scoreboard players operation $a^b bf_iris += $b bf_iris

# Compute a&b
scoreboard players set $a&b bf_iris 0
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players set $a&b bf_iris -2147483648
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 1073741824
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 536870912
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 268435456
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 134217728
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 67108864
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 33554432
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 16777216
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 8388608
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 4194304
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 2097152
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 1048576
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 524288
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 262144
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 131072
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 65536
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 32768
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 16384
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 8192
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 4096
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 2048
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 1024
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 512
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 256
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 128
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 64
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 32
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 16
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 8
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 4
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 2
scoreboard players operation $a bf_iris += $a bf_iris
scoreboard players operation $b bf_iris += $b bf_iris
execute if score $a bf_iris matches ..-1 if score $b bf_iris matches ..-1 run scoreboard players add $a&b bf_iris 1

# Compute a^b = a+b-2(a&b)
scoreboard players operation $a^b bf_iris -= $a&b bf_iris
scoreboard players operation $a^b bf_iris -= $a&b bf_iris

# Return the result
return run scoreboard players get $a^b bf_iris
