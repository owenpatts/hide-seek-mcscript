summon armor_stand ~ ~2 ~ {NoGravity:1b,Small:1b,Invisible:1b,Tags:["airship_controller"]}
setblock ~ ~ ~ minecraft:chiseled_stone_bricks destroy
setblock ~ ~2 ~ minecraft:barrel destroy
setblock ~1 ~ ~ minecraft:stone_button[facing=east] destroy
setblock ~-1 ~ ~ minecraft:stone_button[facing=west] destroy
setblock ~ ~ ~1 minecraft:stone_button[facing=south] destroy
setblock ~ ~ ~-1 minecraft:stone_button[facing=north] destroy
setblock ~ ~1 ~ minecraft:stone_button[facing=north,face=floor] destroy
teleport @s 0 -100 0