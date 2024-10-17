if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1)
        audio_stop_sound(sfx_breakblock2)
    }
    scr_soundeffect(sfx_breakblock1, 98)
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
    var x1 = ((x - sprite_xoffset) + (sprite_width / 2))
    var y1 = ((y - sprite_yoffset) + (sprite_height / 2))
    repeat (3)
    {
        with (create_debris(x1, y1, 923))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    instance_create(x1, y1, obj_bangeffect)
    global.combotime = 60
    global.heattime = 60
    global.combo += 1
    with (obj_player1)
        supercharge += 1
    var combototal = (10 + floor((global.combo * 0.5)))
    global.collect += combototal
    global.comboscore += combototal
    ds_list_add(global.saveroom, id)
}
