#> bf_iris:get_position/main
#
# Gets the current coordinates and rotation.
# Coordinates are returned as a triplet of integer coordinates and a triplet of fractional coordinates.
# Rotation is returned as a steering vector of magnitude 1000000.
#
# @context a marker
# @within bf_iris:get_target
# @within bf_iris:get_hitbox/entity
# @writes
#    score $[x] bf_iris
#        The integer x coordinate of the current position
#    score $[y] bf_iris
#        The integer y coordinate of the current position
#    score $[z] bf_iris
#        The integer z coordinate of the current position
#    score ${x} bf_iris
#        The fractional x coordinate of the current position, represented by an integer between 0 and 1000000
#    score ${y} bf_iris
#        The fractional y coordinate of the current position, represented by an integer between 0 and 1000000
#    score ${z} bf_iris
#        The fractional z coordinate of the current position, represented by an integer between 0 and 1000000
#    score $dx bf_iris
#        The x coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#    score $dy bf_iris
#        The y coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#    score #dz bf_iris
#        The z coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000

function bf_iris:get_position/get_coordinates
function bf_iris:get_position/get_rotation
