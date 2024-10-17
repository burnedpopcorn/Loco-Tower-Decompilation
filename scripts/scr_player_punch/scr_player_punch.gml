function scr_player_punch() //scr_player_punch
{
    var _Sjumpcancel = sprite_index == spr_player_Sjumpcancel
    var _kungfumove = sprite_index == spr_player_kungfujump
    var _breakdanceuppercut = (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)
    move = (key_left + key_right)
    if ((!_kungfumove) && (!_Sjumpcancel) && _breakdanceuppercut)
    {
        move = (key_left + key_right)
        landAnim = 1
        jumpstop = 0
        image_speed = 0.4
        hsp = movespeed
        if (move != 0)
        {
            dir = move
            movespeed = Approach(movespeed, (move * 4), 0.5)
        }
        else
            movespeed = Approach(movespeed, 0, 0.5)
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdanceuppercut)
            sprite_index = spr_player_breakdanceuppercutend
        if (grounded && vsp > 0 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
        {
            if (hsp != 0)
            {
                dir = sign(hsp)
                xscale = dir
            }
            movespeed = abs(movespeed)
            state = (0 << 0)
        }
    }
    if ((_kungfumove || _Sjumpcancel) && (!_breakdanceuppercut))
    {
        if (move != 0)
        {
            if (move != xscale && movespeed > -6)
            {
                if (sprite_index != spr_player_kungfujump)
                    movespeed -= 1
                else
                    movespeed -= 0.1
            }
            else if (move == xscale && movespeed < 6 && sprite_index == spr_player_kungfujump)
                movespeed += 0.2
        }
    }
    if ((!_kungfumove) && (!_Sjumpcancel) && (!_breakdanceuppercut))
    {
        if grounded
        {
            if (dir != xscale)
            {
                dir = xscale
                movespeed = 2
                facehurt = 0
            }
            jumpstop = 0
            anger = 100
            if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
                hsp = (move * movespeed)
            else if place_meeting(x, (y + 1), obj_railh)
                hsp = ((move * movespeed) - 5)
            else if place_meeting(x, (y + 1), obj_railh2)
                hsp = ((move * movespeed) + 5)
            if (move != 0)
            {
                if (movespeed < 7)
                    movespeed += 0.5
                else if (floor(movespeed) == 7)
                    movespeed = 7
            }
            else
                movespeed = 0
            if (movespeed > 7)
                movespeed -= 0.1
            if (move != 0)
            {
                if (movespeed < 3 && move != 0)
                    image_speed = 0.35
                else if (movespeed > 3 && movespeed < 6)
                    image_speed = 0.45
                else
                    image_speed = 0.6
            }
            else
                image_speed = 0.35
        }
        if (!grounded)
        {
            if (momemtum == 0)
                hsp = (move * movespeed)
            else
                hsp = (xscale * movespeed)
            if (move != xscale && momemtum == 1 && movespeed != 0)
                movespeed -= 0.05
            if (movespeed == 0)
                momemtum = 0
            if ((move == 0 && momemtum == 0) || scr_solid((x + hsp), y))
            {
                movespeed = 0
                mach2 = 0
            }
            if (move != 0 && movespeed < 7)
                movespeed += 0.25
            if (movespeed > 7)
                movespeed -= 0.05
            if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
                movespeed = 0
            if (dir != xscale)
            {
                mach2 = 0
                dir = xscale
                movespeed = 0
            }
            if (move == (-xscale))
            {
                mach2 = 0
                movespeed = 0
                momemtum = 0
            }
            landAnim = 1
            if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
            {
                vsp /= 5
                jumpstop = 1
            }
            if (ladderbuffer > 0)
                ladderbuffer--
            if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
            {
                vsp = grav
                jumpstop = 1
            }
        }
        jumpAnim = 1
        dashAnim = 1
        landAnim = 0
        moveAnim = 1
        stopAnim = 1
        crouchslideAnim = 1
        crouchAnim = 1
        if (floor(image_index) == (image_number - 1) || move == (-xscale))
            state = (0 << 0)
        sprite_index = spr_punch
        image_speed = 0.35
    }
    if (_Sjumpcancel && (!_kungfumove) && (!_breakdanceuppercut))
    {
        hsp = (movespeed * xscale)
        if (grounded && vsp > 0)
        {
            if key_attack
            {
                if (movespeed >= 12)
                    state = 91
                else
                    state = 70
                sprite_index = spr_rollgetup
                image_index = 0
            }
            else if (movespeed > 6)
            {
                state = 71
                sprite_index = spr_machslidestart
                image_index = 0
            }
            else
                state = (0 << 0)
        }
    }
    if (sprite_index != spr_player_kungfujump && (!_breakdanceuppercut) && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_slope))))
    {
        vsp = -4
        sprite_index = spr_player_kungfujump
        state = 47
        movespeed = -6
    }
    if ((!_Sjumpcancel) && _kungfumove)
    {
        hsp = (movespeed * xscale)
        if (grounded && vsp >= 0)
            state = (0 << 0)
    }
}

