if (y > 600)
{
    if (!audio_is_playing(sfx_scream7))
        scr_soundeffect(sfx_scream7)
}
if (y > 750)
{
    scr_soundeffect(sfx_explosion)
    audio_stop_sound(sfx_scream7)
    instance_destroy()
    instance_create(x, y, obj_crashplanescreen)
}
