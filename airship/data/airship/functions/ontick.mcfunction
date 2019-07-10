# ontick runs once per ingame tick.

# Call other functions here:
execute as @e[type=minecraft:player] run execute at @s run execute as @e[type=minecraft:squid, scores={lifetime=..10}, distance=..6] run execute at @s run function airship:create_airship
scoreboard players add @e[type=minecraft:squid] lifetime 1


# Set airship direction based on button
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~-1 minecraft:stone_button[powered=true] run scoreboard players set @e[tag=airship_controller, distance=..1] direction 1
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~1 minecraft:stone_button[powered=true] run scoreboard players set @e[tag=airship_controller, distance=..1] direction 2
execute positioned as @e[tag=airship_controller] if block ~1 ~-2 ~ minecraft:stone_button[powered=true] run scoreboard players set @e[tag=airship_controller, distance=..1] direction 3
execute positioned as @e[tag=airship_controller] if block ~-1 ~-2 ~ minecraft:stone_button[powered=true] run scoreboard players set @e[tag=airship_controller, distance=..1] direction 4
execute positioned as @e[tag=airship_controller] if block ~ ~-1 ~ minecraft:stone_button[powered=true] run scoreboard players set @e[tag=airship_controller, distance=..1] direction 0

# delete airship if the main block is gone
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~ minecraft:air run setblock ~ ~ ~ air destroy
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~ minecraft:air run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel"}},distance=..1]
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~ minecraft:air run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:stone_button"}},distance=..2]
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~ minecraft:air run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:chiseled_stone_bricks"}},distance=..2]
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~ minecraft:air run teleport @e[type=minecraft:item,distance=..2] @p
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~ minecraft:air run give @p minecraft:squid_spawn_egg
execute positioned as @e[tag=airship_controller] if block ~ ~-2 ~ minecraft:air run kill @e[tag=airship_controller, distance=..1]

# Execute move statements if the armorstand's airship_wait is high enough
execute positioned as @e[tag=airship_controller, scores={airship_wait=40..,direction=1}] run function airship:move/north
execute positioned as @e[tag=airship_controller, scores={airship_wait=40..,direction=2}] run function airship:move/south
execute positioned as @e[tag=airship_controller, scores={airship_wait=40..,direction=3}] run function airship:move/east
execute positioned as @e[tag=airship_controller, scores={airship_wait=40..,direction=4}] run function airship:move/west
execute positioned as @e[tag=airship_controller, scores={airship_wait=..35,direction=1..}] run particle minecraft:smoke ~ ~-.5 ~
# Increment airship_wait for each airship_controller armorstand
scoreboard players add @e[tag=airship_controller] airship_wait 1
scoreboard players set @e[tag=airship_controller, scores={airship_wait=41..}] airship_wait 0