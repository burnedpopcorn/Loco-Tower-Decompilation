if (!active)
{
    scr_soundeffect(sfx_collecttoppin)
    active = 1
    with (obj_player)
    {
        roomstartx = (other.x + 6)
        roomstarty = (other.y - 46)
    }
}
