alphapause = approach(alphapause, pause, (pause ? 0.04 : 0.1))
alphapausetile = approach(alphapausetile, (pause ? 0.5 : 0), 0.1)
if (!pause)
{
    if (obj_player1.key_start && (!instance_exists(obj_textbox)) && (!instance_exists(obj_titlecard)) && (!instance_exists(obj_intro)) && room != rank_room && room != uh_oh_your_game_crashed && room != rm_titleselect && room != Scootertransition && room != Realtitlescreen && room != Disclamer && room != timesuproom)
    {
        instance_create(x, y, obj_pausescreen)
        selected = 0
        audio_pause_all()
        audio_resume_sound(sfx_pause)
        scr_soundeffect(sfx_pause)
        instance_deactivate_all(true)
        instance_activate_object(obj_pause)
        instance_activate_object(obj_mouse)
        instance_activate_object(obj_pausescreen)
        instance_activate_object(obj_inputAssigner)
        alarm[1] = 400
        pause = 1
    }
}
if (pause && (!audio_is_playing(sfx_pause)) && (!audio_is_playing(mu_pause)))
    audio_sound_pitch(scr_music(205), 1)
if (!pause)
{
    alarm[1] = -1
    scaledsi = lerp(scaledsi, 1.5, 0.2)
    scaletext = lerp(scaletext, 0, 0.3)
}
with (obj_player1)
{
    other.paletteselect = paletteselect
    other.spr_palette = spr_palette
}
if (pause == 1 && cantmove == 0)
{
    scaledsi = lerp(scaledsi, 1, 0.3)
    scaletext = lerp(scaletext, 1, 0.07)
    scr_getinput()
    application_surface_draw_enable(true)
    if (opcionesdirect != 1)
    {
        switch selected
        {
            case 0:
                spr_player = spr_player_idle
                break
            case 1:
                spr_player = spr_player_panic
                break
            case 2:
                spr_player = spr_file2
                break
            case 3:
                spr_player = spr_player_hurtidle
                break
        }

        peppino_sprite_number = sprite_get_number(spr_player)
    }
    else
    {
        spr_player = spr_file2
        peppino_sprite_number = sprite_get_number(spr_player)
    }
    peppino_index += 0.35
    if (peppino_index > peppino_sprite_number)
    {
        var p = (peppino_index - floor(peppino_index))
        peppino_index = p
    }
    for (var i = 0; i < array_length(toppin_sprite); i++)
    {
        toppin_index[i] += 0.35
        if (toppin_index[i] > toppin_number[i])
        {
            var t = toppin_index[i]
            p = (t - floor(t))
            toppin_index[i] = p
        }
    }
    toppin_has[0] = global.shroomfollow
    toppin_has[1] = global.cheesefollow
    toppin_has[2] = global.tomatofollow
    toppin_has[3] = global.sausagefollow
    toppin_has[4] = global.pineapplefollow
    if (key_down2 && selected < 3 && cantmove == 0)
    {
        peppino_index = 0
        selected += 1
        scr_soundeffect(sfx_step)
    }
    if (key_up2 && selected > 0 && cantmove == 0)
    {
        peppino_index = 0
        selected -= 1
        scr_soundeffect(sfx_step)
    }
    if (key_jump && selected == 2 && cantmove == 0)
    {
        instance_create(x, y, obj_option)
        cantmove = 1
    }
    if (key_jump && selected == 1 && cantmove == 0)
    {
        var roomname = room_get_name(room)
        if (global.snickchallenge == 0)
        {
            if (string_letters(roomname) == "Tutori")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                instance_destroy(obj_pausescreen)
                instance_activate_all()
                instance_destroy(obj_fadeout)
                room = Tutori_1
                scr_playerreset()
                pause = 0
                obj_tv.bglevel = 1
                obj_player1.targetDoor = "E"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "E"
                obj_player1.state = 61
                obj_player1.sprite_index = obj_player1.spr_walkfront
                obj_player1.image_index = 0
                global.lowpassEffect.bypass = 1
            }
            else if (string_letters(roomname) == "Nhall" || string_letters(roomname) == "Nhallsecret" || string_letters(roomname) == "Nhalltreasure")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                instance_destroy(obj_pausescreen)
                instance_activate_all()
                instance_destroy(obj_fadeout)
                room = Nhall_1
                scr_playerreset()
                pause = 0
                obj_tv.bglevel = 1
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
                obj_player1.state = 61
                obj_player1.sprite_index = obj_player1.spr_walkfront
                obj_player1.image_index = 0
                global.lowpassEffect.bypass = 1
            }
            else if (string_letters(roomname) == "Nlocotown" || string_letters(roomname) == "Nlocotownescape" || string_letters(roomname) == "Nlocotownsecret")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                instance_destroy(obj_pausescreen)
                instance_activate_all()
                instance_destroy(obj_fadeout)
                room = Nlocotown_1
                scr_playerreset()
                pause = 0
                obj_tv.bglevel = 1
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
                obj_player1.state = 61
                obj_player1.sprite_index = obj_player1.spr_walkfront
                obj_player1.image_index = 0
                global.lowpassEffect.bypass = 1
            }
            else
                scr_soundeffect(sfx_enemyprojectile)
        }
    }
    if (key_jump2 && selected == 3 && cantmove == 0)
    {
        roomname = room_get_name(room)
        instance_destroy(obj_pausescreen)
        global.lowpassEffect.bypass = 1
        if (room == hub_hall || room == hub_start || room == hub_afterstart || room == hub_lobby || room == Titlescreen || room == credits || room == hub_locotown || room == hub_cafe || room == hub_afterstart || room == Scootertransition)
        {
            if audio_is_playing(mu_pause)
            {
                audio_stop_sound(mu_pause)
                audio_sound_pitch(mu_pause, 1)
            }
            pause = 0
            instance_activate_all()
            instance_destroy(obj_fadeout)
            room = Disclamer
            with (obj_player1)
            {
                character = "P"
                scr_characterspr()
            }
            scr_playerreset()
            obj_player.state = 8
            global.cowboyhat = 0
            obj_player1.targetDoor = "A"
            global.coop = 0
            if instance_exists(obj_player2)
                obj_player2.targetDoor = "A"
        }
        else
        {
            if (string_letters(roomname) == "locotown" || string_letters(roomname) == "locotownescape" || string_letters(roomname) == "locotownsecret")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                pause = 0
                instance_activate_all()
                scr_playerreset()
                obj_player.targetDoor = "C"
                obj_player.state = 110
                room = hub_locotown
            }
            if (string_letters(roomname) == "Nlocotown" || string_letters(roomname) == "Nlocotownescape" || string_letters(roomname) == "Nlocotownsecret")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                pause = 0
                instance_activate_all()
                scr_playerreset()
                obj_player.targetDoor = "C"
                obj_player.state = 110
                room = hub_locotown
            }
            if (string_letters(roomname) == "forestmaze" || string_letters(roomname) == "forestmazeescape" || string_letters(roomname) == "forestmazesecret")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                pause = 0
                instance_activate_all()
                scr_playerreset()
                obj_player.targetDoor = "C"
                obj_player.state = 110
                room = hub_forestmaze
            }
            else if (string_letters(roomname) == "hall" || string_letters(roomname) == "halllap" || string_letters(roomname) == "hallescape" || string_letters(roomname) == "hallsecret")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                pause = 0
                instance_activate_all()
                scr_playerreset()
                obj_player.targetDoor = "C"
                obj_player.state = 110
                room = hub_hall
            }
            else if (string_letters(roomname) == "Nhall" || string_letters(roomname) == "Nhalltreasure" || string_letters(roomname) == "Nhallsecret")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                pause = 0
                instance_activate_all()
                scr_playerreset()
                obj_player.targetDoor = "C"
                obj_player.state = 110
                room = hub_hall
            }
            else if (string_letters(roomname) == "Tutorii" || string_letters(roomname) == "Tutori")
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                pause = 0
                instance_activate_all()
                scr_playerreset()
                obj_player.targetDoor = "E"
                obj_player.state = 110
                room = hub_tutorial
            }
            else
            {
                if audio_is_playing(mu_pause)
                {
                    audio_stop_sound(mu_pause)
                    audio_sound_pitch(mu_pause, 1)
                }
                pause = 0
                instance_activate_all()
                scr_playerreset()
                obj_player.targetDoor = "C"
                room = hub_lobby
            }
            instance_destroy(obj_fadeout)
        }
    }
    if (key_jump2 && selected == 0 && cantmove == 0)
    {
        if audio_is_playing(mu_pause)
            audio_stop_sound(mu_pause)
        instance_activate_all()
        instance_destroy(obj_pausescreen)
        scr_deactivate_escape()
        alarm[0] = 1
        audio_resume_all()
        audio_resume_sound((obj_music.secret ? global.secretmusic : global.music))
        audio_pause_sound((obj_music.secret ? global.music : global.secretmusic))
        pause = 0
    }
}
