if instance_exists(obj_marx)
{
    x = obj_marx.x
    y = obj_marx.y
}
image_xscale = -20
if ((!parried) && (!endbuffering))
{
    if (place_meeting(x, y, obj_player1) && obj_player.state != 51 && obj_player.state != 113 && obj_player.state != 78 && obj_player.state != 61)
    {
        with (obj_player1)
        {
            if (state != 36)
            {
                other.alarm[0] = 1
                visible = false
                state = 36
            }
        }
    }
}
