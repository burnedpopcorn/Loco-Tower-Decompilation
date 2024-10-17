if (image_index == 1 && global.panic == 0 && endlevel == 0)
{
    with (obj_player)
    {
        if (sprite_index == spr_walkfront && floor(image_index) == (image_number - 2))
        {
            scr_soundeffect(sfx_groundpound)
            sprite_index = spr_Timesup
            image_index = 0
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            other.image_index = 0
            ds_list_add(global.saveroom, other.id)
        }
    }
}
with (obj_player)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == 0 || state == 69 || state == 70 || state == 91) && (global.panic == 1 || global.snickchallenge == 1))
    {
        if (global.timeattack == 1)
            obj_timeattack.stop = 1
        targetDoor = "none"
        obj_camera.alarm[2] = -1
        scr_savescore(global.leveltosave)
        with (obj_camera)
            alphaend = 0
        with (obj_tv)
            alphaend = 0
        if instance_exists(obj_keyman)
            obj_keyman.visible = false
        if instance_exists(obj_zombiefollow)
            obj_zombiefollow.visible = false
        if (global.combo > 0)
        {
            global.combotime = 0
            global.combo = 0
            obj_camera.alarm[4] = -1
            for (var i = 0; i < global.comboscore; i += 10)
                create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), choose(1293, 1295, 1296, 1297, 1294))
            global.comboscore = 0
        }
        obj_player1.state = 78
        obj_player1.sprite_index = obj_player1.spr_lookdoor
        if instance_exists(obj_player2)
        {
            obj_player2.state = 78
            obj_player2.sprite_index = obj_player2.spr_lookdoor
        }
        other.endlevel = 1
        other.alarm[1] = 20
        image_index = 0
        global.panic = 0
        global.lap = 0
        global.snickchallenge = 0
        gamesave_async_save()
    }
}
