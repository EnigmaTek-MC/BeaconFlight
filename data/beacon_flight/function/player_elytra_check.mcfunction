tag @s add beacon_flight.operator
execute if items entity @s weapon.offhand minecraft:elytra[!minecraft:glider] summon minecraft:item_display run function beacon_flight:player/reset_elytra_entity {arg1:"weapon.",arg2:"offhand"}
tag @s remove beacon_flight.operator

data remove storage beacon_flight:data slots
execute if items entity @s container.* minecraft:elytra[!minecraft:glider] run data modify storage beacon_flight:data slots append from entity @s Inventory[{id:"minecraft:elytra",components:{"!minecraft:glider":{}}}].Slot
execute unless data storage beacon_flight:data slots run return fail

tag @s add beacon_flight.operator
data modify storage beacon_flight:macro arg1 set value "container."
function beacon_flight:player/reset_elytra_loop
tag @s remove beacon_flight.operator