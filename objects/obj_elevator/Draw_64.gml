if (yoffest > -540)
{
    var w = 0
    var h = 0
    var pad = 16
    var yy = 0
    for (var i = 0; i < array_length(level_array); i++)
    {
        var txt = level_array[i][1]
        if (string_width(txt) > w)
            w = string_width(txt)
        h += string_height(txt)
    }
    w += pad
    h += pad
    yy = (270 + (h / 2))
    draw_rectangle_color((480 - (w / 2)), ((270 - (h / 2)) + yoffest), (480 + (w / 2)), (yy + yoffest), c_black, c_black, c_black, c_black, 0)
    yy -= (pad / 2)
    draw_set_valign(fa_bottom)
    draw_set_halign(fa_center)
    draw_set_font(global.bigfont)
    for (i = 0; i < array_length(level_array); i++)
    {
        var c = (selected == i ? c_white : c_gray)
        txt = level_array[i][1]
        draw_text_color(480, (yy + yoffest), txt, c, c, c, c, 1)
        yy -= string_height(txt)
    }
    draw_set_valign(fa_top)
    draw_set_halign(fa_center)
}
