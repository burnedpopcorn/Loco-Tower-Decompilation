function scr_player_zombieattack() //scr_player_zombieattack
{
    image_speed = 0.35
    move = (key_left + key_right)
    if grounded
        hsp = (movespeed * xscale)
    else
        hsp = movespeed
    if (!grounded)
    {
        if (move != 0)
            movespeed = Approach(movespeed, (move * 6), 0.5)
        else
            movespeed = Approach(movespeed, 0, 0.25)
    }
    else
        movespeed = Approach(movespeed, 0, 0.25)
    if ((sprite_index == spr_player_kungfuair1 || sprite_index == spr_player_kungfuair2 || sprite_index == spr_player_kungfuair3 || ((sprite_index == spr_player_kungfu1 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3) && (!grounded))) && floor(image_index) == (image_number - 1))
        image_speed = 0
    if ((sprite_index == spr_player_kungfu1 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3) && floor(image_index) == (image_number - 1))
    {
        state = 13
        sprite_index = spr_cheesepep_idle
    }
    if ((sprite_index == spr_player_kungfuair1 || sprite_index == spr_player_kungfuair2 || sprite_index == spr_player_kungfuair3) && grounded && vsp >= 0)
    {
        if (move != 0)
            xscale = move
        movespeed = abs(movespeed)
        state = 13
        image_index = 0
        sprite_index = spr_cheesepep_land
    }
}

