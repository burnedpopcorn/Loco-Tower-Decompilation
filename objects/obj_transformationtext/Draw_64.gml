t++
draw_set_font(global.creditsfont)
draw_set_halign(fa_center)
var textmid = (string_width(message) / 2)
var tx = (480 - textmid)
for (var i = 0; i < string_length(message); i++)
{
    var stringy = string_copy(message, (i + 1), 1)
    var so = (t + i)
    var shift = (sin((((so * pi) * freq) / room_speed)) * amplitude)
    var col = make_color_hsv((t + i), 255, 255)
    var col2 = make_color_hsv(((t + i) + 75), 255, 255)
    draw_text_transformed_color(tx, (476 + shift), stringy, 1, 1, 0, col, col, col2, col2, alpha)
    tx += string_width(stringy)
}
