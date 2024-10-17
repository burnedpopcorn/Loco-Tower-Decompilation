function scr_player_jump() //scr_player_jump
{
    if (momemtum == 0)
        hsp = (move * movespeed)
    else
        hsp = (xscale * movespeed)
    hsp += (railmovespeed * raildir)
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    if key_taunt2
    {
        input_finisher_buffer = 60
        input_attack_buffer = 0
        input_up_buffer = 0
        input_down_buffer = 0
    }
    if (move != xscale)
        movespeed = 2
    move = (key_left + key_right)
    if (movespeed == 0)
        momemtum = 0
    if scr_solid((x + hsp), y)
    {
        movespeed = 0
        mach2 = 0
    }
    if (move != 0)
    {
        xscale = move
        if (movespeed < 8)
            movespeed += 0.5
        else if (floor(movespeed) == 8)
            movespeed = 6
        if (scr_solid((x + xscale), y) && move == xscale)
            movespeed = 0
    }
    else
        movespeed = 0
    if (movespeed > 8)
        movespeed -= 0.1
    if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
        movespeed = 0
    if (dir != xscale)
        dir = xscale
    landAnim = 1
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (ladderbuffer > 0)
        ladderbuffer--
    if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp = grav
        jumpstop = 1
    }
    if (can_jump && input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0 && (!((sprite_index == spr_facestomp || sprite_index == spr_freefall))))
    {
        scr_soundeffect(sfx_jump)
        sprite_index = spr_jump
        if (shotgunAnim == 1)
            sprite_index = spr_shotgunjump
        instance_create(x, y, obj_highjumpcloud2)
        stompAnim = 0
        vsp = -11
        state = 58
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        freefallstart = 0
    }
    if ((!grounded) && input_buffer_jump < 8 && character == "T" && (!Doublejump) && vsp > 0)
    {
        scr_soundeffect(sfx_jump)
        sprite_index = spr_jump2
        if (shotgunAnim == 1)
            sprite_index = spr_shotgunjump
        instance_create(x, y, obj_jumpdust)
        stompAnim = 0
        vsp = -9
        state = 58
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        freefallstart = 0
        Doublejump = 1
    }
    if (grounded && vsp > 0 && (!key_attack))
    {
        scr_soundeffect(sfx_step)
        if key_attack
            landAnim = 0
        input_buffer_secondjump = 0
        state = (0 << 0)
        instance_create(x, y, obj_landcloud)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        freefallstart = 0
        movespeed = 2
    }
    if (key_slap2 && key_up)
    {
        state = 47
        image_index = 0
        sprite_index = spr_player_breakdanceuppercut
        scr_soundeffect(sfx_uppercut)
        vsp = -10
        movespeed = hsp
    }
    if key_jump
        input_buffer_jump = 0
    if (vsp > 5)
        fallinganimation++
    if (fallinganimation >= 40)
        sprite_index = spr_facestomp
    if (stompAnim == 0)
    {
        if (jumpAnim == 1)
        {
            if (floor(image_index) == (image_number - 1))
                jumpAnim = 0
        }
        if (jumpAnim == 0)
        {
            switch sprite_index
            {
                case spr_airdash1:
                    sprite_index = spr_airdash2
                    break
                case spr_shotgunjump:
                    sprite_index = spr_shotgunfall
                    break
                case spr_jump:
                    sprite_index = spr_fall
                    break
                case 613:
                    sprite_index = spr_player_Sjump
                    break
                case 411:
                    sprite_index = spr_player_shotgunjump2
                    break
                case 403:
                    sprite_index = spr_shotgun_fall
                    break
                case 1859:
                    sprite_index = spr_fall
                    break
                case 1781:
                    sprite_index = spr_fall
                    break
                case 198:
                    sprite_index = spr_fall
                    break
                case spr_jump2:
                    sprite_index = spr_player_jump2fall
                    break
            }

        }
    }
    if (stompAnim == 1)
    {
        if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
            sprite_index = spr_stomp
    }
    if key_down
    {
        if (shotgunAnim == 0)
        {
            image_index = 0
            state = 74
            sprite_index = spr_bodyslamstart
            scr_soundeffect(sfx_groundpoundstart)
            vsp = -6
        }
        else
        {
            scr_soundeffect(sfx_killingblow)
            image_index = 0
            state = 92
            sprite_index = spr_shotgunjump1
            vsp = -5
            if (character == "P")
            {
                with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
                {
                    sprite_index = sprite10391
                    spdh = -10
                    spd = 0
                }
                with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
                {
                    sprite_index = sprite10391
                    spdh = -10
                    spd = 5
                }
                with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
                {
                    sprite_index = sprite10391
                    spdh = -10
                    spd = -5
                }
            }
        }
    }
    if (move != 0)
        xscale = move
    if (sprite_index == spr_player_suplexcancel)
        image_speed = 0.4
    else
        image_speed = 0.35
    if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
    {
        with (obj_baddie)
        {
            if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
            {
                vsp = -7
                hsp = 0
            }
        }
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        scr_soundeffect(sfx_groundpound)
        image_index = 0
        sprite_index = spr_bodyslamland
        state = 77
    }
    if (key_slap2 && sprite_index != spr_player_suplexbump && (!key_up) && (!genomode))
    {
        image_index = 0
        sprite_index = spr_suplexdashjumpstart
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        sfx_gain(suplexdashsnd)
        state = 22
        movespeed = 5
    }
    if (key_slap2 && genomode && (!key_up))
        scr_genoshoot()
    if (key_slap2 && shotgunAnim == 1 && key_up)
    {
        scr_soundeffect(sfx_killingblow)
        state = 38
        with (instance_create(x, y, obj_pistoleffect))
            image_xscale = other.image_xscale
        image_index = 0
        sprite_index = spr_shotgunshoot
        if (character == "P")
        {
            instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet)
            with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
                spdh = 4
            with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
                spdh = -4
        }
    }
    if ((!key_attack) || move != xscale)
        mach2 = 0
    if (key_attack && grounded && fallinganimation < 40)
    {
        movespeed = 6
        sprite_index = spr_mach1
        jumpAnim = 1
        state = 70
        image_index = 0
    }
    scr_dotaunt()
}

