if ((!instance_exists(obj_keyconfig)) && (!instance_exists(obj_audioconfig)) && (!instance_exists(obj_extraoptions)))
    scr_getinput()
if ((!instance_exists(obj_keyconfig)) && (!instance_exists(obj_audioconfig)) && (!instance_exists(obj_extraoptions)))
{
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
    {
        optionselected -= 1
        scr_soundeffect(sfx_step)
    }
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 5)
    {
        optionselected += 1
        scr_soundeffect(sfx_step)
    }
    if (optionselected == 3)
        yoffest = lerp(yoffest, -94, 0.1)
    else if (optionselected == 4)
        yoffest = lerp(yoffest, -158, 0.1)
    else if (optionselected == 5)
        yoffest = lerp(yoffest, -222, 0.1)
    else
        yoffest = lerp(yoffest, 64, 0.1)
}
if (optionselected == 0)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_fullscreen == false)
        optionsaved_fullscreen = true
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && optionsaved_fullscreen == true)
        optionsaved_fullscreen = false
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        window_set_fullscreen((!optionsaved_fullscreen))
        ini_open("saveData.ini")
        global.option_fullscreen = optionsaved_fullscreen
        ini_write_real("Option", "fullscreen", optionsaved_fullscreen)
        ini_close()
    }
}
if (optionselected == 1)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_resolution < 2)
        optionsaved_resolution += 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && optionsaved_resolution > 0)
        optionsaved_resolution -= 1
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        ini_open("saveData.ini")
        ini_write_real("Option", "resolution", optionsaved_resolution)
        ini_close()
        global.option_resolution = optionsaved_resolution
        var _os_r = optionsaved_resolution
        var resolutionX = (_os_r == 0 ? 480 : (_os_r == 1 ? 960 : 1920))
        var resolutionY = (_os_r == 0 ? 270 : (_os_r == 1 ? 540 : 1080))
        window_set_size(resolutionX, resolutionY)
    }
}
if (optionselected == 2)
{
    if ((key_right2 || keyboard_check_pressed(vk_right)) && optionsaved_language == 0)
        optionsaved_language += 1
    if (((-key_left2) || keyboard_check_pressed(vk_left)) && optionsaved_language == 1)
        optionsaved_language -= 1
    if (key_jump || keyboard_check_pressed(vk_return))
    {
        switch optionsaved_language
        {
            case 0:
                var savedlang = "esp"
                break
            case 1:
                savedlang = "eng"
                break
            default:
                savedlang = "esp"
                break
        }

        ini_open("saveData.ini")
        ini_write_string("Option", "language", savedlang)
        ini_close()
        global.option_language = optionsaved_language
        if (global.option_language == 0)
            global.language = "esp"
        if (global.option_language == 1)
            global.language = "eng"
        reload_langfile()
    }
}
if (buffer > 0)
    buffer--
if (optionselected == 3)
{
    if (buffer <= 0 && (!instance_exists(obj_audioconfig)))
    {
        if (key_jump || keyboard_check_pressed(vk_return))
        {
            visible = false
            with (instance_create(x, y, obj_audioconfig))
                depth = (other.depth - 1)
        }
    }
}
if (optionselected == 4)
{
    if (!instance_exists(obj_keyconfig))
    {
        if (key_jump || keyboard_check_pressed(vk_return) || keyboard_check_pressed(vk_return))
        {
            visible = false
            instance_create(x, y, obj_keyconfig)
        }
    }
}
if (optionselected == 5)
{
    if (buffer <= 0 && (!instance_exists(obj_extraoptions)))
    {
        if (key_jump || keyboard_check_pressed(vk_return))
        {
            visible = false
            with (instance_create(x, y, obj_extraoptions))
                depth = (other.depth - 1)
        }
    }
}
if ((key_slap2 || keyboard_check_pressed(vk_escape)) && (!instance_exists(obj_keyconfig)) && (!instance_exists(obj_audioconfig)))
{
    scr_soundeffect(sfx_enemyprojectile)
    if instance_exists(obj_mainmenuselect)
        obj_mainmenuselect.selected = 0
    else if instance_exists(obj_pause)
        obj_pause.cantmove = 0
    instance_destroy()
}
