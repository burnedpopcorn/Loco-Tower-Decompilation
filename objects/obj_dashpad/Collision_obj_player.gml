with (other)
{
    if (state != 110 && other.buffer <= 0)
    {
        var changecoord = 1
        if place_meeting(x, y, obj_superspring)
            changecoord = 0
        if changecoord
            y = (other.y - 14)
        vsp = 0
        if (sprite_index != spr_player_dashpad)
        {
            sprite_index = spr_player_dashpad
            image_index = 0
        }
        instance_create(x, y, obj_jumpdust)
        machhitAnim = 0
        state = 91
        xscale = sign(other.image_xscale)
        scr_soundeffect(sfx_dashpad)
        if (movespeed < 14)
        {
            movespeed = 14
            hsp = (xscale * movespeed)
        }
        else
        {
            movespeed += 0.5
            hsp = (xscale * movespeed)
        }
        other.buffer = 30
    }
}
