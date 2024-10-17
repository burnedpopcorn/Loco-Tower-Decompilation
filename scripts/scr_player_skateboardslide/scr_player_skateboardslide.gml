function scr_player_skateboardslide() //scr_player_skateboardslide
{
    image_speed = 0.35
    hsp = (xscale * movespeed)
    movespeed = Approach(movespeed, 0, 0.4)
    if (floor(image_index) == (image_number - 1))
    {
        image_speed = 0
        if grounded
        {
            state = 44
            xscale = (-xscale)
            movespeed = 4
        }
    }
}

