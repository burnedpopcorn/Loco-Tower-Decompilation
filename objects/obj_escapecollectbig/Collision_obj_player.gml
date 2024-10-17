if (image_alpha == 1)
{
    global.collect += 100
    create_collect(x, y, sprite_index)
    with (instance_create(x, y, obj_smallnumber))
        number = string(100)
    global.combotime = 60
    audio_sound_pitch(scr_soundeffect(sfx_collectbell), (0.8 - random(0.2)))
    create_collect(x, y, sprite_index)
    instance_destroy()
}
