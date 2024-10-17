if (!instance_exists(obj_fadeout))
{
    with (obj_player)
    {
        state = 8
        targetRoom = 16
    }
    instance_create(0, 0, obj_fadeout)
}
