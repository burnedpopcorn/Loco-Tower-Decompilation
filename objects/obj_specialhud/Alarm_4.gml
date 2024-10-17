if (!instance_exists(obj_fadeout))
{
    with (obj_player1)
    {
        visible = true
        targetRoom = roombefore
        targetDoor = "A"
        state = 0
    }
    instance_create(x, y, obj_fadeout)
}
