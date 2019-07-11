# Appropriate init function called based on the selected map:
execute as @e[type=minecraft:armor_stand,tag=tracker,scores={map=1},limit=1] run function gamemode:map1/start_game

# All players are temporarily added to the "Hiders" team.
# Eventually the seeker will be selected, this is handled by the ontick function.
team join hiders @a

# Variable initialization
scoreboard players set @e[tag=tracker] gameClock 0
scoreboard players set @e[tag=tracker] playerCount -1
scoreboard players set @e[tag=tracker] gamestate 1

execute as @a run scoreboard players add @e[tag=tracker] playerCount 1

tellraw @a {"text":"Quickly!  Run & hide!","color":"gold"}
tellraw @a [{"text":"The seeker will be selected in ","color":"gold"},{"text":"15 seconds","color":"blue"},{"text":"!","color":"gold"}]