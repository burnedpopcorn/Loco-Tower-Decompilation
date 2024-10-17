function scr_player_mach3() //scr_player_mach3
{
    if (windingAnim < 2000)
        windingAnim++
    if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
        hsp = (xscale * movespeed)
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = ((xscale * movespeed) - 5)
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = ((xscale * movespeed) + 5)
    mach2 = 100
    momemtum = 1
    if upsidedown
        move = (-((key_right + key_left)))
    else
        move = (key_right + key_left)
    move2 = (key_right2 + key_left2)
    if (fightball == 1 && global.coop == 1)
    {
        if (object_index == obj_player1)
        {
            x = obj_player2.x
            y = obj_player2.y
        }
        if (object_index == obj_player2)
        {
            x = obj_player1.x
            y = obj_player1.y
        }
    }
    if grounded
    {
        if (scr_slope() && hsp != 0)
            scr_player_addslopemomentum(0.1, 0.2, 11)
    }
    if ((!(place_meeting_slope(x, (y - 1)))) && (!(place_meeting_solid(x, (y - 1)))) && (!((place_meeting_slope((x - hsp), y) && place_meeting_solid((x - hsp), (y - 16))))))
    {
        if upsidedown
            upsidedown = 0
    }
    if (movespeed < 20)
    {
        if (move == xscale)
        {
            if (character == "T")
                movespeed += 0.06
            else
                movespeed += 0.02
        }
    }
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
        scr_soundeffect(sfx_jump)
        if (sprite_index != spr_fightball)
        {
            image_index = 0
            sprite_index = spr_mach3jump
        }
        if upsidedown
        {
            upsidedown = 0
            vsp = 11
        }
        else
            vsp = -11
    }
    if (fightball == 0)
    {
        if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
            sprite_index = spr_mach4
        if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_player_dashpad || sprite_index == spr_mach3hit))
            sprite_index = spr_mach4
        if ((sprite_index == spr_mach2jump || sprite_index == spr_player_Sjumpcancel) && grounded && vsp > 0)
            sprite_index = spr_mach4
        if (movespeed > 16 && sprite_index != spr_crazyrun)
        {
            flash = 1
            sprite_index = spr_crazyrun
        }
        else if (movespeed <= 16 && sprite_index == spr_crazyrun)
            sprite_index = spr_mach4
    }
    if (sprite_index == spr_crazyrun && (!instance_exists(crazyruneffectid)))
    {
        with (instance_create(x, y, obj_crazyrunothereffect))
        {
            playerid = other.object_index
            other.crazyruneffectid = id
        }
    }
    if (sprite_index == spr_crazyrun)
    {
        if (flamecloud_buffer > 0)
            flamecloud_buffer--
        else
        {
            flamecloud_buffer = 10
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale
                sprite_index = spr_flamecloud
            }
        }
    }
    if (sprite_index == spr_mach4 || sprite_index == spr_mach3jump || sprite_index == spr_fightball || sprite_index == spr_player_dashpad)
        image_speed = 0.4
    if (sprite_index == spr_crazyrun)
        image_speed = 0.75
    if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4
    if key_jump
        input_buffer_jump = 0
    if (key_up && grounded && (!upsidedown) && (!(place_meeting(x, y, obj_dashpad))))
    {
        scr_soundeffect(sfx_superjumpprep)
        sprite_index = spr_superjumpprep
        state = 65
        hsp = 0
        image_index = 0
    }
    if (((!key_attack) && fightball == 0 && sprite_index != spr_player_dashpad && grounded && character != "S") || (character == "S" && (move == 0 || move != xscale) && grounded && fightball == 0))
    {
        if upsidedown
            upsidedown = 0
        sprite_index = spr_machslidestart
        scr_soundeffect(sfx_break)
        state = 71
        image_index = 0
    }
    if (move == (-xscale) && grounded && sprite_index != spr_player_dashpad && character != "S" && fightball == 0)
    {
        if upsidedown
            upsidedown = 0
        scr_soundeffect(sfx_machslideboost)
        sprite_index = spr_mach3boost
        state = 71
        image_index = 0
    }
    if (key_down && (!upsidedown) && fightball == 0 && (!(place_meeting(x, y, obj_dashpad))))
    {
        particle_set_scale(5, xscale, 1)
        create_particle(x, y, 5, 0)
        flash = 0
        state = (2 << 0)
        vsp = 10
        image_index = 0
        if (!grounded)
            sprite_index = spr_dive
        else
            sprite_index = spr_machroll
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
        image_index = 0
        if (shotgunAnim == 0)
            sprite_index = spr_suplexdash
        else
            sprite_index = spr_shotgunsuplexdash
        particle_set_scale(5, xscale, 1)
        create_particle(x, y, 5, 0)
    }
    if (key_slap2 && genomode && (!key_up))
        scr_genoshoot()
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
        trace("YOUBICH")
        hsp = 0
        var solidx = instance_place((x - hsp), (y - 16), obj_solid)
        y -= 8
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
    if (place_meeting_collision((x + 1), y) && xscale == 1 && (!scr_slope()) && (!(place_meeting_slope((x + sign(hsp)), y))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (grounded || fightball == 1))
    {
        if (fightball == 0)
        {
            sprite_index = spr_hitwall
            scr_soundeffect(sfx_groundpound)
            scr_soundeffect(sfx_bumpwall)
            with (obj_camera)
            {
                shake_mag = 20
                shake_mag_acc = (40 / room_speed)
            }
            hsp = 0
            image_speed = 0.35
            with (obj_baddie)
            {
                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
                {
                    stun = 1
                    alarm[0] = 200
                    ministun = 0
                    vsp = -5
                    hsp = 0
                }
            }
            flash = 0
            state = 72
            hsp = -4.5
            vsp = -6
            mach2 = 0
            image_index = 0
            instance_create((x + 10), (y + 10), obj_bumpeffect)
        }
        else if (fightball == 1)
        {
            with (obj_player)
            {
                sprite_index = spr_hitwall
                scr_soundeffect(sfx_groundpound)
                scr_soundeffect(sfx_bumpwall)
                with (obj_camera)
                {
                    shake_mag = 20
                    shake_mag_acc = (40 / room_speed)
                }
                hsp = 0
                image_speed = 0.35
                with (obj_baddie)
                {
                    if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
                    {
                        stun = 1
                        alarm[0] = 200
                        ministun = 0
                        vsp = -5
                        hsp = 0
                    }
                }
                flash = 0
                state = 72
                hsp = -2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                instance_create((x + 10), (y + 10), obj_bumpeffect)
            }
            fightball = 0
        }
    }
    if (place_meeting_collision((x - 1), y) && xscale == -1 && (!scr_slope()) && (!(place_meeting_slope((x + sign(hsp)), y))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (grounded || fightball == 1))
    {
        if (fightball == 0)
        {
            sprite_index = spr_hitwall
            scr_soundeffect(sfx_groundpound)
            scr_soundeffect(sfx_bumpwall)
            with (obj_camera)
            {
                shake_mag = 20
                shake_mag_acc = (40 / room_speed)
            }
            hsp = 0
            image_speed = 0.35
            with (obj_baddie)
            {
                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
                {
                    stun = 1
                    alarm[0] = 200
                    ministun = 0
                    vsp = -5
                    hsp = 0
                }
            }
            flash = 0
            state = 72
            hsp = 4.5
            vsp = -6
            mach2 = 0
            image_index = 0
            instance_create((x - 10), (y + 10), obj_bumpeffect)
        }
        else if (fightball == 1)
        {
            with (obj_player)
            {
                sprite_index = spr_hitwall
                scr_soundeffect(sfx_groundpound)
                scr_soundeffect(sfx_bumpwall)
                with (obj_camera)
                {
                    shake_mag = 20
                    shake_mag_acc = (40 / room_speed)
                }
                hsp = 0
                image_speed = 0.35
                with (obj_baddie)
                {
                    if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
                    {
                        stun = 1
                        alarm[0] = 200
                        ministun = 0
                        vsp = -5
                        hsp = 0
                    }
                }
                flash = 0
                state = 72
                hsp = -2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                instance_create((x + 10), (y + 10), obj_bumpeffect)
            }
            fightball = 0
        }
    }
    if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                instance_create(obj_player.x, obj_player.y, obj_slapstar)
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    scr_dotaunt()
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
        }
    }
}

