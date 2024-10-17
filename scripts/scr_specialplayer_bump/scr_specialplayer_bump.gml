function scr_specialplayer_bump() //scr_specialplayer_bump
{
    sprite_index = spr_player_wallsplat
    movespeed = 0
    hsp = 0
    vsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        xscale *= -1
        state = 0
    }
    image_speed = 0.35
}

