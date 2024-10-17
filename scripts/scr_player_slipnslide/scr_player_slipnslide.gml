function scr_player_slipnslide() //scr_player_slipnslide
{
    sprite_index = (place_meeting(x, y, obj_currentwater) ? spr_machfreefall : spr_slipnslide)
    image_speed = 0.35
    move = (key_left + key_right)
    var movey = ((-key_up) + key_down)
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    hsp = movespeed
    if (movespeed > 0)
        xscale = 1
    if (movespeed < 0)
        xscale = -1
    if ((!(place_meeting(x, (y + 1), obj_slope))) && (!(place_meeting(x, y, obj_currentwater))))
        movespeed = Approach(movespeed, 0, 0.25)
    machhitAnim = 0
    crouchslideAnim = 1
    if place_meeting(x, y, obj_currentwater)
    {
        grav = 0
        if (!cantvspmove)
        {
            if (movey != 0)
                vsp = Approach(vsp, (movey * 5), 0.4)
            else
                vsp = Approach(vsp, 0, 0.2)
        }
        if (!canthspmove)
        {
            if (move != 0)
                movespeed = Approach(movespeed, (move * 9), 0.4)
            else
                movespeed = Approach(movespeed, 0, 0.2)
        }
    }
    else
        grav = 0.5
    if (movespeed == 0 && (!scr_slope()) && (!(place_meeting(x, y, obj_currentwater))))
    {
        state = (0 << 0)
        movespeed = 0
        mach2 = 0
        image_index = 0
    }
    if (place_meeting_collision((x + xscale), y) && (!(place_meeting((x + hsp), y, obj_currentwater))) && (!(place_meeting_slope((x + sign(hsp)), y))))
    {
        var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
        if _bump
        {
            scr_soundeffect(sfx_bumpwall)
            state = 72
            image_index = 0
            sprite_index = spr_player_wallsplat
        }
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && (movespeed > 1.5 || movespeed < -1.5) && (!(place_meeting(x, y, obj_currentwater))))
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
}

