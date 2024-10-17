function scr_player_handstandjump() //scr_player_handstandjump
{
    landAnim = 0
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    momemtum = 1
    dir = xscale
    if (movespeed < 10)
        movespeed += 0.5
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (move != xscale && move != 0)
    {
        image_index = 0
        if (!grounded)
        {
            sprite_index = spr_player_suplexcancel
            jumpAnim = 1
            grav = 0.5
            state = 58
        }
        else
        {
            state = (0 << 0)
            movespeed = 2
            grav = 0.5
        }
    }
    if ((floor(image_index) == (image_number - 1) || sprite_index == spr_suplexdashjump || sprite_index == spr_suplexdashjumpstart) && grounded && (!key_attack) && vsp > 0)
    {
        image_speed = 0.35
        state = (0 << 0)
        grav = 0.5
    }
    if ((floor(image_index) == (image_number - 1) || sprite_index == spr_suplexdashjump || sprite_index == spr_suplexdashjumpstart) && grounded && key_attack)
    {
        image_speed = 0.35
        state = 70
        grav = 0.5
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexdashjumpstart)
        sprite_index = spr_suplexdashjump
    if (key_down && grounded && vsp > 0)
    {
        grav = 0.5
        movespeed = 12
        machhitAnim = 0
        crouchslipbuffer = 25
        sprite_index = spr_crouchslip
        image_index = 0
        state = (2 << 0)
    }
    if ((!grounded) && (sprite_index == spr_suplexdash || sprite_index == spr_secondjump1 || sprite_index == spr_secondjump2 || sprite_index == spr_shotgunsuplexdash))
    {
        image_index = 0
        sprite_index = spr_suplexdashjump
    }
    if key_jump
        input_buffer_jump = 0
    if (grounded && input_buffer_jump < 8)
    {
        jumpstop = 0
        image_index = 0
        vsp = -11
        state = 70
        scr_soundeffect(sfx_jump)
        sprite_index = spr_player_longjump
    }
    if (grounded && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting_slope((x - sign(hsp)), y))) && (!(place_meeting_slope((x + sign(hsp)), y))))
    {
        var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
        if _bump
        {
            scr_soundeffect(sfx_bumpwall)
            jumpstop = 1
            state = 58
            vsp = -4
            sprite_index = spr_player_suplexbump
            instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
        }
    }
    if (((!grounded) && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting_slope((x + sign(hsp)), y)))) || (grounded && place_meeting((x + hsp), (y - 64), obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting_slope(x, (y + 1))))
    {
        if (character == "T")
        {
            wallspeed = movespeed
            if (vsp > 0)
                wallspeed -= vsp
            state = 17
        }
        else
        {
            wallspeed = 6
            grabclimbbuffer = 10
            state = 17
        }
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    if (character == "S")
    {
        if key_attack
        {
            hsp = 0
            if (movespeed < 20)
                movespeed += 0.5
            if (movespeed == 20)
                sprite_index = spr_snick_superpeelout
            else if (movespeed < 20 && movespeed > 12)
                sprite_index = spr_snick_mach3
            else if (movespeed < 12 && movespeed > 8)
                sprite_index = spr_snick_mach2
            else
                sprite_index = spr_snick_walk
        }
        else if (movespeed >= 12)
            state = 91
        else
        {
            state = (0 << 0)
            movespeed = 0
        }
        if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale
        }
    }
    image_speed = 0.35
}

