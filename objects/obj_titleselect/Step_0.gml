scr_getinput()
if ((!instance_exists(obj_option)) && (!instance_exists(obj_fileselect)) && (!instance_exists(obj_erasegame)) && optionselected == 0)
{
    if (key_down2 && optionselect < 3)
    {
        scr_soundeffect(sfx_step)
        optionselect += 1
    }
    if (key_up2 && optionselect > 0)
    {
        scr_soundeffect(sfx_step)
        optionselect -= 1
    }
    if (key_jump && optionselected == 0)
    {
        switch optionselect
        {
            case 0:
                alarm[0] = 1
                scr_soundeffect(sfx_collecttoppin)
                break
            case 1:
                alarm[1] = 1
                scr_soundeffect(sfx_collecttoppin)
                break
            case 2:
                alarm[2] = 1
                scr_soundeffect(sfx_collecttoppin)
                break
            case 3:
                alarm[3] = 60
                scr_soundeffect(sfx_collecttoppin)
                optionselected = 1
                break
        }

    }
}
