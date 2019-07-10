# teleport self and any entities within 10 blocks to the north.
execute as @e[distance=..10] at @s run teleport ~ ~ ~-1
#clone an area 20 blocks wide, by 20 blocks wide, by 12 blocks high one block north.
clone ~-10 ~-3 ~-10 ~10 ~10 ~10 ~-10 ~-3 ~-11 replace move