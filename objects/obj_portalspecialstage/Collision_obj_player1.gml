with (other)
{
    with (other)
    {
        if (ds_list_find_index(global.saveroom, id) == -1)
            ds_list_add(global.saveroom, id)
    }
    if (state != 110)
    {
        with (other)
        {
            xscale = 1.7
            yscale = 0.6
            zscale = 1
            xspd = 0
            yspd = 0
            going = 1
        }
        global.combotime = 60
        visible = false
        x = other.x
        y = other.y
        hsp = 0
        vsp = 0
        scr_soundeffect(sfx_secretfound)
        state = 110
        targetRoom = other.specialstageroom
        roombefore = room
        other.alarm[0] = 150
    }
}
