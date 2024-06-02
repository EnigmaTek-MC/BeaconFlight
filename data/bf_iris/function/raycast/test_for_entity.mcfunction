#> bf_iris:raycast/test_for_entity
#
# @output
#   Result: 0
#   Success: 1 if an entity was hit, 0 otherwise

execute unless data storage bf_iris:settings {TargetEntities: true} run return fail
execute align xyz unless entity @e[type=!#bf_iris:ignore, tag=!bf_iris.ignore, dx=0, dy=0, dz=0, tag=!bf_iris.executing] run return fail
execute align xyz as @e[type=!#bf_iris:ignore, tag=!bf_iris.ignore, dx=0, dy=0, dz=0, tag=!bf_iris.executing] run function bf_iris:get_hitbox/entity
return run function bf_iris:raycast/check_intersection/loop
