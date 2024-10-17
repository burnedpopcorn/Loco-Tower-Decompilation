if (other.state != 60 && other.state != 111 && other.state != 116)
{
    other.state = 60
    other.sprite_index = other.spr_machfreefall
}
if (other.state != 111 && other.state != 116)
{
    if (targetAngle != -90 && targetAngle != 90)
    {
        if (other.cantvspmove == 1)
            other.cantvspmove = 0
        other.canthspmove = 1
        other.movespeed = Approach(other.movespeed, (15 * sign(image_xscale)), 0.5)
    }
    else
    {
        if (other.canthspmove == 1)
            other.canthspmove = 0
        other.cantvspmove = 1
        other.vsp = Approach(other.vsp, (12 * sign((-targetAngle))), 0.5)
    }
}
