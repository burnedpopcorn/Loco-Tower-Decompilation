function scr_specialplayer_slide() //scr_specialplayer_slide
{
    hsp = (xscale * movespeed)
    movespeed = Approach(movespeed, 0, 0.4)
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_machslideboost || sprite_index == spr_mach3boost))
        image_speed = 0
    else
        image_speed = 0.35
    if (movespeed == 0 && floor(image_index) == (image_number - 1) && grounded)
    {
        state = 0
        movespeed = 2
        xscale *= -1
    }
}

