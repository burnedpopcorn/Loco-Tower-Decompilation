if (other.state != 116 && other.state != 111)
{
    with (other)
    {
        state = 116
        hsp = 0
        movespeed = 0
        with (instance_create(x, y, obj_bubbleplayer))
            playerid = other.id
    }
    instance_destroy()
}
