yoffest = Approach(yoffest, ((state && (!falsestate)) ? 0 : -540), 40)
switch state
{
    case 1:
        if (!instance_exists(obj_fadeout))
        {
            if playerid.key_up2
                selected++
            if playerid.key_down2
                selected--
            selected = clamp(selected, 0, (array_length(level_array) - 1))
            if playerid.key_jump2
            {
                if (level_array[selected][0] != room)
                {
                    scr_soundeffect(sfx_elevator)
                    falsestate = 1
                    with (obj_player)
                    {
                        targetRoom = other.level_array[other.selected][0]
                        targetDoor = "ELEVATOR"
                    }
                    instance_create(x, y, obj_fadeout)
                }
                else
                {
                    state = 0
                    with (obj_player)
                        state = 0
                }
            }
            if playerid.key_slap2
            {
                scr_soundeffect(sfx_enemyprojectile)
                state = 0
                with (obj_player)
                    state = 0
            }
        }
        break
}

