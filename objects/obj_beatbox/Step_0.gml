if (obj_player1.sprite_index != spr_player_breakdance)
{
    instance_create(x, y, obj_genericpoofeffect)
    instance_destroy()
    if audio_is_playing(snd)
        audio_stop_sound(snd)
}
if bbox_in_camera(view_camera[0], 0)
{
    var fadeRange = 340
    var fadeThresh = 85
    var playerDis = distance_to_object(obj_player1)
    soundGain = (((fadeThresh + fadeRange) - playerDis) / fadeRange)
    if ((!audio_is_playing(snd)) && obj_player1.sprite_index == spr_player_breakdance)
        snd = scr_soundeffect(sfx_breakdancemusic)
    audio_sound_gain(snd, ((0.6 * global.option_music_volume) * soundGain), 0)
}
scr_collision()
