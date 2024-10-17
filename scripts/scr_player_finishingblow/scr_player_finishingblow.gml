function scr_player_finishingblow() //scr_player_finishingblow
{
    hsp = movespeed
    move = (key_right + key_left)
    if (floor(image_index) < 4 && sprite_index != spr_swingdingend)
        movespeed = Approach(movespeed, 0, 1)
    else
        movespeed = Approach(movespeed, ((-xscale) * 4), 0.5)
    if (floor(image_index) == (image_number - 1))
    {
        movespeed = 0
        state = (0 << 0)
    }
    if (floor(image_index) == 0 && (!instance_exists(obj_swordhitbox)))
    {
        scr_soundeffect(sfx_punch)
        scr_soundeffect(sfx_killingblow)
        with (instance_create(x, y, obj_swordhitbox))
            playerid = other.object_index
    }
    image_speed = 0.4
    landAnim = 0
    if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 3)
    {
        with (instance_create(x, y, obj_dashcloud2))
            image_xscale = other.xscale
    }
    image_speed = 0.35
    landAnim = 0
}

