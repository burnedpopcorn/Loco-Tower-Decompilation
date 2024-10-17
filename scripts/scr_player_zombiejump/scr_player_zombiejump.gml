function scr_player_zombiejump() //scr_player_zombiejump
{
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepep_jumpstart)
            sprite_index = spr_cheesepep_jump
        else if (sprite_index == spr_cheesepep_jump && vsp > 0)
            sprite_index = spr_cheesepep_fall
    }
    if key_slap2
    {
        vsp = -6
        sprite_index = choose(spr_player_kungfuair1, spr_player_kungfuair2, spr_player_kungfuair3)
        image_index = 0
        state = 117
        scr_soundeffect(sfx_suplexdash)
    }
    hsp = movespeed
    move = (key_left + key_right)
    if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
    {
        vsp /= 10
        jumpstop = 1
    }
    if key_jump
        input_buffer_jump = 0
    if (move != 0)
        movespeed = Approach(movespeed, (move * 6), 0.5)
    else
        movespeed = Approach(movespeed, 0, 0.25)
    if (grounded && vsp >= 0)
    {
        if (move != 0)
            xscale = move
        movespeed = abs(movespeed)
        state = 13
        sprite_index = spr_cheesepep_land
        image_index = 0
        jumpstop = 0
    }
    if (place_meeting(x, y, obj_water) || place_meeting(x, y, obj_waterunder) || place_meeting(x, y, obj_watercurrent))
    {
        instance_create(x, y, obj_genericpoofeffect)
        jumpstop = 0
        if (!grounded)
            state = 58
        else
            state = (0 << 0)
    }
}

