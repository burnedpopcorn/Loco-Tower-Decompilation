function scr_player_backbreaker() //scr_player_backbreaker
{
    if (!styledtaunting)
    {
        mach2 = 0
        if (sprite_index != spr_player_machfreefall)
        {
            hsp = 0
            movespeed = 0
        }
        else
            hsp = (xscale * movespeed)
        landAnim = 0
        if (sprite_index == spr_player_machfreefall && place_meeting(x, (y + 1), obj_solid))
        {
            state = 71
            sprite_index = spr_player_crouchslide
        }
        if (sprite_index == spr_taunt || sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_player_supertaunt4)
        {
            if ((!instance_exists(parry_inst)) && taunttimer > parry_max)
            {
                parry_inst = instance_create(x, y, obj_parryhitbox)
                var _playerid = 1
                if (object_index == obj_player2)
                    _playerid = 2
                with (parry_inst)
                {
                    player_id = _playerid
                    image_xscale = other.xscale
                }
            }
            if (taunttimer < taunt_to_parry_max)
            {
                if instance_exists(parry_inst)
                {
                    instance_destroy(parry_inst)
                    parry_inst = noone
                }
            }
            if (supercharged == 1 && (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_player_supertaunt4) && (!instance_exists(obj_tauntaftereffectspawner)))
            {
                instance_create(x, y, obj_tauntaftereffectspawner)
                var lag = 20
                with (obj_baddie)
                {
                    if point_in_camera(x, y, view_camera[0])
                    {
                        hp = -99
                        state = 105
                        hitLag = lag
                        hitX = x
                        hitY = y
                        if elite
                        {
                            elitehit = -1
                            mach3destroy = 1
                        }
                        instance_create(x, y, obj_parryeffect)
                        alarm[3] = 3
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
                    }
                }
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = (30 / room_speed)
                }
                supercharge = 0
                supercharged = 0
            }
            taunttimer--
            vsp = 0
        }
        if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3 || sprite_index == spr_player_supertaunt4))
        {
            movespeed = tauntstoredmovespeed
            sprite_index = tauntstoredsprite
            state = tauntstoredstate
            image_index = tauntstoredindex
            if (tauntstoredstate == 47 && tauntstoredsprite == spr_player_breakdanceuppercut)
                vsp = tauntstoredvsp
            supercharge = 0
            supercharged = 0
            if instance_exists(parry_inst)
            {
                instance_destroy(parry_inst)
                parry_inst = noone
            }
        }
        if (taunttimer <= 0 && sprite_index == spr_taunt)
        {
            movespeed = tauntstoredmovespeed
            sprite_index = tauntstoredsprite
            state = tauntstoredstate
            image_index = tauntstoredindex
            if (tauntstoredstate == 47 && tauntstoredsprite == spr_player_breakdanceuppercut)
                vsp = tauntstoredvsp
            if instance_exists(parry_inst)
            {
                instance_destroy(parry_inst)
                parry_inst = -4
            }
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
            state = (0 << 0)
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
            state = (0 << 0)
        if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete || sprite_index == spr_playerN_victory))
            state = (0 << 0)
        if (key_jump && sprite_index == spr_player_phoneidle)
        {
            global.panic = 1
            sprite_index = spr_bossintro
            image_index = 0
            with (instance_create(x, y, obj_debris))
            {
                image_index = 0
                sprite_index = spr_phonedebris
            }
        }
        if (global.miniboss == 1 && sprite_index == spr_bossintro && floor(image_index) == (image_number - 1))
            state = (0 << 0)
        image_speed = 0.35
    }
    else
    {
        sprite_index = spr_taunt
        hsp = (xscale * movespeed)
        landAnim = 0
        if key_taunt2
        {
            styledtaunts += 1
            if audio_is_playing(sfx_styledtaunt)
                audio_stop_sound(sfx_styledtaunt)
            scr_soundeffect(sfx_styledtaunt)
            audio_sound_pitch(sfx_styledtaunt, (1 + (styledtaunts / 20)))
            image_index = random_range(0, 11)
            with (instance_create(x, y, obj_taunteffect))
            {
                player = other.id
                image_speed = 0.65
            }
        }
        if grounded
        {
            if audio_is_playing(sfx_styledtaunt)
                audio_stop_sound(sfx_styledtaunt)
            audio_sound_pitch(sfx_styledtaunt, 1)
            room_speed = 60
            state = tauntstoredstate
            sprite_index = tauntstoredsprite
            image_index = tauntstoredindex
            movespeed = (tauntstoredmovespeed + styledtaunts)
            if (styledtaunts >= 10)
                scr_soundeffect(sfx_superjumprelease)
            if (movespeed > 18)
                movespeed = 18
            flash = 1
            styledtaunts = 0
            styledtaunting = 0
            obj_camera.zoom = 1
            obj_camera.spdzooming = 0.3
        }
        if (place_meeting_collision((x + sign(hsp)), y) && (!(place_meeting_slope((x + sign(hsp)), y))))
        {
            if audio_is_playing(sfx_styledtaunt)
                audio_stop_sound(sfx_styledtaunt)
            audio_sound_pitch(sfx_styledtaunt, 1)
            room_speed = 60
            sprite_index = spr_mach2jump
            image_speed = 0.35
            image_index = 0
            hsp = 0
            state = 72
            scr_soundeffect(sfx_explosion)
            with (instance_create(x, y, obj_explosioneffect))
                sprite_index = spr_bombexplosion
            flash = 1
            hsp = (-5.5 * xscale)
            vsp = -6
            styledtaunts = 0
            styledtaunting = 0
            obj_camera.zoom = 1
            obj_camera.spdzooming = 0.3
        }
    }
}

