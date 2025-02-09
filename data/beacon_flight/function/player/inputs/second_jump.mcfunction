scoreboard players set @s beacon_flight.space_timer 0
scoreboard players set @s beacon_flight.space_state 0

execute unless function beacon_flight:player/activate run return run function beacon_flight:player/deactivate
execute if items entity @s armor.chest minecraft:elytra[minecraft:glider] run item modify entity @s armor.chest {function:"set_components",components:{"!minecraft:glider":{}}}
stopsound @s * item.armor.equip_elytra