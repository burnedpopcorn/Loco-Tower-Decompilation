if (ds_list_find_index(global.baddieroom, id) == -1 && ((!elite) || elitehit <= 0))
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
}
if (ds_list_find_index(global.baddieroom, id) == -1 && ((!elite) || elitehit <= 0) && important == 0)
{
    var i = random_range(0, 100)
    if (i >= 95)
        scr_soundeffect(sfx_scream1, 138, 139, 140, 141, 142, 143, 144, 145, 146)
    scr_soundeffect(sfx_killenemy)
}
if (ds_list_find_index(global.baddieroom, id) == -1 && important == 0)
{
    scr_sleep(50)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    ds_list_add(global.baddieroom, id)
    if (escape || underescape)
        ds_list_add(global.escaperoom, id)
    if ((!elite) || elitehit <= 0)
    {
        with (obj_player1)
            supercharge += 1
    }
    if ((!elite) || elitehit <= 0)
        global.combo += 1
    if ((!elite) || elitehit <= 0)
    {
        var combototal = (10 + round((10 * (global.combo * 0.5))))
        global.collect += combototal
        global.comboscore += combototal
    }
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important == 1)
{
    scr_sleep(50)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
}
