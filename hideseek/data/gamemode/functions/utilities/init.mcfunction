# The utilities/init function should be called standing where you want the tracker stand to be placed.

# Previous variable tracker armorstand(s) are removed and a new one is spawned at the executing player's location
kill @e[type=minecraft:armor_stand,tag=tracker]
summon minecraft:armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:beacon",Count:1b}],CustomNameVisible:0b,NoGravity:1b,Invulnerable:1b,Invisible:0b,Tags:["tracker"],CustomName:"{\"text\":\"tag=tracker\",\"bold\":true}"}

# Variables are defined and default values set.
scoreboard objectives add map dummy
scoreboard objectives add gameClock dummy
scoreboard objectives add playing dummy

scoreboard players set @e[type=minecraft:armor_stand,tag=tracker] map 0
scoreboard players set @e[type=minecraft:armor_stand,tag=tracker] playing 0

# Teams created & options set:
team add hiders {"text":"Hiders"}
team add seeker {"text":"Seeker"}

team modify hiders nametagVisibility never
team modify hiders friendlyFire false
team modify seeker nametagVisibility never
