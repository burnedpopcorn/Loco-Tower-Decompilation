function create_blue_afterimage(argument0, argument1, argument2, argument3, argument4) //create_blue_afterimage
{
    with (self.create_afterimage(argument0, argument1, argument2, argument3))
    {
        alarm[0] = -1
        alarm[1] = -1
        alarm[2] = -1
        image_xscale = argument4
        image_blend = make_color_rgb(44, 126, 228)
        alpha = 1.25
    }
    return;
}

