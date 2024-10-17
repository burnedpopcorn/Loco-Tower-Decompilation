switch sprite_index
{
    case spr_secretportal_spawnopen:
        image_speed = 0.35
        with (obj_player1)
        {
            x = other.x
            y = other.y
            roomstartx = x
            roomstarty = y
            hsp = 0
            vsp = 0
            cutscene = 1
            visible = false
            if (state != 24 && state != 18)
                state = (0 << 0)
        }
        waitbuffer = 80
        drop = 0
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_secretportal_spawnidle
            with (obj_player)
            {
                if (state != 24 && state != 18)
                {
                    visible = true
                    cutscene = 0
                    sprite_index = spr_bodyslamstart
                    image_index = 0
                    state = 92
                    vsp = (character == "P" ? -5 : -7)
                }
            }
        }
        break
    case 1868:
        if (!drop)
        {
            with (obj_player1)
            {
                x = other.x
                y = (other.y - 10)
                visible = true
                hsp = 0
                vsp = 10
                scale_xs = Approach(scale_xs, 1, 0.05)
                scale_ys = Approach(scale_ys, 1, 0.05)
                fallinganimation = 0
                if (scale_xs == 1)
                    other.drop = 1
            }
        }
        if drop
            instance_destroy()
        break
    case 206:
        image_speed = 0.35
        if (floor(image_index) == (image_number - 1))
        {
            image_index = (image_number - 1)
            instance_destroy()
        }
        break
}

