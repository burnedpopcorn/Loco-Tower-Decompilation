if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    if instance_exists(obj_backgroundchange)
        obj_backgroundchange.ending = 1
    obj_music.escapetheme = 1
    global.minutes = minutes
    global.seconds = seconds
    global.fill = (((global.minutes * 60) + global.seconds) * 60)
    with (obj_tv)
        chunkmax = global.fill
    with (obj_chunktimer)
        fillmax = global.fill
    with (obj_escapecollect)
        image_alpha = 1
    with (obj_escapecollectbig)
        image_alpha = 1
    scr_soundeffect(sfx_pillarimpact)
    scr_soundeffect(sfx_escaperumble)
    audio_sound_pitch(scr_soundeffect(sfx_screampatrick), (1 + random_range(0, 0.2)))
    obj_camera.alarm[1] = 60
    instance_create(x, y, obj_bangeffect)
    repeat (3)
        instance_create(x, y, obj_slapstar)
    repeat (3)
        instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        zoom = 1
        spdzooming = 0.035
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    if (state == 1)
    {
        with (instance_create((obj_player1.x + (obj_player1.xscale * 15)), obj_player1.y, obj_genericpoofeffect))
        {
            sprite_index = spr_bombexplosion
            image_index = 0
            image_speed = 0.35
        }
    }
    instance_destroy()
    var i = 0
    for (i = 0; i < 5; i++)
    {
        with (instance_create((x - 64), (y + 112), obj_sausageman_dead))
        {
            sprite_index = spr_patrickpillardebris
            image_index = i
            vsp = random_range(-2, -4)
            hsp = (sign((x - obj_player.x)) * random_range(4, 8))
        }
    }
    scr_soundeffect(sfx_killenemy)
    instance_create(x, (y + 600), obj_itspizzatime)
    global.panic = 1
    global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
    global.wave = 0
    ds_list_add(global.saveroom, id)
}
