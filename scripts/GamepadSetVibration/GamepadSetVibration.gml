function GamepadSetVibration(argument0, argument1, argument2, argument3) //GamepadSetVibration
{
    with (obj_inputAssigner)
        argument0.argument0.setVibration(argument1, argument2, argument3, self)
    return;
}

