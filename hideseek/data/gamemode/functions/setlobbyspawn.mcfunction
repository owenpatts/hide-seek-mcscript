# summons armorstand with tag map1spawn as the spawnpoint for map 1
kill @e[type=minecraft:armor_stand,tag=lobbySpawn]
summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Invisible:1b,Tags:["lobbySpawn"]}