# The utilities/init function should be called standing where you want the tracker stand to be placed.

# Previous variable tracker armorstand(s) are removed and a new one is spawned at the executing player's location
kill @e[type=minecraft:armor_stand,tag=tracker]
summon minecraft:armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:beacon",Count:1b}],CustomNameVisible:0b,NoGravity:1b,Invulnerable:1b,Invisible:0b,Tags:["tracker"],CustomName:"{\"text\":\"tag=tracker\",\"bold\":true}"}

# gamerules changed:
gamerule doDaylightCycle false
gamerule showDeathMessages false
gamerule doMobSpawning false

# Variables are defined and default values set.
scoreboard objectives add map dummy
scoreboard objectives add gameClock dummy
scoreboard objectives add playerCount dummy
scoreboard objectives add gamestate dummy
scoreboard objectives add dead deathCount

scoreboard players set @e[type=minecraft:armor_stand,tag=tracker] map 0

# Gamestate variable:
# 0: lobby
# 1: playing
# 2: hider victory
# 3: seeker victory
# 4: game over
scoreboard players set @e[type=minecraft:armor_stand,tag=tracker] gamestate 0

# Teams created & options set:
team add hiders {"text":"Hiders"}
team add seeker {"text":"Seeker"}

team modify hiders nametagVisibility never
team modify hiders friendlyFire false
team modify seeker nametagVisibility never
