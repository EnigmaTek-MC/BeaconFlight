execute if entity @s[scores={beacon_flight.timer=1..,},predicate=!beacon_flight:sneaking] run function beacon_flight:player/reset_boost
execute if entity @s[scores={beacon_flight.timer=1..,},x_rotation=89..90,predicate=beacon_flight:sneaking] run function beacon_flight:player/boost_down

execute if predicate beacon_flight:on_ground run function beacon_flight:player/deactivate