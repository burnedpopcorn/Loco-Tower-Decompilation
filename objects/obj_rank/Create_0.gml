image_speed = 0.5
alarm[0] = -1
depth = -800
done = 0
levelvolume = 1
afterrankmusic = 209
afterrankmusicid = 0
toppin_sprite[0] = spr_toppinportait1
toppin_sprite[1] = spr_toppinportait2
toppin_sprite[2] = spr_toppinportait3
toppin_sprite[3] = spr_toppinportait4
toppin_sprite[4] = spr_toppinportait5
pad = 60
for (var i = 0; i < array_length(toppin_sprite); i++)
{
    toppin_number[i] = sprite_get_number(toppin_sprite[i])
    toppin_has[i] = 0
}
brown = 0
brownfade = 0
yOff = 540
