draw_set_font(global.creditsfont)
if (key_select == -1)
    draw_text_colour(280, 50, string_hash_to_newline("ATRÁS"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(280, 50, string_hash_to_newline("ATRÁS"), c_white, c_white, c_white, c_white, 0.5)
if (key_select == 0)
    draw_text_colour(420, 50, string_hash_to_newline("UP"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 50, string_hash_to_newline("UP"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 50, string_hash_to_newline(scr_keyname(global.key_up)))
if (key_select == 1)
    draw_text_colour(420, 100, string_hash_to_newline("DOWN"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 100, string_hash_to_newline("DOWN"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 100, string_hash_to_newline(scr_keyname(global.key_down)))
if (key_select == 2)
    draw_text_colour(420, 150, string_hash_to_newline("RIGHT"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 150, string_hash_to_newline("RIGHT"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 150, string_hash_to_newline(scr_keyname(global.key_right)))
if (key_select == 3)
    draw_text_colour(420, 200, string_hash_to_newline("LEFT"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 200, string_hash_to_newline("LEFT"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 200, string_hash_to_newline(scr_keyname(global.key_left)))
if (key_select == 4)
    draw_text_colour(420, 250, string_hash_to_newline("JUMP"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 250, string_hash_to_newline("JUMP"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 250, string_hash_to_newline(scr_keyname(global.key_jump)))
if (key_select == 5)
    draw_text_colour(420, 300, string_hash_to_newline("GRAB"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 300, string_hash_to_newline("GRAB"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 300, string_hash_to_newline(scr_keyname(global.key_slap)))
if (key_select == 6)
    draw_text_colour(420, 350, string_hash_to_newline("DASH"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 350, string_hash_to_newline("DASH"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 350, string_hash_to_newline(scr_keyname(global.key_attack)))
if (key_select == 7)
    draw_text_colour(420, 400, string_hash_to_newline("TAUNT"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 400, string_hash_to_newline("TAUNT"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 400, string_hash_to_newline(scr_keyname(global.key_taunt)))
if (key_select == 8)
    draw_text_colour(420, 450, string_hash_to_newline("PAUSE"), c_white, c_white, c_white, c_white, 1)
else
    draw_text_colour(420, 450, string_hash_to_newline("PAUSE"), c_white, c_white, c_white, c_white, 0.5)
draw_text(580, 450, string_hash_to_newline(scr_keyname(global.key_start)))
