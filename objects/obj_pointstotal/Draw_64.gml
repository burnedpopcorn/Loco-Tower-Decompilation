if ((!instance_exists(obj_textbox)) && (!instance_exists(obj_titlecard)))
{
    draw_sprite(spr_pointstotal, -1, 840, 440)
    draw_set_font(global.bigfont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(c_white)
    draw_text(823, 440, string(global.pointstotal))
}
