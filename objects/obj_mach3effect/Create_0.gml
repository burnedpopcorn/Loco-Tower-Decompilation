playerid = obj_player1
image_speed = 0
depth = 1
if (playerid.state == 70 || playerid.state == 91)
{
    var p = 4
    var m = (playerid.movespeed - p)
    var t = (12 - p)
    image_alpha = (m / t)
    image_alpha = clamp(image_alpha, 0, 1)
}
else
    image_alpha = 1
image_angle = playerid.angle
randomize()
image_blend = choose(make_color_rgb(0, 0, 255), make_color_rgb(248, 112, 24))
alarm[1] = 6
alarm[0] = 15
