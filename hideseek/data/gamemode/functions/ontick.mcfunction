# ontick runs once per ingame tick.

# Call other functions here:
# ex: function testing:r_click/on_click
function gamemode:test

# gameClock event handling:
scoreboard players add @e[tag=tracker,scores={playing=1}] gameClock 1

# Seeker assignment
execute as @e[scores={gameClock=300}] run team join seeker @r
execute as @e[scores={gameClock=300}] run tellraw @a[team=seeker] [{"text":"You are the ","color":"gold"},{"text":"seeker","color":"dark_red","bold":true},{"text":".  Hunt down the other players before they finish their quest!","color":"gold"}]
execute as @e[scores={gameClock=300}] run tellraw @a[team=hiders] [{"text":"You are a","color":"gold"},{"text":" hider","color":"dark_green","bold":true},{"text":"! Trade with the NPCs to get a gun and slay the werewolf.","color":"gold"}]
execute as @e[scores={gameClock=300}] at @e[team=seeker] run playsound minecraft:entity.wolf.howl neutral @a ~ ~ ~ 1 .8