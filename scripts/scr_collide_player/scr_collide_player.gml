var _temp_local_var_3;
function scr_collide_player() //scr_collide_player
{
    grounded = 0
    grinding = 0
    var vy = vsp
    var _temp_local_var_3 = abs(vy)
    if (abs(vy) <= 0)
    {
    }
    else
    {
        while (true)
        {
            if (!(scr_solid_player(x, (y + sign(vsp)))))
            {
                y += sign(vsp)
                vy -= 1
                if vy
                {
                }
                var _temp_local_var_3 = (abs(vy) - 1)
                if (abs(vy) - 1)
                    continue
                break
            }
            else
                vsp = 0
        }
    }
    var vx = abs(hsp)
    var _temp_local_var_3 = abs(vx)
    if (abs(vx) <= 0)
    {
    }
    else
    {
        while (true)
        {
            if (scr_solid_player((x + sign(hsp)), y) && (!(scr_solid_player((x + sign(hsp)), (y - 1)))))
                y--
            if ((!(scr_solid_player((x + sign(hsp)), y))) && (!(scr_solid_player((x + sign(hsp)), (y + 1)))) && scr_solid_player((x + sign(hsp)), (y + 2)))
                y++
            if (!(scr_solid_player((x + sign(hsp)), y)))
            {
                x += sign(hsp)
                vx -= 1
                if vx
                {
                }
                var _temp_local_var_3 = (abs(vx) - 1)
                if (abs(vx) - 1)
                    continue
                break
            }
            else
                hsp = 0
        }
    }
    if (vsp < 20)
        vsp += grav
    grounded |= scr_solid(x, (y + 1))
    grounded |= ((!(place_meeting(x, y, obj_platform))) && place_meeting(x, (y + 1), obj_platform))
    grinding = ((!(place_meeting(x, y, obj_grindrail))) && place_meeting(x, (y + 1), obj_grindrail))
    grounded |= grinding
}

