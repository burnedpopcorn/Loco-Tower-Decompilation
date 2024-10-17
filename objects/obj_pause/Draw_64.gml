if (cantmove == 0)
{
    draw_set_alpha(alphapause)
    var pad = 48
    draw_set_font(global.bigfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    var opt = selected
    draw_text_transformed_color(480, 200, "CONTINUE", scaledsi, scaledsi, 0, c_white, c_white, c_white, c_white, ((opt == 0 ? 1 : 0.5) * alphapause))
    draw_text_transformed_color(480, 264, "RESTART", scaledsi, scaledsi, 0, c_white, c_white, c_white, c_white, ((opt == 1 ? 1 : 0.5) * alphapause))
    draw_text_transformed_color(480, 328, "OPTIONS", scaledsi, scaledsi, 0, c_white, c_white, c_white, c_white, ((opt == 2 ? 1 : 0.5) * alphapause))
    draw_text_transformed_color(480, 392, "QUIT", scaledsi, scaledsi, 0, c_white, c_white, c_white, c_white, ((opt == 3 ? 1 : 0.5) * alphapause))
    draw_set_alpha(1)
}
draw_sprite_ext(spr_dsipause, -1, 480, 270, scaledsi, scaledsi, 0, c_white, 1)
