draw_set_alpha(image_alpha)
draw_sprite(spr_marx_parts, 0, wingsx, wingsy)
draw_sprite(spr_marx_parts, 1, shoesx, shoesy)
draw_sprite(sprite_index, image_index, x, y)
draw_set_alpha(1)
if ballpower
{
    var _otherballscale = Wave(ballmax, (-ballmax), 0.6, 15)
    draw_set_color(c_yellow)
    draw_circle(x, (y + 30), ballscale, 0)
    draw_set_color(c_orange)
    draw_circle(x, (y + 30), (_otherballscale / 2), 0)
    draw_healthbar((x - 50), (y - 65), (x + 50), (y - 45), laserbar, c_black, c_green, c_red, 1, 1, 1)
}
