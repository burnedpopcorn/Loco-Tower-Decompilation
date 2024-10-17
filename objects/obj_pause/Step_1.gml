if (master_gain != window_has_focus() && global.unfocus)
{
    master_gain = Approach(master_gain, window_has_focus(), 0.05)
    set_master_gain((master_gain * global.option_master_volume))
}
