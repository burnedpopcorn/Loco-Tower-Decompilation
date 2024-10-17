with (other)
{
    if (state == 44 || state == 118 || (state == 51 && styledtaunting))
    {
        if (hsp != 0)
            xscale = sign(hsp)
        movespeed = abs(hsp)
        state = (0 << 0)
        sprite_index = spr_idle
        dir = xscale
        styledtaunting = 0
        scr_soundeffect(sfx_detransform)
        create_debris(x, (y - 40), 1231)
        instance_create(x, y, obj_genericpoofeffect)
    }
}
