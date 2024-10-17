if (other.state != 6)
{
    if audio_is_playing(sfx_collecttopping)
        audio_stop_sound(sfx_collecttopping)
    audio_sound_pitch(scr_soundeffect(sfx_collecttopping), (1 + random(0.2)))
    global.collectspecial += 1
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(global.collectspecial)
    if (global.collectspecial == global.collectspecialmax && (!audio_is_playing(sfx_collecttoppin)))
        scr_soundeffect(sfx_collecttoppin)
    instance_destroy()
}
