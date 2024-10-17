draw_set_alpha(1)
draw_set_font(global.bigfont)
draw_set_color(c_white)
var c = optionselected
draw_set_halign(fa_left)
draw_text_color(16, 48, "BACK", c_white, c_white, c_white, c_white, (c == 0 ? 1 : 0.5))
draw_set_halign(fa_center)
draw_text_color(480, 96, ("SMOOTH CAMERA " + (optionsaved_smoothcamera ? "YES" : "NO")), c_white, c_white, c_white, c_white, (c == 1 ? 1 : 0.5))
draw_text_color(480, 192, ("ANGLE ROTATION " + (optionsaved_anglerotation ? "YES" : "NO")), c_white, c_white, c_white, c_white, (c == 2 ? 1 : 0.5))
draw_text_color(480, 288, ("DANIKYO " + (optionsaved_danikyo ? "YES" : "NO")), c_white, c_white, c_white, c_white, (c == 3 ? 1 : 0.5))
draw_text_color(480, 384, ("MUTE SOUNDS WHEN UNFOCUSED" + (optionsaved_unfocus ? "YES" : "NO")), c_white, c_white, c_white, c_white, (c == 4 ? 1 : 0.5))
