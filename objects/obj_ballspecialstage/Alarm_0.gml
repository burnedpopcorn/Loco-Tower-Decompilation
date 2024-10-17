if (vspinvert == 1)
{
    if (anglevertx == 180)
    {
        if key_jump2
            vsp = 15
        else
            vsp = 8
    }
    else if key_jump2
        vsp = -15
    else
        vsp = -8
    scr_soundeffect(sfx_jump)
}
else if (hspinvert == 1)
{
    if key_jump2
        movespeed = ((-movespeed) * 2)
    else
        movespeed = (-movespeed)
    scr_soundeffect(sfx_jump)
}
state = 0
hspinvert = 0
vspinvert = 0
