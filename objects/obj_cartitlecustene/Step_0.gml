if active
{
    hspeed = Approach(hspeed, 7, 0.1)
    if (x > 960 && (!instance_exists(obj_fadeout)))
    {
        if (intro == 1)
        {
            with (instance_create(x, y, obj_fadeout))
            {
                obj_player.targetRoom = 17
                obj_player.state = 8
            }
        }
        else
        {
            with (instance_create(x, y, obj_fadeout))
            {
                obj_player.targetRoom = 3
                obj_player.state = 8
            }
        }
    }
}
if (sprite_index == spr_pepcooter && (!instance_exists(obj_superdashcloud)))
{
    with (instance_create((x - 100), y, obj_superdashcloud))
        image_xscale = 1
}
