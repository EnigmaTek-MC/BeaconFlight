scoreboard players set @s beacon_flight.help 0
scoreboard players enable @s beacon_flight.help

tellraw @s {"text":"0----------Beacon Flight----------0","color":"gold"}
execute if score @s beacon_flight.enabled matches 1.. run tellraw @s [{"text":"Currently: "},{"text":" Enabled\n","color": "green"},{"text":"While in range of an active beacon, sneak + look up to initiate flight / boost upwards, sneak + look down to terminate flight / boost downwards","color": "white"}]
execute if score @s beacon_flight.enabled matches 0 run tellraw @s {"text":"  Disabled","color": "red","hoverEvent": {"action": "show_text","value": "Contact your server administrator if you believe this is incorrect"}}
tellraw @s {"text":"0-------------------------------0","color":"gold"}