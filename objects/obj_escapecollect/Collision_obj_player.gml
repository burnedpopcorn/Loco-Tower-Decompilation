if (image_alpha == 1)
{
    if audio_is_playing(sfx_collectclock)
        audio_stop_sound(sfx_collectclock)
    audio_sound_pitch(scr_soundeffect(sfx_collectclock), (0.8 - random(0.2)))
    if (obj_player1.character == "V")
        global.playerhealth = clamp((global.playerhealth + 1), 0, 100)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    var val = heat_calculate(10)
    global.collect += val
    create_collect(x, y, sprite_index)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    instance_destroy()
}
