if global.panic
{
    image_alpha = 1
    if (sprite_index == spr_pizzaportal)
    {
        playerid = noone
        with (obj_player1)
        {
            if (other.playerid == noone && place_meeting(x, y, other))
            {
                if (state != 19)
                {
                    scr_soundeffect(sfx_lapenter)
                    state = 19
                    global.collect += 3000
                    global.combotime = 60
                    with (instance_create(x, y, obj_smallnumber))
                        number = string(3000)
                }
                visible = false
                other.sprite_index = spr_pizzaportalend
                other.image_index = 0
                other.playerid = id
            }
        }
    }
    else if (sprite_index == spr_pizzaportalend)
    {
        with (playerid)
        {
            hsp = 0
            vsp = 0
            visible = false
        }
        if (floor(image_index) == (image_number - 1))
        {
            image_index = (image_number - 1)
            image_speed = 0
            if (!instance_exists(obj_fadeout))
            {
                with (obj_player1)
                {
                    targetDoor = "LAP"
                    targetRoom = other.targetRoom
                }
                if (global.minutes > 0 || (global.minutes == 0 && global.seconds > 0))
                {
                    with (obj_camera)
                    {
                        gettingfilltimer = 1
                        addseconds += other.seconds
                        while (other.minutes > 0)
                        {
                            other.minutes--
                            addseconds += 60
                        }
                        alarm[1] = -1
                        alarm[3] = 2
                    }
                }
                for (var i = 0; i < ds_list_size(global.escaperoom); i++)
                {
                    var b = ds_list_find_value(global.escaperoom, i)
                    var q = ds_list_find_index(global.baddieroom, b)
                    var t = 0
                    if (q == -1)
                    {
                        q = ds_list_find_index(global.saveroom, b)
                        t = 1
                    }
                    if (q != -1)
                    {
                        if (!t)
                            ds_list_delete(global.baddieroom, q)
                        else
                            ds_list_delete(global.saveroom, q)
                    }
                }
                global.laps++
                global.lap = 1
                if (!instance_exists(obj_lapvisual))
                    instance_create(0, 0, obj_lapvisual)
                instance_create(0, 0, obj_fadeout)
            }
        }
    }
}
else
    image_alpha = 0.5
