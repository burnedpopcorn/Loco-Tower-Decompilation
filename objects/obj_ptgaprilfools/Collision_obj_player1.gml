if ((!jumpscare) && (!fading))
{
    visible = true
    audio_stop_all()
    repeat (10)
        scr_soundeffect(sfx_bear5)
    alarm[0] = 400
    jumpscare = 1
}
