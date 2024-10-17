function scr_player_addslopemomentum(argument0, argument1, argument2) //scr_player_addslopemomentum
{
    if (other.movespeed >= argument2)
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            if (sign(image_xscale) == (-sign(other.xscale)))
            {
                if (abs(image_yscale) < abs(image_xscale))
                    other.movespeed += argument0
                else
                    other.movespeed += argument1
            }
        }
    }
    return;
}

