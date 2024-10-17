var myplayer = obj_player1.id
if (player_id == 2)
    myplayer = obj_player2.id
with (myplayer)
{
    if (state != 113)
    {
        audio_sound_pitch(scr_soundeffect(sfx_parry), random_range(1, 1.1))
        if audio_is_playing(sfx_taunt)
            audio_stop_sound(sfx_taunt)
        if audio_is_playing(sfx_taunt1)
            audio_stop_sound(sfx_taunt1)
        if audio_is_playing(sfx_taunt2)
            audio_stop_sound(sfx_taunt2)
        if audio_is_playing(sfx_taunt3)
            audio_stop_sound(sfx_taunt3)
        if audio_is_playing(sfx_supertaunt1)
            audio_stop_sound(sfx_supertaunt1)
        if audio_is_playing(sfx_supertaunt1)
            audio_stop_sound(sfx_supertaunt1)
        if audio_is_playing(sfx_supertaunt1)
            audio_stop_sound(sfx_supertaunt1)
        if audio_is_playing(sfx_supertaunt1)
            audio_stop_sound(sfx_supertaunt1)
    }
    state = 113
    sprite_index = choose(spr_player_parry1, spr_player_parry2, spr_player_parry3)
    image_index = 0
    image_speed = 0.35
    taunttimer = 20
    movespeed = 8
    parry_inst = -4
    parry_count = parry_max
    with (instance_create(x, y, obj_parryeffect))
        image_xscale = other.xscale
    flash = 1
}
alarm[0] = die_time
collisioned = 1
