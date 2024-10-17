ds_list_add(global.saveroom, id)
global.gerome = 1
instance_create(x, y, obj_keyman)
scr_soundeffect(sfx_getkeyman)
instance_destroy()
with (obj_player)
{
    roomstartx = other.x
    roomstarty = other.y
}
