if audio_is_playing(mu_pizzatime)
{
    var mustrack = audio_sound_get_track_position(global.music)
    if (mustrack >= 1 && (!activate[0]))
    {
        alpha[0] = 1
        activate[0] = 1
    }
    if (mustrack >= 1.5 && (!activate[1]))
    {
        alpha[1] = 1
        activate[1] = 1
    }
    if (mustrack >= 2 && (!activate[2]))
    {
        alpha[2] = 1
        activate[2] = 1
    }
    if (mustrack >= 7.35 && (!falling))
    {
        vsp[0] = -4
        hsp[0] = -3
        vsp[1] = -7
        hsp[1] = 0
        vsp[2] = -4
        hsp[2] = 3
        falling = 1
    }
}
for (var i = 0; i < 3; i++)
{
    if (size[i] <= 1 && (!done[i]))
    {
        scr_soundeffect(sfx_punch)
        shake[i] = 8
        done[i] = 1
    }
    if falling
    {
        vsp[i] = Approach(vsp[i], 20, 0.4)
        X[i] += hsp[i]
        Y[i] += vsp[i]
    }
    size[i] = Approach(size[i], (activate[i] ? 1 : 2), 0.1)
    shake[i] = Approach(shake[i], 0, 0.5)
}
