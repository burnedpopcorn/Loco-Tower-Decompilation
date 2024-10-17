if (!((rank == "d" || rank == "c" || rank == "b" || rank == "a" || rank == "s" || rank == "p")))
{
    if place_meeting(x, (y - 1), obj_player1)
    {
        with (obj_player1)
        {
            scr_soundeffect(sfx_bananaslip)
            sprite_index = spr_player_slipbanan1
            vsp = -6
            movespeed = 13
            xscale = 1
            hsp = (movespeed * xscale)
            image_index = 0
            state = 119
        }
        scr_soundeffect(choose(97, 98))
        instance_destroy(self)
    }
}
else if place_meeting(x, (y - 1), obj_player1)
{
    with (obj_player1)
    {
        if (state == 74)
        {
            with (other)
            {
                scr_soundeffect(choose(97, 98))
                instance_destroy()
            }
        }
    }
}
