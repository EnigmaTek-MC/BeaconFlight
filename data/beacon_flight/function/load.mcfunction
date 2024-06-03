scoreboard objectives add beacon_flight.__vars__ dummy
scoreboard players set #2 beacon_flight.__vars__ 2
scoreboard players set #10 beacon_flight.__vars__ 10
scoreboard players set #20 beacon_flight.__vars__ 20

scoreboard objectives add beacon_flight.timer dummy
scoreboard objectives add beacon_flight.active dummy
scoreboard objectives add beacon_flight.enabled dummy
scoreboard players add $default beacon_flight.enabled 0
scoreboard players set $pack_installed beacon_flight.enabled 1

scoreboard objectives add beacon_flight.help trigger

schedule function beacon_flight:marker/tick 4s