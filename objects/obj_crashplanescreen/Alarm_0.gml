if (alpha == 0 && activated == 0)
{
    activated = 1
    audio_sound_pitch(scr_soundeffect(sfx_ripplane), 0.9)
    alarm[0] = 400
}
if (alpha == 1 && activated == 1)
{
    activated = 0
    ending = 1
}
