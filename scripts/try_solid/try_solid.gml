function try_solid(argument0, argument1, argument2, argument3) //try_solid
{
    var old_x = x
    var old_y = y
    var n = -1
    var i = 0
    while (i < argument3)
    {
        x += argument0
        y += argument1
        if (!(place_meeting_collision(x, y)))
        {
            n = (i + 1)
            break
        }
        else
        {
            i++
            continue
        }
    }
    x = old_x
    y = old_y
    return n;
}

