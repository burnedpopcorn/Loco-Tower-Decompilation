if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    repeat (6)
    {
        with (instance_create((x + 32), (y + 32), obj_debris))
        {
            if (sprite_index == spr_bigbreakable)
                sprite_index = spr_bigpizzadebris
            else
                sprite_index = spr_halloweenbigdebris
        }
    }
    if audio_is_playing(sfx_collecttopping)
        audio_stop_sound(sfx_collecttopping)
    audio_sound_pitch(scr_soundeffect(sfx_collecttopping), (1 + random(0.2)))
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    var val = heat_calculate(100)
    global.collect += val
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1)
        audio_stop_sound(sfx_breakblock2)
    }
    scr_soundeffect(sfx_breakblock1, 98)
    ds_list_add(global.saveroom, id)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    number = val
}
