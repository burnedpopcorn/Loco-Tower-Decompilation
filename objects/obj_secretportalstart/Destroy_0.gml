scr_soundeffect(sfx_pop)
instance_create(x, y, obj_genericpoofeffect)
repeat (2)
{
    with (create_debris(x, y, 623))
    {
        vsp = random_range(-2, -4)
        hsp = random_range(-4, 4)
    }
}
