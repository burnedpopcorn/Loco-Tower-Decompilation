pause = 0
master_gain = 1
windowsstate = 1
windowsprevstate = 1
var i = 0
scaledsi = 1.5
scaletext = 0
alphapause = 0
alphapausetile = 0
color = make_color_rgb(121, 103, 151)
spr_player = spr_player_idle2
peppino_sprite_number = sprite_get_number(spr_player)
peppino_index = 0
selected = 0
image_speed = 0
shroomdone = 0
cheesedone = 0
tomatodone = 0
sausagedone = 0
pineappledone = 0
opcionesdirect = 0
cantmove = 0
depth = -998
draw_screen = 0
lastcollect = -1
toppin_sprite[0] = spr_pizzakinshroom
toppin_sprite[1] = spr_pizzakincheese
toppin_sprite[2] = spr_pizzakintomato
toppin_sprite[3] = spr_pizzakinsausage
toppin_sprite[4] = spr_pizzakinpineapple
xkin[0] = 569
xkin[1] = 619
xkin[2] = 687
xkin[3] = 756
xkin[4] = 811
ykin[0] = 187
ykin[1] = 149
ykin[2] = 103
ykin[3] = 137
ykin[4] = 187
for (i = 0; i < array_length(toppin_sprite); i++)
{
    toppin_number[i] = sprite_get_number(toppin_sprite[i])
    toppin_index[i] = 0
    toppin_has[i] = 0
}
ini_open("saveData.ini")
global.language = ini_read_string("Option", "language", "esp")
global.languagemap = -1
var langbuffer = buffer_load((("languages/lang_" + global.language) + ".json"))
if (langbuffer > -1)
{
    global.languagemap = json_decode(buffer_read(langbuffer, buffer_string))
    buffer_delete(langbuffer)
    show_debug_message("loaded the language file I tghink")
}
else if (langbuffer == -1)
{
    buffer_delete(langbuffer)
    show_message("oopsies game failed to load the language file")
    game_end()
}
ini_close()
