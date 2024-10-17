with (other.id)
{
    if (!(global.laps >= 5))
    {
        if (instance_exists(other.baddieID) && state != 2 && state != 51 && state != 24 && state != 18)
        {
            state = 2
            xscale = other.baddieID.image_xscale
            movespeed = 14
            vsp = 0
            sprite_index = spr_tumble
        }
    }
    else
    {
        sprite_index = spr_player_rockethitwall
        vsp = -11
        movespeed += 2
        if (movespeed > 14)
            movespeed = 14
        xscale = other.image_xscale
        hsp = (movespeed * xscale)
        image_index = 0
        if (state != 119)
        {
            scr_soundeffect(sfx_punch)
            state = 119
        }
    }
}
