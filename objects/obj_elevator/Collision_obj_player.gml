if (state != 1 && other.grounded && other.key_up2)
{
    playerid = other.id
    with (other)
    {
        sprite_index = spr_lookdoor
        image_index = 0
        state = 78
        mach2 = 0
        hsp = 0
        other.image_speed = 0.35
    }
    state = 1
}
