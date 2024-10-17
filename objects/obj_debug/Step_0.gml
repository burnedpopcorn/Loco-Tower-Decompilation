if keyboard_check_pressed(vk_f2)
{
    switch global.debugmode
    {
        case 0:
            global.debugmode = 1
            scr_soundeffect(sfx_pizzacoin)
            break
        case 1:
            global.debugmode = 0
            showcollisions = false
            showdetails = 0
            scr_soundeffect(sfx_pephurt)
            break
    }

}
if (global.debugmode == 1)
{
    if keyboard_check_pressed(vk_f3)
    {
        switch showdetails
        {
            case 0:
                showdetails = 1
                break
            case 1:
                showdetails = 0
                break
        }

    }
    if keyboard_check_pressed(vk_f4)
    {
        switch showcollisions
        {
            case false:
                showcollisions = true
                break
            case 1:
                showcollisions = false
                break
        }

    }
    if (keyboard_check_pressed(vk_f5) && instance_exists(obj_player1))
    {
        with (obj_player1)
        {
            if (state != 111)
                state = 111
        }
    }
}
with (obj_solid)
{
    if (object_index == obj_solid || object_index == obj_secretbigblock || object_index == obj_secretblock || object_index == obj_secretmetalblock)
        visible = other.showcollisions
}
with (obj_slope)
{
    if (object_index == obj_slope)
        visible = other.showcollisions
}
with (obj_platform)
{
    if (object_index == obj_platform)
        visible = other.showcollisions
}
