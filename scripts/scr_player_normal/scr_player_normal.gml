function scr_player_normal() //scr_player_normal
{
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
    mach2 = 0
    move = (key_left + key_right)
    if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
        hsp = (move * movespeed)
    else if place_meeting(x, (y + 1), obj_railh)
        hsp = ((move * movespeed) - 5)
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = ((move * movespeed) + 5)
    var breakdance_max = 10
    if (key_taunt && (!shotgunAnim))
        breakdance_pressed++
    else
        breakdance_pressed = 0
    if (breakdance_pressed == breakdance_max && (!shotgunAnim))
        flash = 1
    if (breakdance_pressed >= breakdance_max && (!shotgunAnim))
        breakdance_speed = Approach(breakdance_speed, 0.6, 0.005)
    else
        breakdance_speed = 0.25
    if (breakdance_speed >= 0.5)
    {
        if (!instance_exists(obj_beatbox))
        {
            instance_create(x, y, obj_genericpoofeffect)
            with (instance_create(x, y, obj_beatbox))
                vsp = -11
        }
        notecreate--
    }
    if (notecreate <= 0 && (!shotgunAnim))
    {
        instance_create((x + random_range(-70, 70)), (y + random_range(-70, 70)), obj_notes)
        notecreate = 10
    }
    if (character == "P" || character == "N" || character == "T")
    {
        if (machslideAnim == 0 && landAnim == 0 && shotgunAnim == 0)
        {
            if (move == 0)
            {
                if (idle < 400)
                    idle++
                if (idle >= 150 && floor(image_index) == (image_number - 1))
                {
                    facehurt = 0
                    idle = 0
                    image_index = 0
                }
                if (idle >= 150 && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
                {
                    if (sprite_index != spr_panic && sprite_index != spr_player_breakdance && sprite_index != spr_fireassend)
                    {
                        randomise()
                        idleanim = random_range(0, 100)
                        if (irandom(100) <= 50)
                            scr_soundeffect(choose(22, 19))
                        if (idleanim <= 16)
                            sprite_index = spr_idle1
                        if (idleanim > 16 && idleanim < 32)
                            sprite_index = spr_idle2
                        if (idleanim > 32 && idleanim < 48)
                            sprite_index = spr_idle3
                        if (idleanim > 48 && idleanim < 64)
                            sprite_index = spr_idle4
                        if (idleanim > 64 && idleanim < 80)
                            sprite_index = spr_idle5
                        if (idleanim > 80)
                            sprite_index = spr_idle6
                        image_index = 0
                    }
                    else
                    {
                        facehurt = 0
                        idle = 0
                    }
                }
                if (idle < 150)
                {
                    if (facehurt == 0)
                    {
                        if (sprite_index == spr_player_breakdance)
                            image_speed = breakdance_speed
                        else
                            image_speed = 0.35
                        if (windingAnim < 1800 || angry == 1 || global.playerhealth == 1)
                        {
                            start_running = 1
                            movespeed = 0
                            if (sprite_index != spr_fireassend)
                            {
                                if (breakdance_pressed >= breakdance_max)
                                    sprite_index = spr_player_breakdance
                                else if (global.minutes == 0 && global.seconds == 0)
                                    sprite_index = spr_hurtidle
                                else if (global.panic == 1 || global.snickchallenge == 1)
                                    sprite_index = spr_panic
                                else if (angry == 1)
                                    sprite_index = spr_3hpidle
                                else if (global.stylethreshold == 2)
                                    sprite_index = spr_3hpidle
                                else if (global.stylethreshold >= 3)
                                    sprite_index = spr_player_rageidle
                                else
                                    sprite_index = spr_idle
                            }
                            if (sprite_index == spr_fireassend && floor(image_index) == (image_number - 1))
                            {
                                if (global.minutes == 0 && global.seconds == 0)
                                    sprite_index = spr_hurtidle
                                else if (global.panic == 1 || global.snickchallenge == 1)
                                    sprite_index = spr_panic
                                else if (angry == 1)
                                    sprite_index = spr_3hpidle
                                else if (global.stylethreshold == 2)
                                    sprite_index = spr_3hpidle
                                else if (global.stylethreshold >= 3)
                                    sprite_index = spr_player_rageidle
                                else
                                    sprite_index = spr_idle
                            }
                        }
                        else if (character == "P" || character == "N" || character == "T")
                        {
                            idle = 0
                            windingAnim--
                            sprite_index = spr_winding
                        }
                    }
                    else if (facehurt == 1 && (character == "P" || character == "N" || character == "T"))
                    {
                        windingAnim = 0
                        if (sprite_index != spr_facehurtup && sprite_index != spr_facehurt)
                            sprite_index = spr_facehurtup
                        if (floor(image_index) == (image_number - 1) && sprite_index == spr_facehurtup)
                            sprite_index = spr_facehurt
                    }
                }
            }
            if (move != 0)
            {
                machslideAnim = 0
                idle = 0
                facehurt = 0
                if (breakdance_pressed >= breakdance_max)
                    sprite_index = spr_player_breakdance
                else if (global.minutes == 0 && global.seconds == 0)
                    sprite_index = spr_hurtwalk
                else if (angry == 1)
                    sprite_index = spr_3hpwalk
                else if (global.stylethreshold == 2)
                    sprite_index = spr_3hpwalk
                else if (global.stylethreshold >= 3)
                    sprite_index = spr_player_ragemove
                else
                    sprite_index = spr_move
                if (move != 0 && grounded && vsp > 0 && sprite_index != spr_player_breakdance)
                {
                    if (steppybuffer > 0)
                        steppybuffer--
                    else
                    {
                        create_particle(x, (y + 43), 1, 0)
                        steppybuffer = 12
                        audio_sound_pitch(scr_soundeffect(sfx_step), random_range(0.9, 1.1))
                    }
                }
            }
            if (move != 0)
                xscale = move
        }
    }
    if (character == "S")
    {
        if (machslideAnim == 0)
        {
            if (move == 0)
            {
                if (idle < 400)
                    idle++
                if (idle >= 100 && floor(image_index) == (image_number - 1))
                {
                    idle = 0
                    image_index = 0
                }
                if (idle >= 100 && sprite_index != spr_idle1)
                    sprite_index = spr_idle1
                if (idle < 100)
                    sprite_index = spr_idle
            }
            if (move != 0)
            {
                machslideAnim = 0
                sprite_index = spr_move
                xscale = move
            }
        }
    }
    if (landAnim == 1)
    {
        if (shotgunAnim == 0)
        {
            if (move == 0)
            {
                movespeed = 0
                sprite_index = spr_land
                if (floor(image_index) == (image_number - 1))
                    landAnim = 0
            }
            if (move != 0)
            {
                sprite_index = spr_land2
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = 0
                    sprite_index = spr_move
                    image_index = 0
                }
            }
        }
        if (shotgunAnim == 1)
        {
            sprite_index = spr_shotgunland
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = spr_move
                image_index = 0
            }
        }
    }
    if (machslideAnim == 1)
    {
        sprite_index = spr_machslideend
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideend)
            machslideAnim = 0
    }
    if (sprite_index == spr_shotgunshoot && floor(image_index) == (image_number - 1))
        sprite_index = spr_shotgunidle
    if (landAnim == 0)
    {
        if (shotgunAnim == 1 && move == 0 && sprite_index != spr_shotgunshoot)
            sprite_index = spr_shotgunidle
        else if (shotgunAnim == 1 && sprite_index != spr_shotgunshoot)
            sprite_index = spr_shotgunwalk
    }
    if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))))
        movespeed = 0
    if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))))
        movespeed = 0
    jumpstop = 0
    if ((!grounded) && (!key_jump))
    {
        breakdance_pressed = 0
        if (shotgunAnim == 0)
            sprite_index = spr_fall
        else
            sprite_index = spr_shotgunfall
        jumpAnim = 0
        state = 58
        image_index = 0
    }
    if (key_jump && grounded && (!key_down))
    {
        breakdance_pressed = 0
        scr_soundeffect(sfx_jump)
        sprite_index = spr_jump
        if (shotgunAnim == 1)
            sprite_index = spr_shotgunjump
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        vsp = -11
        state = 58
        image_index = 0
        jumpAnim = 1
    }
    if (grounded && input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0)
    {
        breakdance_pressed = 0
        scr_soundeffect(sfx_jump)
        sprite_index = spr_jump
        if (shotgunAnim == 1)
            sprite_index = spr_shotgunjump
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        stompAnim = 0
        vsp = -11
        state = 58
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        freefallstart = 0
    }
    if (((key_down && grounded) || (scr_solid(x, (y - 3)) && grounded)) && character != "S")
    {
        breakdance_pressed = 0
        state = 66
        landAnim = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
    }
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (floor(movespeed) == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (movespeed > 6)
        movespeed -= 0.1
    momemtum = 0
    if (move != 0)
    {
        xscale = move
        if (movespeed < 3 && move != 0)
            image_speed = 0.35
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    if (key_slap2 && (!((shotgunAnim == 1 && key_up))) && (!genomode))
    {
        breakdance_pressed = 0
        suplexmove = 1
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
        sfx_gain(suplexdashsnd)
        state = 22
        image_index = 0
        if (shotgunAnim == 0)
            sprite_index = spr_suplexdash
        else
            sprite_index = spr_shotgunsuplexdash
        movespeed = 8
        particle_set_scale(5, xscale, 1)
        create_particle(x, y, 5, 0)
    }
    if (key_slap2 && key_up)
    {
        breakdance_pressed = 0
        state = 47
        image_index = 0
        sprite_index = spr_player_breakdanceuppercut
        scr_soundeffect(sfx_uppercut)
        vsp = -14
        movespeed = hsp
    }
    if (key_slap2 && shotgunAnim == 1 && key_up && (!genomode))
    {
        breakdance_pressed = 0
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
    if (key_slap2 && genomode && (!key_up))
        scr_genoshoot()
    if (key_attack && (!(place_meeting_solid((x + xscale), y))))
    {
        breakdance_pressed = 0
        movespeed = 6
        sprite_index = spr_mach1
        jumpAnim = 1
        state = 70
        image_index = 0
    }
    if (character == "S" && move != 0 && (!(place_meeting((x + xscale), y, obj_solid))))
    {
        movespeed = 6
        sprite_index = spr_mach1
        jumpAnim = 1
        state = 69
        image_index = 0
    }
    if (key_attack && (!(place_meeting((x + xscale), y, obj_solid))) && character == "S" && grounded)
    {
        breakdance_pressed = 0
        state = 22
        movespeed = 0
    }
    if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
        steppy = 1
    if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
        steppy = 0
    scr_dotaunt()
}

