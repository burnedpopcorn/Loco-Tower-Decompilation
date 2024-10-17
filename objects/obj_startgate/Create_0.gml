targetDoor = "A"
targetdoorhub = "A"
pizzascore_index = 0
_y = 0
_xscale = 0.5
_yscale = 1.2
gateunrevealed = 1344
title_music = 13
titlecard_sprite = 1783
title_sprite = 1682
rank = "none"
rankindex = 0
pizzascore_number = sprite_get_number(spr_pizzascore)
msg = ""
highscore = 0
secret_count = 0
gatebgfill1 = 0
gatebgfill2 = 0
alphagate = 1
toppin = array_create(5, 0)
depth = 50
level = "none"
world = 1
drawing = 0
bgsurfcase = -4
surffinal = -4
bgdraw1 = 445
bgdraw2 = 864
durationspeed[0] = 2
durationspeed[1] = 4
durationspeed[2] = 8
depthegg[0] = 1
depthegg[1] = 2
depthegg[2] = 3
eggsecret[0] = 1
eggsecret[1] = 2
eggsecret[2] = 3
durationspeedy[0] = 5
durationspeedy[1] = 10
durationspeedy[2] = 15
eggsprite[0] = (secret_count >= 1 ? 348 : 939)
eggsprite[1] = (secret_count >= 2 ? 348 : 939)
eggsprite[2] = (secret_count >= 3 ? 348 : 939)
donotrepeat = 0
laps = 0
for (var n = 0; n < array_length(durationspeed); n++)
{
    x_move[n] = 0
    y_move[n] = 0
}
