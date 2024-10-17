function scr_player_mach2() //scr_player_mach2
{
    if (windingAnim < 2000)
        windingAnim++
    hsp = (xscale * movespeed)
    if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
        hsp = (xscale * movespeed)
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = ((xscale * movespeed) - 5)
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = ((xscale * movespeed) + 5)
    move2 = (key_right2 + key_left2)
    if upsidedown
        move = (-((key_right + key_left)))
    else
        move = (key_right + key_left)
    crouchslideAnim = 1
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && can_jump && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
    {
        image_index = 0
        sprite_index = spr_secondjump1
        scr_soundeffect(sfx_jump)
        if upsidedown
        {
            vsp = 11
            upsidedown = 0
        }
        else
            vsp = -11
    }
    if (grounded && vsp > 0)
    {
        if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach4 && sprite_index != spr_player_machhit)
        {
            if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup)
                sprite_index = spr_mach
        }
        if (machpunchAnim == 1)
        {
            if (punch == 0)
                sprite_index = spr_machpunch1
            if (punch == 1)
                sprite_index = spr_machpunch2
            if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
            {
                punch = 1
                machpunchAnim = 0
            }
            if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
            {
                punch = 0
                machpunchAnim = 0
            }
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_longjump)
        sprite_index = spr_player_longjumpend
    if ((!(place_meeting_slope(x, (y - 1)))) && (!(place_meeting_solid(x, (y - 1)))) && (!((place_meeting_slope((x - hsp), y) && place_meeting_solid((x - hsp), (y - 16))))))
    {
        if upsidedown
            upsidedown = 0
    }
    if (!grounded)
        machpunchAnim = 0
    if grounded
    {
        if (scr_slope() && hsp != 0)
            scr_player_addslopemomentum(0.1, 0.2, 9)
        if (movespeed < 12)
        {
            if (mach4mode == 0)
                movespeed += 0.1
            else
                movespeed += 0.2
        }
        if (movespeed >= 12 && global.coop == 0)
        {
            machhitAnim = 0
            state = 91
            flash = 1
            if (sprite_index != spr_rollgetup)
                sprite_index = spr_mach4
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
        }
    }
    if key_jump
        input_buffer_jump = 0
    if (key_down && (!upsidedown) && (input_down_buffer <= 0 || grounded) && (!(place_meeting(x, y, obj_dashpad))))
    {
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        flash = 0
        state = (2 << 0)
        vsp = 10
        image_index = 0
        if (!grounded)
            sprite_index = spr_mach2jump
        else
            sprite_index = spr_machroll
    }
    if ((((!grounded) && (((place_meeting_collision((x + sign(hsp)), y) || place_meeting_solid((x + sign(hsp)), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting_slope((x + sign(hsp)), y)))) || place_meeting_slope((x + sign(hsp)), (y - 1)))) || (grounded && (place_meeting_collision((x + hsp), (y - 64)) || place_meeting_solid((x + hsp), (y - 64))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting_slope(x, (y + 1)))) && (!upsidedown))
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
            wallspeed = movespeed
            grabclimbbuffer = 0
            if (movespeed < 1)
                wallspeed = 1
            else
                movespeed = wallspeed
            state = 17
        }
    }
    if (upsidedown && (!(place_meeting_slope(x, (y - 1)))) && (!(place_meeting_solid(x, (y - 1)))) && place_meeting_slope((x - hsp), y) && place_meeting_solid((x - hsp), (y - 16)))
    {
        hsp = 0
        xscale *= -1
        wallspeed = movespeed
        grabclimbbuffer = 0
        if (movespeed < 1)
            wallspeed = 1
        else
            movespeed = wallspeed
        state = 17
        upsidedown = 0
    }
    if (upsidedown && place_meeting_solid(x, (y - 1)) && place_meeting_solid((x + sign(hsp)), (y + 64)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting_slope(x, (y - 1)))
    {
        wallspeed = movespeed
        grabclimbbuffer = 0
        if (movespeed < 1)
            wallspeed = 1
        else
            movespeed = wallspeed
        state = 17
    }
    if (grounded && (!scr_slope()) && (place_meeting_collision((x + sign(hsp)), y) || place_meeting_solid((x + sign(hsp)), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting_slope((x + sign(hsp)), y))))
    {
        var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
        if _bump
        {
            scr_soundeffect(sfx_splat)
            state = 72
            image_index = 0
            sprite_index = spr_player_wallsplat
        }
    }
    if (key_slap2 && (!key_up) && (!genomode))
    {
        if upsidedown
            upsidedown = 0
        alarm[8] = 60
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        sfx_gain(suplexdashsnd)
        state = 22
        if (movespeed < 5)
            movespeed = 5
        image_index = 0
        if (shotgunAnim == 0)
            sprite_index = spr_suplexdash
        else
            sprite_index = spr_shotgunsuplexdash
        particle_set_scale(5, xscale, 1)
        create_particle(x, y, 5, 0)
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach1)
        sprite_index = spr_mach
    if (grounded && floor(image_index) == (image_number - 1) && sprite_index == spr_rollgetup)
        sprite_index = spr_mach
    if ((!grounded) && sprite_index != spr_secondjump2 && sprite_index != spr_player_longjump && sprite_index != spr_dive && sprite_index != spr_player_longjumpend && sprite_index != spr_mach2jump && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_walljumpend)
        sprite_index = spr_secondjump1
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
        sprite_index = spr_secondjump2
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend
    if (key_slap2 && key_up && (!upsidedown))
    {
        state = 47
        image_index = 0
        sprite_index = spr_player_breakdanceuppercut
        scr_soundeffect(sfx_uppercut)
        if grounded
            vsp = -14
        else
            vsp = -10
        movespeed = hsp
    }
    if (key_attack && (!(place_meeting((x + xscale), y, obj_solid))) && character == "S" && grounded)
    {
        state = 22
        movespeed = 0
    }
    scr_dotaunt()
    if (((!key_attack) && move != xscale && grounded) || (character == "S" && move == 0 && grounded))
    {
        if upsidedown
            upsidedown = 0
        if (sprite_index != spr_mach1)
        {
            image_index = 0
            state = 71
            scr_soundeffect(sfx_break)
            sprite_index = spr_machslidestart
        }
        else
        {
            movespeed = 0
            state = (0 << 0)
        }
    }
    if (move == (-xscale) && movespeed >= 8 && grounded)
    {
        scr_soundeffect(sfx_machslideboost)
        image_index = 0
        state = 71
        sprite_index = spr_machslideboost
        if upsidedown
            upsidedown = 0
    }
    else if (move == (-xscale) && movespeed < 8 && grounded)
    {
        if upsidedown
            upsidedown = 0
        xscale *= -1
        movespeed = 6
    }
    if (key_slap2 && genomode && (!key_up))
        scr_genoshoot()
    if ((object_index == obj_player1 && place_meeting(x, y, obj_player2) && obj_player1.hurted == 0 && obj_player2.hurted == 0) || (object_index == obj_player2 && place_meeting(x, y, obj_player1) && obj_player2.hurted == 0 && obj_player1.hurted == 0))
    {
        if (object_index == obj_player1)
        {
            obj_player1.state = 91
            obj_player2.state = 109
            obj_player2.xscale = xscale
            if (obj_player1.spotlight == 0)
            {
                obj_camera.shoving = 1
                obj_camera.image_index = 0
            }
            obj_player1.spotlight = 1
            scr_changetoppings()
            obj_player1.depth = -7
            obj_player2.depth = -6
        }
        if (object_index == obj_player2)
        {
            obj_player2.state = 91
            obj_player1.state = 109
            obj_player1.xscale = xscale
            if (obj_player1.spotlight == 1)
            {
                obj_camera.shoving = 1
                obj_camera.image_index = 0
            }
            obj_player1.spotlight = 0
            scr_changetoppings()
            obj_player1.depth = -6
            obj_player2.depth = -7
        }
        obj_player1.image_index = 0
        obj_player2.image_index = 0
        obj_player1.sprite_index = obj_player1.spr_fightball
        obj_player2.sprite_index = obj_player2.spr_fightball
        obj_player1.fightball = 1
        obj_player2.fightball = 1
    }
    if (move == xscale && (!key_attack) && grounded)
    {
        if upsidedown
            upsidedown = 0
        state = (0 << 0)
    }
    if (sprite_index == spr_mach2jump)
        image_speed = 0.65
    else if (sprite_index == spr_rollgetup || sprite_index == spr_player_longjumpend || sprite_index == spr_player_longjump || sprite_index == spr_suplexdash)
        image_speed = 0.4
    else
        image_speed = (abs(movespeed) / 15)
}

