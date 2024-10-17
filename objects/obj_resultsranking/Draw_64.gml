var i = 0
var pad = 65
var xx = 345
var yy = 98
for (i = 0; i < array_length(toppin_sprite); i++)
    draw_sprite_ext(toppin_sprite[i], toppin_index[i], ((xx + random_range(topping_shake[i], (-topping_shake[i]))) + (pad * i)), (yy + random_range(topping_shake[i], (-topping_shake[i]))), topping_scale[i], topping_scale[i], 0, c_white, 1)
draw_set_font(global.bigfont)
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text((330 + random_range(shakepoints, (-shakepoints))), (220 + random_range(shakepoints, (-shakepoints))), ("PUNTOS:" + string(pointsmax)))
if (lapsmax < 10)
    draw_text((715 + random_range(shakelaps, (-shakelaps))), (348 + random_range(shakelaps, (-shakelaps))), ("0" + string(lapsmax)))
else
    draw_text((715 + random_range(shakelaps, (-shakelaps))), (348 + random_range(shakelaps, (-shakelaps))), string(lapsmax))
if showrank
    draw_sprite(spr_resultsrank, rankindex, 444, 226)
if (gameover == 1)
{
    draw_set_alpha(0.5)
    draw_set_color(c_black)
    draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), false)
    draw_set_alpha(1)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    draw_text((room_width / 2), yfont, "TRY AGAIN!")
}
