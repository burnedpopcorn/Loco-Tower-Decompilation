function scr_sound() //scr_sound
{
    var snd = argument[irandom((argument_count - 1))]
    global.music = audio_play_sound(snd, 10, true)
    audio_sound_gain(global.music, (0.6 * global.option_music_volume), 0)
    return global.music;
}

function scr_music(argument0, argument1) //scr_music
{
    if (argument1 == undefined)
        argument1 = 0
    var m = audio_play_sound_on(global.musicemitter, argument0, 10, 1)
    audio_sound_gain(m, ((audio_sound_get_gain(argument0) * 0.8) * global.option_music_volume), 0)
    return m;
}

function set_master_gain(argument0) //set_master_gain
{
    var num = audio_get_listener_count()
    for (var i = 0; i < num; i++)
    {
        var info = audio_get_listener_info(i)
        audio_set_master_gain(ds_map_find_value(info, "index"), argument0)
        ds_map_destroy(info)
    }
    return;
}

