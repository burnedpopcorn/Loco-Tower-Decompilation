function scr_player_zombie() //scr_player_zombie
{
    key_particles = 0
    mach2 = 0
    alarm[5] = 2
    alarm[7] = 60
    move = (key_left + key_right)
    hsp = (xscale * movespeed)
    if key_jump
        input_buffer_jump = 0
    if (grounded && move != 0 && sprite_index == spr_cheesepep_idle)
        sprite_index = spr_cheesepep_walk
    else if (grounded && move == 0 && sprite_index == spr_cheesepep_walk)
        sprite_index = spr_cheesepep_idle
    if (move != 0 && sprite_index != spr_cheesepep_jumpstart)
    {
        if (xscale != move)
        {
            if (movespeed > 2)
                movespeed = (-movespeed)
            xscale = move
        }
        movespeed = Approach(movespeed, 6, 0.4)
    }
    else
        movespeed = Approach(movespeed, 0, 0.25)
    if (sprite_index == spr_cheesepep_walk)
        image_speed = (abs(movespeed) / 11)
    else
        image_speed = 0.35
    if (!grounded)
    {
        state = 112
        sprite_index = spr_cheesepep_fall
        jumpstop = 1
        movespeed = (xscale * movespeed)
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepep_land || sprite_index == spr_cheesepep_intro)
        {
            if (move != 0)
                sprite_index = spr_cheesepep_walk
            else
                sprite_index = spr_cheesepep_idle
        }
    }
    if (input_buffer_jump < 8 && grounded)
    {
        jumpstop = 0
        vsp = -10
        image_index = 0
        sprite_index = spr_cheesepep_jump
        state = 112
        movespeed *= xscale
        scr_soundeffect(sfx_jump)
    }
    if (sprite_index == spr_cheesepep_land)
    {
        if ((place_meeting(x, (y + 1), obj_platform) || place_meeting(x, (y + 1), obj_slopePlatform)) && (!(place_meeting_solid(x, (y + 1)))))
            y += 1
    }
    if (place_meeting(x, y, obj_water) || place_meeting(x, y, obj_waterunder) || place_meeting(x, y, obj_watercurrent))
    {
        instance_create(x, y, obj_genericpoofeffect)
        if (!grounded)
            state = 58
        else
            state = (0 << 0)
    }
    if grounded
    {
        if key_slap2
        {
            if (movespeed < 8)
                movespeed = 8
            sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
            image_index = 0
            state = 117
            scr_soundeffect(sfx_suplexdash)
        }
    }
}

