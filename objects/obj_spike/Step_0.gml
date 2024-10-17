with (obj_player)
{
    if (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other) || place_meeting(x, (y + 1), other) || place_meeting(x, (y - 1), other))
    {
        with (other)
        {
            scr_hurtplayer(other)
            if fake
                instance_destroy()
        }
    }
}
