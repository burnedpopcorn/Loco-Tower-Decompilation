if (global.panic && obj_music.startbgescape == 1)
{
    var roomname = room_get_name(room)
    if (string_letters(roomname) == "Nhall")
    {
        var lay_id = layer_get_id("Backgrounds_1")
        var bg_id = layer_background_get_id(lay_id)
        if (layer_background_get_sprite(bg_id) == 158)
            layer_background_change(bg_id, 1745)
        var lay_id2 = layer_get_id("Backgrounds_2")
        var bg_id2 = layer_background_get_id(lay_id2)
        if (layer_background_get_sprite(bg_id2) == 347)
            layer_background_change(bg_id2, 554)
    }
    if (string_letters(roomname) == "Nhallsecret")
    {
        lay_id = layer_get_id("Backgrounds_sky3scroll")
        bg_id = layer_background_get_id(lay_id)
        layer_background_change(bg_id, 1826)
    }
    if (string_letters(roomname) == "Nlocotown" || string_letters(roomname) == "Nlocotownb")
    {
        lay_id = layer_get_id("Backgrounds_sky5")
        bg_id = layer_background_get_id(lay_id)
        if (layer_background_get_sprite(bg_id) == 1160)
            layer_background_change(bg_id, 1200)
        lay_id2 = layer_get_id("Backgrounds_sky4")
        bg_id2 = layer_background_get_id(lay_id2)
        if (layer_background_get_sprite(bg_id2) == 772)
            layer_background_change(bg_id2, 1203)
        var lay_id3 = layer_get_id("Backgrounds_sky3")
        var bg_id3 = layer_background_get_id(lay_id3)
        if (layer_background_get_sprite(bg_id3) == 1739)
            layer_background_change(bg_id3, 513)
    }
    var bricksfalling = layer_create(-350, "Foreground_escape")
    var back = layer_background_create(bricksfalling, bg_fallingbricksforefront)
    layer_background_htiled(back, 1)
    layer_background_vtiled(back, 1)
    if (global.lap3activate == 0 && obj_music.music == 192)
        layer_vspeed(bricksfalling, 0)
    else
        layer_vspeed(bricksfalling, (global.lap3activate == 1 ? -4 : 4))
}
