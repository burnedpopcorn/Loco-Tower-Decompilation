if (visible == true && (!gotcaught))
{
    obj_specialhud.done = 1
    scr_soundeffect(sfx_collectgiantpizza)
    with (other)
    {
        state = 4
        sprite_index = spr_machfreefall
    }
    alarm[0] = 100
    gotcaught = 1
    with (instance_create(x, y, obj_smallnumber))
        number = "1000"
    global.collect += 1000
}
