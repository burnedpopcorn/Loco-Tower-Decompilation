spritereal = (global.danikyo ? spr_danikyo : sprite_index)
if upsidedown
    yscale = -1
else
    yscale = 1
if (styledtaunting == 1)
{
    draw_set_font(global.bigfont)
    draw_set_color(c_white)
    draw_set_alpha(1)
    draw_set_halign(fa_center)
    if (styledtaunts < 10)
        draw_text(x, (y - 70), ("X0" + string(styledtaunts)))
    else if (styledtaunts >= 10)
        draw_text(x, (y - 70), ("X" + string(styledtaunts)))
}
pal_swap_set(spr_palette, paletteselect, 0)
draw_sprite_ext(spritereal, image_index, x, (yscale == 1 ? y : (y + 50)), (xscale * scale_xs), (yscale * scale_ys), angle, image_blend, image_alpha)
shader_reset()
if flash
{
    shader_set(shd_hit)
    draw_sprite_ext(spritereal, image_index, x, (yscale == 1 ? y : (y + 50)), (xscale * scale_xs), (yscale * scale_ys), angle, image_blend, image_alpha)
    shader_reset()
}
if genomode
{
    var _timer = 0
    _timer = ((genotimer / genotimer_max) * 100)
    var _delay = 0
    _delay = (((genodelay_max - genodelay) / genodelay_max) * 100)
    draw_healthbar((x - 25), (y - 50), x, (y - 40), _delay, c_black, c_yellow, c_yellow, 0, 1, 1)
    draw_healthbar((x - 25), (y - 65), (x + 25), (y - 50), _timer, c_black, c_red, c_green, 0, 1, 1)
}
