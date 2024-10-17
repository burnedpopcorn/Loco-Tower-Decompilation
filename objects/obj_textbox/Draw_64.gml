draw_sprite_ext(spr_textbox, 0, boxx, boxy, boxw, 1, 0, c_white, 1)
draw_sprite(truecharportrait, charportraitindex, boxx, boxy)
if (state == 2)
{
    draw_set_font(font_dialogue)
    draw_set_color(c_white)
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    draw_text_ext((boxx + 140), (boxy + 20), string(string_copy(ttext[currline], 1, floor(textprog))), string_height(string(string_copy(ttext[currline], 1, textprog))), ((targetboxw * 137) - 165))
}
