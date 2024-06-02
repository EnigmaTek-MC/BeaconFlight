execute as @a[scores={beacon_flight.enabled=0,beacon_flight.active=1}] run function beacon_flight:player/deactivate

scoreboard players remove @a[scores={beacon_flight.timer=1..}] beacon_flight.timer 1
execute as @a[scores={beacon_flight.timer=0}] run function beacon_flight:player/deactivate
scoreboard players set @a[scores={beacon_flight.timer=0}] beacon_flight.timer -1

execute as @a[scores={beacon_flight.active=1}] run function beacon_flight:player/flight_checks
execute as @a[scores={beacon_flight.timer=1..},x_rotation=-90..-89,predicate=beacon_flight:sneaking] run function beacon_flight:player/boost_up

execute as @a[scores={beacon_flight.help=1..}] run function beacon_flight:trigger