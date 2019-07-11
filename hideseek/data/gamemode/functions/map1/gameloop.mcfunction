# Hider + seeker role assignment
execute as @e[scores={gameClock=300,gamestate=1}] run team join seeker @r
execute as @e[scores={gameClock=300,gamestate=1}] run tellraw @a[team=seeker] [{"text":"You are the ","color":"gold"},{"text":"seeker","color":"dark_red","bold":true},{"text":".  Hunt down the other players before they finish their quest!","color":"gold"}]
execute as @e[scores={gameClock=300,gamestate=1}] run tellraw @a[team=hiders] [{"text":"You are a","color":"gold"},{"text":" hider","color":"dark_green","bold":true},{"text":"! Trade with the NPCs to get a gun and slay the werewolf.","color":"gold"}]
execute as @e[scores={gameClock=300,gamestate=1}] at @e[team=seeker] run playsound minecraft:entity.wolf.howl neutral @a ~ ~ ~ 1 .8
execute as @e[scores={gameClock=300,gamestate=1}] run effect give @e[team=seeker] minecraft:strength 999999 255 true

# Handling hider death:
execute as @e[team=hiders,scores={dead=1}] run spawnpoint @s ~ ~ ~
execute as @e[team=hiders,scores={dead=1}] run scoreboard players remove @e[tag=tracker] playerCount 1
execute as @e[team=hiders,scores={dead=1}] run gamemode spectator @s

# ====================== Game end detection ==============================
# Testing for dead werewolf:
execute as @e[team=seeker,scores={dead=1}] run execute as @e[tag=tracker,scores={gamestate=1}] run title @a title {"text":"Hiders Win!","color":"gold"}
execute as @e[team=seeker,scores={dead=1}] run execute as @e[tag=tracker,scores={gamestate=1}] run tellraw @a {"text":"The hiders have slain the werewolf!","color":"gold"}
execute as @e[team=seeker,scores={dead=1}] run scoreboard players set @e[tag=tracker] gamestate 2

# Testing for all hiders dead:
execute as @e[tag=tracker,scores={playerCount=0,gameClock=301..}] run tellraw @a {"text":"The werewolf has wiped out the town!","color":"gold"}
execute as @e[tag=tracker,scores={playerCount=0,gameClock=301..}] run title @a title {"text":"Werewolf Wins!","color":"gold"}
execute as @e[tag=tracker,scores={playerCount=0,gameClock=301..}] run scoreboard players set @s gamestate 2

# Testing for timer > 3600 ticks
execute as @e[tag=tracker,scores={gameClock=3600..}] run tellraw @a {"text":"The hiders have survived!","color":"gold"}
execute as @e[tag=tracker,scores={gameClock=3600..}] run title @a title {"text":"Hiders Win!","color":"gold"}
execute as @e[tag=tracker,scores={gameClock=3600..}] run scoreboard players set @s gamestate 2

# ======================= Game end handling =============================
execute as @e[scores={gameClock=100,gamestate=2}] run teleport @a @e[tag=lobbySpawn,limit=1]
execute as @e[scores={gameClock=100,gamestate=2}] run scoreboard players set @s gamestate 0
execute as @e[tag=tracker,scores={gameClock=301..,gamestate=2}] run scoreboard players set @s gameClock 0





# Resetting death value
scoreboard players set @e[scores={dead=1}] dead 0