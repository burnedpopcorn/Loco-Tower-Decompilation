if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_tvtransition:
            if (bg2 == 252)
            {
                if (!audio_is_playing(sfx_bear5))
                    scr_soundeffect(sfx_bear5)
            }
            with (playerid)
            {
                x = roomstartx
                y = roomstarty
            }
            use_static = 0
            alarm[0] = 75
            image_index = 0
            image_speed = 0
            break
        case 1786:
            instance_destroy()
            break
    }

}
