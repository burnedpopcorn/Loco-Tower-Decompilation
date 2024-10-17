function scr_dotaunt() //scr_dotaunt
{
    if (key_taunt2 || input_finisher_buffer > 0)
    {
        input_finisher_buffer = 0
        if (state == 44)
        {
            scr_soundeffect(sfx_styledtaunt)
            flash = 1
            styledtaunting = 1
            obj_camera.zoom = 0.7
            obj_camera.spdzooming = 0.1
        }
        else if (supercharged && key_up)
            scr_soundeffect(choose(159, 186, 51, 43))
        else
            audio_sound_pitch(scr_soundeffect(sfx_taunt), random_range(1, 1.1))
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredindex = image_index
        tauntstoredstate = state
        if (state == 47 && sprite_index == spr_player_breakdanceuppercut)
            tauntstoredvsp = vsp
        state = 51
        if (!styledtaunting)
        {
            if (supercharged && key_up)
            {
                image_index = 0
                sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3, spr_player_supertaunt4)
            }
            else
            {
                taunttimer = 20
                sprite_index = spr_taunt
                image_index = random_range(0, 12)
            }
        }
        else
        {
            styledtaunts += 1
            sprite_index = spr_taunt
            image_index = random_range(0, 12)
            room_speed = 30
        }
        with (instance_create(x, y, obj_taunteffect))
        {
            player = other.id
            image_speed = (other.styledtaunting ? 0.65 : 0.35)
        }
    }
}

