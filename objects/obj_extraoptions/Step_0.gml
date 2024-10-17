scr_getinput()
if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
{
    optionselected -= 1
    scr_soundeffect(sfx_step)
}
if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 4)
{
    optionselected += 1
    scr_soundeffect(sfx_step)
}
if (optionselected == 0 && (key_jump || keyboard_check_pressed(vk_escape)))
{
    with (obj_option)
    {
        visible = true
        key_jump = 0
        buffer = 15
    }
    instance_destroy()
}
if (optionselected == 1)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_smoothcamera == 0)
        optionsaved_smoothcamera = 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && optionsaved_smoothcamera == 1)
        optionsaved_smoothcamera = 0
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        global.smoothcam = optionsaved_smoothcamera
        ini_open("saveData.ini")
        global.smoothcam = optionsaved_smoothcamera
        ini_write_real("Option", "smoothcamera", optionsaved_smoothcamera)
        ini_close()
    }
}
if (optionselected == 2)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_anglerotation == 0)
        optionsaved_anglerotation = 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && optionsaved_anglerotation == 1)
        optionsaved_anglerotation = 0
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        global.anglerotation = optionsaved_anglerotation
        ini_open("saveData.ini")
        global.anglerotation = optionsaved_anglerotation
        ini_write_real("Option", "anglerotation", optionsaved_anglerotation)
        ini_close()
    }
}
if (optionselected == 3)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_danikyo == 0)
        optionsaved_danikyo = 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && optionsaved_danikyo == 1)
        optionsaved_danikyo = 0
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        global.danikyo = optionsaved_danikyo
        ini_open("saveData.ini")
        global.danikyo = optionsaved_danikyo
        ini_write_real("Option", "danikyo", optionsaved_danikyo)
        ini_close()
    }
}
if (optionselected == 4)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_unfocus == 0)
        optionsaved_unfocus = 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && optionsaved_unfocus == 1)
        optionsaved_unfocus = 0
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        global.unfocus = optionsaved_unfocus
        ini_open("saveData.ini")
        global.unfocus = optionsaved_unfocus
        ini_write_real("Option", "unfocus", optionsaved_unfocus)
        ini_close()
    }
}
