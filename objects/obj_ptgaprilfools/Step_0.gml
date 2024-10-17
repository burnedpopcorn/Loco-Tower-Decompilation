if jumpscare
{
    xscale = Approach(xscale, 50, 0.5)
    yscale = Approach(yscale, 50, 0.5)
}
if fading
{
    fade = Approach(fade, 1, 0.05)
    if (fade == 1 && audio_is_playing(sfx_bear5))
    {
        alarm[1] = 150
        instance_deactivate_all(true)
        audio_stop_sound(sfx_bear5)
    }
}
if ((!ending) && video_get_status() == 2)
    video_pause()
else if (ending && video_get_status() == 3)
    video_resume()
