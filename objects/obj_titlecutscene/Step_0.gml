if (drop == 1)
    scr_collide()
x += 10
if (x > 960 && (!instance_exists(obj_fadeout)))
{
    with (instance_create(x, y, obj_fadeout))
        obj_player.targetRoom = 17
}
if (sprite_index == spr_pepcooter && (!instance_exists(obj_superdashcloud)))
    instance_create((x - 100), y, obj_superdashcloud)
