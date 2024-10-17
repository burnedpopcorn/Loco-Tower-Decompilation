if active
{
    with (obj_player)
    {
        state = 19
        hsp = 0
        vsp = 0
        visible = false
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_pizzaportal_appear:
            sprite_index = spr_pizzaportalentrancestart
            break
        case 1354:
            sprite_index = spr_pizzaportal_disappear
            with (obj_player)
            {
                state = 0
                visible = true
            }
            active = 0
            break
        case 965:
            instance_destroy()
            break
    }

}
