function scr_player_tumble() //scr_player_tumble
{
    hsp = (xscale * movespeed)
    if ((!scr_slope()) && sprite_index == spr_tumblestart && floor(image_index) < 11)
        image_index = 11
    if ((sprite_index == spr_crouchslip || sprite_index == spr_player_crouchslidestart) && grounded && (!(place_meeting(x, (y + 1), obj_solid))) && scr_slope() && movespeed < 1)
    {
        with (instance_place(x, (y + 1), obj_slope))
            other.xscale = (-sign(image_xscale))
        movespeed = 1
    }
    if ((!grounded) && (sprite_index == spr_machroll || sprite_index == spr_mach2jump || sprite_index == spr_player_backslide || sprite_index == spr_player_backslideland || sprite_index == spr_crouchslip || sprite_index == spr_player_crouchslidestart))
    {
        vsp = 10
        sprite_index = spr_dive
    }
    if (grounded && sprite_index == spr_dive)
    {
        sprite_index = spr_machroll
        image_index = 0
    }
    if (sprite_index == spr_dive && key_jump)
    {
        sprite_index = spr_player_poundcancel1
        image_index = 0
        state = 74
        dir = xscale
        vsp = -6
    }
    if (grounded && sprite_index == spr_player_jumpdive2)
    {
        sprite_index = spr_crouchslip
        image_index = 0
    }
    if (sprite_index == spr_mach2jump && grounded)
    {
        image_index = 0
        sprite_index = spr_machroll
    }
    if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_tumble
    if (sprite_index == spr_player_crouchslidestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_crouchslip
    if (sprite_index == spr_machroll && (!grounded))
        sprite_index = spr_mach2jump
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_backslideland)
        sprite_index = spr_player_backslide
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (crouchslipbuffer > 0)
        crouchslipbuffer--
    if ((!key_down) && key_attack && grounded && sprite_index != spr_player_jumpdive2 && sprite_index != spr_tumble && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        if (crouchslipbuffer == 0)
        {
            particle_set_scale(5, xscale, 1)
            create_particle(x, y, 5, 0)
            if (movespeed >= 12)
                state = 91
            else
                state = 70
            image_index = 0
            sprite_index = spr_rollgetup
        }
    }
    if ((!key_down) && (!key_attack) && grounded && sprite_index != spr_player_jumpdive2 && sprite_index != spr_tumble && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        if (crouchslipbuffer == 0)
        {
            if (movespeed > 6)
            {
                state = 71
                sprite_index = spr_machslidestart
                image_index = 0
            }
            else
                state = (0 << 0)
        }
    }
    if (input_buffer_jump < 8 && grounded && (sprite_index == spr_crouchslip || sprite_index == spr_player_crouchslidestart || sprite_index == spr_player_jumpdive2) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        state = 70
        vsp = -11
        if (movespeed < 6)
            movespeed = 6
        else
            movespeed += 1
        sprite_index = spr_secondjump1
        image_index = 0
        input_down_buffer = 30
        with (instance_create(x, y, obj_superdashcloud))
            image_xscale = other.xscale
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && sprite_index == spr_tumble && hsp != 0)
        vsp = -9
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if ((place_meeting_solid((x + sign(hsp)), y) && (!(place_meeting_slope((x + sign(hsp)), (y + 1)))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (grounded && (place_meeting_collision((x + sign(hsp)), (y - 64)) || place_meeting_solid((x + sign(hsp)), (y - 64))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && place_meeting_slope(x, (y + 1))))
    {
        hsp = 0
        movespeed = 0
        if (sprite_index == spr_tumble || sprite_index == spr_tumblestart)
        {
            scr_soundeffect(sfx_tumble4)
            state = 72
            landAnim = 0
            sprite_index = spr_tumbleend
            image_index = 0
            hsp = ((-xscale) * 2)
            vsp = -3
            jumpstop = 1
        }
        else
        {
            scr_soundeffect(sfx_splat)
            state = 72
            image_index = 0
            sprite_index = spr_player_wallsplat
        }
    }
    image_speed = (abs(movespeed) / 15)
}

