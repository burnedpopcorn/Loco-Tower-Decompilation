function scr_player_pummel() //scr_player_pummel
{
    image_speed = 0.35
    if (movespeed > 0)
        movespeed -= 1
    if (movespeed <= 0)
        movespeed = 0
    hsp = (xscale * movespeed)
    if (sprite_index != spr_idle)
    {
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_idle
            image_index = 0
        }
    }
    return;
}

