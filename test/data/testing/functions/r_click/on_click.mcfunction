
# RESETS (RUN THIS CODE LAST):

execute as @e[scores={rClick=1..}] run function testing:sounds/newsound

scoreboard players set @e[scores={rClick=1..}] rClick 0
