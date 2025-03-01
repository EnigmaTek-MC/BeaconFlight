# Beacon flight has been disabled externally - terminate flight
execute as @a[scores={beacon_flight.enabled=0,beacon_flight.active=1}] if function beacon_flight:player/deactivate run scoreboard players set @s beacon_flight.timer -1

# Check for disabled elytra items outside of the chest slot
execute store result score $time beacon_flight.__vars__ run time query gametime
scoreboard players operation $time beacon_flight.__vars__ %= #20 beacon_flight.__vars__
execute if score $time beacon_flight.__vars__ matches 0 as @a run function beacon_flight:player_elytra_check

execute as @a[scores={beacon_flight.timer=1..}] run function beacon_flight:player/update

execute as @a[scores={beacon_flight.help=1..}] run function beacon_flight:trigger


# Track state for detecting double jump inputs
scoreboard players add @a[scores={beacon_flight.enabled=1..}] beacon_flight.space_timer 0
execute as @a[scores={beacon_flight.space_timer=1..}] run scoreboard players remove @s beacon_flight.space_timer 1
scoreboard players set @a[scores={beacon_flight.space_timer=0,beacon_flight.space_state=1..}] beacon_flight.space_state 0


execute as @a[gamemode=!spectator,gamemode=!creative,scores={beacon_flight.active=1},predicate=beacon_flight:input/jump_down] run function beacon_flight:player/boost_up
execute as @a[gamemode=!spectator,gamemode=!creative,scores={beacon_flight.active=1},predicate=beacon_flight:input/shift_down] run function beacon_flight:player/boost_down
execute as @a[gamemode=!spectator,gamemode=!creative,scores={beacon_flight.active=1},predicate=!beacon_flight:input/shift_down,predicate=!beacon_flight:input/jump_down] run function beacon_flight:player/reset_boost
execute as @a[gamemode=!spectator,gamemode=!creative,scores={beacon_flight.active=1},predicate=beacon_flight:on_ground] run function beacon_flight:player/deactivate

execute as @a[scores={beacon_flight.active=2},predicate=beacon_flight:on_ground] run function beacon_flight:player/deactivate_fd_reduction
execute as @a[scores={beacon_flight.active=2},predicate=beacon_flight:elytra_flying] run function beacon_flight:player/deactivate_fd_reduction

execute as @a[gamemode=!spectator,gamemode=!creative,scores={beacon_flight.timer=1..,beacon_flight.space_state=0,beacon_flight.space_timer=0},predicate=beacon_flight:input/jump_down] run function beacon_flight:player/inputs/first_jump
scoreboard players set @a[gamemode=!spectator,gamemode=!creative,scores={beacon_flight.timer=1..,beacon_flight.space_state=1,beacon_flight.space_timer=1..},predicate=!beacon_flight:input/jump_down] beacon_flight.space_state 2
execute as @a[gamemode=!spectator,gamemode=!creative,scores={beacon_flight.timer=1..,beacon_flight.space_state=2,beacon_flight.space_timer=1..},predicate=beacon_flight:input/jump_down] run function beacon_flight:player/inputs/second_jump