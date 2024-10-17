function scr_player_climbwall() //scr_player_climbwall
{
    if (windingAnim < 200)
        windingAnim++
    move = (key_left + key_right)
    suplexmove = 0
    vsp = (upsidedown ? wallspeed : (-wallspeed))
    if (wallspeed < 20)
        wallspeed += 0.15
    if (wallspeed < 0)
    {
        if (mach4mode == 0)
            movespeed += 0.2
        else
            movespeed += 0.4
    }
    crouchslideAnim = 1
    sprite_index = spr_machclimbwall
    if ((!key_attack) && grabclimbbuffer == 0)
    {
        state = (0 << 0)
        movespeed = 0
        railmovespeed = 6
        raildir = (-xscale)
        if upsidedown
            upsidedown = 0
    }
    if (!upsidedown)
    {
        if (place_meeting_collision(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(place_meeting_slope((x + xscale), y))) && (!(place_meeting_slope(x, (y - 1)))))
        {
            sprite_index = spr_superjumpland
            scr_soundeffect(sfx_groundpound)
            image_index = 0
            state = 93
            machhitAnim = 0
        }
        if (place_meeting_collision(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting_slope((x + xscale), y) && (!(place_meeting_slope(x, (y - 1)))))
        {
            upsidedown = 1
            vsp = 0
            xscale *= -1
            if (wallspeed < 6)
                wallspeed = 6
            if (wallspeed >= 6 && wallspeed < 12)
            {
                state = 70
                movespeed = wallspeed
            }
            else if (wallspeed >= 12)
            {
                state = 91
                sprite_index = spr_mach4
                movespeed = wallspeed
            }
        }
        if ((!(place_meeting_collision((x + xscale), y))) && (!(place_meeting_collision(x, (y - 1)))) && (!(place_meeting_slope((x - sign(hsp)), y))) && (!(place_meeting_slope((x + sign(hsp)), y))) && (!(place_meeting_slope(x, (y - 1)))))
        {
            instance_create(x, y, obj_jumpdust)
            vsp = 0
            if (wallspeed < 6)
                wallspeed = 6
            if (wallspeed >= 6 && wallspeed < 12)
            {
                state = 70
                movespeed = wallspeed
            }
            else if (wallspeed >= 12)
            {
                state = 91
                sprite_index = spr_mach4
                movespeed = wallspeed
            }
        }
        if (wallspeed < 0 && place_meeting_collision(x, (y + 12)))
            wallspeed = 0
    }
    else
    {
        if (place_meeting_collision(x, (y + 1)) && (!(place_meeting(x, (y + 1), obj_destructibles))) && (!(place_meeting_slope((x + xscale), y))) && (!(place_meeting_slope(x, (y + 1)))))
        {
            sprite_index = spr_superjumpland
            scr_soundeffect(sfx_groundpound)
            image_index = 0
            state = 93
            machhitAnim = 0
            upsidedown = 0
        }
        if (place_meeting_collision(x, (y + 1)) && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting_slope((x + xscale), y) && (!(place_meeting_slope(x, (y + 1)))))
        {
            trace("CLIMBWALL REVERSE")
            upsidedown = 0
            vsp = 0
            xscale *= -1
            if (wallspeed < 6)
                wallspeed = 6
            if (wallspeed >= 6 && wallspeed < 12)
            {
                state = 70
                movespeed = wallspeed
            }
            else if (wallspeed >= 12)
            {
                state = 91
                sprite_index = spr_mach4
                movespeed = wallspeed
            }
        }
        if ((!(place_meeting_collision((x + xscale), y))) && (!(place_meeting_collision(x, (y + 1)))) && (!(place_meeting_slope((x - sign(hsp)), y))) && (!(place_meeting_slope((x + sign(hsp)), y))) && (!(place_meeting_slope(x, (y + 1)))))
        {
            instance_create(x, y, obj_jumpdust)
            upsidedown = 0
            vsp = 0
            if (wallspeed < 6)
                wallspeed = 6
            if (wallspeed >= 6 && wallspeed < 12)
            {
                state = 70
                movespeed = wallspeed
            }
            else if (wallspeed >= 12)
            {
                state = 91
                sprite_index = spr_mach4
                movespeed = wallspeed
            }
        }
    }
    if key_jump
    {
        key_jump = 0
        movespeed = 10
        state = 70
        image_index = 0
        sprite_index = spr_walljumpstart
        if upsidedown
            upsidedown = 0
        else
            vsp = -11
        xscale *= -1
        jumpstop = 0
    }
    if (sprite_index == spr_machclimbwall)
        image_speed = (wallspeed / 20)
    else
        image_speed = 0.35
    if (!instance_exists(obj_cloudeffect))
        instance_create(x, (y + 43), obj_cloudeffect)
}

