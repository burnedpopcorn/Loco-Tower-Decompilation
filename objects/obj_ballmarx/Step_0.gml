scr_collision()
if (place_meeting_collision(x, (y + vsp)) && (!(place_meeting_slope(x, (y + vsp)))) && (!rolling))
{
    if (!doublejump)
    {
        vsp = -12
        doublejump = 1
        scr_soundeffect(sfx_groundpound)
    }
    else
    {
        scr_soundeffect(sfx_groundpound)
        instance_destroy()
    }
}
if place_meeting_slope(x, (y + vsp))
{
    with (instance_place(x, (y + 1), obj_slope))
        other.image_xscale = (-sign(image_xscale))
    rolling = 1
}
if (rolling == 1)
{
    hsp = (image_xscale * movespeed)
    if (place_meeting_solid((x + sign(hsp)), y) && ((!scr_slope()) || place_meeting_collision((x + sign(hsp)), (y - 2))) && (!(place_meeting_slope((x + sign(hsp)), y))))
    {
        instance_destroy()
        scr_soundeffect(sfx_groundpound)
    }
    if place_meeting_slope(x, (y + 1))
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            if (other.image_xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 14)
                    other.movespeed += 0.25
            }
        }
    }
}
if doublejump
    angle += 25
