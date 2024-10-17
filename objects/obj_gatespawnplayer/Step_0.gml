if (playerID != noone)
{
    if (state != 2)
    {
        playerID.x = x
        playerID.y = y
    }
    switch state
    {
        case 0:
            visible = true
            image_index = 0
            image_speed = 0.25
            state = 1
            break
        case 1:
            if (floor(image_index) > 5)
            {
                scr_soundeffect(sfx_escapespawn)
                with (playerID)
                {
                    sprite_index = spr_player_slipbanan1
                    vsp = -16
                    visible = true
                    image_index = 0
                    state = 119
                }
                state = 2
            }
            break
        case 2:
            if (floor(image_index) == (image_number - 1))
                instance_destroy()
            break
    }

}
