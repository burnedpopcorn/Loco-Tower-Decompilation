function scr_player_freefall() //scr_player_freefall
{
    landAnim = 1
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
        sprite_index = spr_bodyslamfall
    move = (key_left + key_right)
    if (key_slap2 && vsp > 0 && (!grounded) && sprite_index != spr_player_rockethitwall && sprite_index != spr_player_Sjumpcancelstart)
    {
        if (move != 0)
            xscale = move
        audio_sound_pitch(scr_soundeffect(sfx_superjumpcancel), 1.5)
        image_index = 0
        sprite_index = spr_player_Sjumpcancelstart
    }
    if (sprite_index == spr_player_Sjumpcancelstart)
    {
        freefallsmash = -14
        vsp = 0
        hsp = 0
        if (move != 0)
            xscale = move
        if (floor(image_index) == (image_number - 1))
        {
            vsp = -5
            state = 70
            movespeed = 10
            flash = 1
            image_index = 0
            sprite_index = spr_mach2jump
            jumpstop = 1
        }
        image_speed = 0.5
    }
    else if (sprite_index != spr_player_Sjumpcancelstart)
    {
        if (vsp >= 2)
        {
            if (steppybuffer > 0)
                steppybuffer--
            else
            {
                create_particle((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), 1, 0)
                steppybuffer = 8
            }
            vsp += 0.5
        }
        if (!grounded)
        {
            if (sprite_index != spr_player_rockethitwall && sprite_index != spr_player_Sjumpcancelstart)
                hsp = (move * movespeed)
            else
                hsp = 0
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
            if (move != 0)
                xscale = move
        }
        if (vsp > 0)
            freefallsmash++
        else if (vsp < 0)
            freefallsmash = -14
        if (freefallsmash >= 10 && (!instance_exists(superslameffectid)))
        {
            with (instance_create(x, y, obj_superslameffect))
            {
                playerid = other.object_index
                other.superslameffectid = id
            }
        }
        if (freefallsmash >= 10 && (!instance_exists(crazyruneffectid)))
        {
            with (instance_create(x, (y - 4), obj_crazyrunothereffect))
            {
                playerid = other.object_index
                image_angle = -90
                other.crazyruneffectid = id
            }
        }
        if (grounded && (freefallsmash < 10 || (!(place_meeting(x, (y + vsp), obj_metalblock)))) && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, ((y + vsp) + 6), obj_destructibles))))
        {
            if scr_slope()
            {
                var s = instance_place(x, (y + 1), obj_slope)
                var s2 = instance_place(x, (y + 1), obj_slopePlatform)
                if (s2 != -4)
                    s = s2
                with (s)
                {
                    other.xscale = (-sign(image_xscale))
                    other.state = 2
                    other.sprite_index = other.spr_crouchslip
                    if (other.freefallsmash > 30)
                        other.movespeed = (other.storedvsp * 0.6)
                    else
                        other.movespeed = (other.storedvsp * 0.45)
                    particle_set_scale(5, (-image_xscale), 1)
                    create_particle(other.x, other.y, 5, 0)
                }
            }
            else
            {
                scr_soundeffect(sfx_groundpound)
                freefallsmash = 0
                if (sprite_index == spr_player_poundcancel1)
                    sprite_index = spr_player_poundcancel2
                else if (shotgunAnim == 0)
                    sprite_index = spr_bodyslamland
                else
                    sprite_index = spr_shotgunjump2
                image_index = 0
                state = 77
                jumpAnim = 1
                jumpstop = 0
                with (obj_baddie)
                {
                    if (grounded && point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0))))
                    {
                        vsp = -11
                        hsp = 0
                    }
                }
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = (30 / room_speed)
                }
                create_particle(x, (y + 3), 14, 0)
                combo = 0
                bounce = 0
                freefallstart = 0
            }
        }
        image_speed = 0.35
        if (sprite_index == spr_bodyslamstart)
            image_speed = 0.4
    }
}

