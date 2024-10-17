with (obj_player)
{
    if (targetDoor == "S" && secretportalID == other.id)
    {
        with (obj_tv)
            fadebg = 2
        x = other.x
        y = other.y
        roomstartx = x
        roomstarty = y
        other.sprite_index = spr_secretportal_close
        other.image_index = 0
        instance_destroy(other)
        instance_create(x, y, obj_secretportalstart)
    }
}
if (ds_list_find_index(global.saveroom, id) != -1)
{
    active = 0
    sprite_index = spr_secretportal_close
    image_index = 0
}
