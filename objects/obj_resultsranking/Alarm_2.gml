if (lapsmax < global.laps)
{
    lapsmax += 1
    scr_soundeffect(sfx_punch)
    shakelaps = 3
    alarm[2] = 50
}
if (lapsmax == global.laps)
{
    shakelaps = 3
    alarm[4] = 200
}
