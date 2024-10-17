if bbox_in_camera(view_camera[0], 0)
{
    var fadeRange = 240
    var fadeThresh = 94
    var playerDis = distance_to_object(obj_player)
    soundGain = (((fadeThresh + fadeRange) - playerDis) / fadeRange)
    if (!audio_is_playing(soundID))
        soundID = scr_soundeffect(sfx_plushiealert)
    audio_sound_gain(soundID, ((0.6 * global.option_music_volume) * soundGain), 0)
}
if (!(bbox_in_camera(view_camera[0], 0)))
{
    if audio_is_playing(soundID)
    {
        audio_stop_sound(soundID)
        soundID = -4
        soundGain = 0
    }
}
if (place_meeting(x, y, obj_player) && sprite_index == spr_pizzaboxunopen)
{
    if (!audio_is_playing(sfx_collecttoppin))
        scr_soundeffect(sfx_collecttoppin)
    audio_stop_sound(soundID)
    if (content == obj_noisebomb)
    {
        with (obj_player)
        {
            state = 51
            sprite_index = spr_player_bossintro
            image_index = 0
        }
        with (instance_create(x, (y - 25), content))
            sprite_index = spr_noisebomb_intro
        instance_create(x, y, obj_taunteffect)
        instance_create(x, (y + 600), obj_itspizzatime)
        global.panic = 1
        switch room
        {
            case floor1_room11:
                global.minutes = 2
                global.seconds = 30
                break
            case floor2_roomtreasure:
                global.minutes = 2
                global.seconds = 40
                break
            case floor3_roomtreasure:
                global.minutes = 2
                global.seconds = 30
                break
            case floor4_roomtreasure:
                global.minutes = 2
                global.seconds = 0
                break
            case floor5_roomtreasure:
                global.minutes = 2
                global.seconds = 0
                break
        }

        global.wave = 0
        global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
        if global.panicbg
            scr_panicbg_init()
    }
    if (content == obj_pizzakinshroom)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        instance_create(x, y, obj_taunteffect)
        with (instance_create(x, (y - 25), content))
            sprite_index = spr_toppinshroom_intro
        global.combotime = 60
        if (global.toppintotal < 5)
            obj_tv.message = (("NECESITAS " + string((5 - global.toppintotal))) + " MAS PELUCHES!")
        if (global.toppintotal == 5)
            obj_tv.message = "TIENES TODOS LOS PELUCHES!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.shroomfollow = 1
    }
    if (content == obj_pizzakincheese)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
            sprite_index = spr_toppincheese_intro
        instance_create(x, y, obj_taunteffect)
        global.combotime = 60
        if (global.toppintotal < 5)
            obj_tv.message = (("NECESITAS " + string((5 - global.toppintotal))) + " MAS PELUCHES!")
        if (global.toppintotal == 5)
            obj_tv.message = "TIENES TODOS LOS PELUCHES!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.cheesefollow = 1
    }
    if (content == obj_pizzakintomato)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
            sprite_index = spr_toppintomato_intro
        instance_create(x, y, obj_taunteffect)
        global.combotime = 60
        if (global.toppintotal < 5)
            obj_tv.message = (("NECESITAS " + string((5 - global.toppintotal))) + " MAS PELUCHES!")
        if (global.toppintotal == 5)
            obj_tv.message = "TIENES TODOS LOS PELUCHES!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.tomatofollow = 1
    }
    if (content == obj_pizzakinsausage)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
            sprite_index = spr_toppinsausage_intro
        instance_create(x, y, obj_taunteffect)
        if (global.toppintotal < 5)
            obj_tv.message = (("NECESITAS " + string((5 - global.toppintotal))) + " MAS PELUCHES!")
        if (global.toppintotal == 5)
            obj_tv.message = "TIENES TODOS LOS PELUCHES!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.sausagefollow = 1
    }
    if (content == obj_pizzakinpineapple)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000"
        if place_meeting(x, y, obj_player1)
            global.collect += 1000
        else
            global.collectN += 1000
        with (instance_create(x, (y - 25), content))
            sprite_index = spr_toppinpineapple_intro
        instance_create(x, y, obj_taunteffect)
        global.combotime = 60
        ds_list_add(global.saveroom, id)
        if (global.toppintotal < 5)
            obj_tv.message = (("NECESITAS " + string((5 - global.toppintotal))) + " MAS PELUCHES!")
        if (global.toppintotal == 5)
            obj_tv.message = "TIENES TODOS LOS PELUCHES!"
        obj_tv.showtext = 1
        obj_tv.alarm[0] = 150
        global.toppintotal += 1
        global.pineapplefollow = 1
    }
    instance_destroy()
}
if (sprite_index == spr_pizzaboxopen && floor(image_index) == 16)
    instance_destroy()
