#> bf_iris:raycast/test_for_block
#
# @output
#   Result: 0
#   Success: 1 if a block was hit, 0 otherwise

# Check if the current block is loaded
execute store success score $loaded bf_iris if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ masked
execute if score $loaded bf_iris matches 0 run return fail

# Check if the current block is blacklisted, or explicitly not whitelisted
execute if data storage bf_iris:settings Whitelist run data modify storage bf_iris:args id set from storage bf_iris:settings Whitelist
execute if data storage bf_iris:settings Whitelist store success score $is_whitelisted bf_iris run function bf_iris:raycast/macro_functions/block_id_test with storage bf_iris:args
execute if data storage bf_iris:settings Whitelist unless score $is_whitelisted bf_iris matches 1 run return fail
execute if data storage bf_iris:settings Blacklist run data modify storage bf_iris:args id set from storage bf_iris:settings Blacklist
execute if data storage bf_iris:settings Blacklist store success score $is_blacklisted bf_iris run function bf_iris:raycast/macro_functions/block_id_test with storage bf_iris:args
execute if data storage bf_iris:settings Blacklist if score $is_blacklisted bf_iris matches 1 run return fail

# See if the block is hit
function bf_iris:get_hitbox/block
execute unless data storage bf_iris:data Shape[0] run return fail
return run function bf_iris:raycast/check_intersection/loop
