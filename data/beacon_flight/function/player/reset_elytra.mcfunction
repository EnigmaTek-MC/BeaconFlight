tag @s add beacon_flight.operator
execute summon minecraft:item_display run function beacon_flight:player/reset_elytra_entity {arg1:"armor.",arg2:"chest"}
stopsound @s * item.armor.equip_elytra
tag @s remove beacon_flight.operator