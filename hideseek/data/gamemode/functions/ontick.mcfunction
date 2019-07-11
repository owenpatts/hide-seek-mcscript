# ontick runs once per ingame tick.

# Call other functions here:
# ex: function testing:r_click/on_click
function gamemode:test

# generic gameClock event handling:
scoreboard players add @e[tag=tracker,scores={gamestate=1..}] gameClock 1

# Map specific event handling:
execute as @e[tag=tracker,scores={gamestate=1,map=1}] at @s run function gamemode:map1/gameloop
execute as @e[tag=tracker,scores={gamestate=1,map=2}] at @s run function gamemode:map2/gameloop
execute as @e[tag=tracker,scores={gamestate=1,map=3}] at @s run function gamemode:map3/gameloop
execute as @e[tag=tracker,scores={gamestate=1,map=4}] at @s run function gamemode:map4/gameloop