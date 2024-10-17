if (rank != "c" && rank != "b" && rank != "a" && rank != "s" && rank != "p")
    instance_destroy()
if place_meeting(x, y, obj_player1)
{
    with (obj_player1)
    {
        if (state == 0 && grounded && key_up2)
        {
            state = 13
            sprite_index = spr_cheesepep_idle
        }
    }
}
