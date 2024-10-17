    var i = 0
    while (i < array_length(room_arr))
    {
		var b = room_arr[i]
		if (room == b[0])
		{
			room_details = b
			break
		}
		else
		{
			i++
			continue
		}
	}
if ((!global.panic) && room != timesuproom && room != rank_room)
{
	    var _song = room_details[1]
		if (array_length(room_details) > 4)
			_song = self.room_details[4]()
    if (music != _song)
    {
        music = _song
        prevmuID = global.music
        var cur_mus_pos = (audio_sound_get_track_position(prevmuID) / audio_sound_length(prevmuID))
        global.music = scr_music(music)
        var set_mus_pos = (cur_mus_pos * audio_sound_length(global.music))
        if (room_details[3] || force_cont)
            audio_sound_set_track_position(global.music, set_mus_pos)
        if audio_is_playing(prevmuID)
        {
            audio_sound_gain(prevmuID, 0, 500)
            audio_sound_gain(global.music, 0, 0)
            audio_sound_gain(global.music, ((audio_sound_get_gain(music) * 0.8) * global.option_music_volume), 500)
        }
        else
            audio_sound_gain(global.music, ((audio_sound_get_gain(music) * 0.8) * global.option_music_volume), 0)
        audio_stop_sound(global.secretmusic)
        audio_stop_sound(pillarmusicID)
        global.secretmusic = -4
    }
    force_cont = 0
    if instance_exists(obj_hungrypillar)
    {
        pillarmusicID = scr_music(mu_patrickdepth)
        audio_sound_gain(pillarmusicID, 0, 0)
    }
}

if secret
{
	global.secretmusic = scr_music(global.panic ? mu_specialescape : room_details[2])
    var cur_pos = (audio_sound_get_track_position(global.music) / audio_sound_length(global.music))
    var set_secret_pos = (cur_pos * audio_sound_length(global.secretmusic))
    audio_sound_set_track_position(global.secretmusic, set_secret_pos)
    audio_pause_sound(global.music)
    scr_soundeffect(sfx_secretfound)
}
else if secretend
{
    secretend = 0
    audio_resume_sound(global.music)
    audio_stop_sound(global.secretmusic)
}
if (room == rank_room)
{
    audio_stop_sound(musicID)
    audio_stop_sound(secretmusicID)
    audio_stop_sound(pillarmusicID)
    musicID = -4
    secretmusicID = -4
    pillarmusicID = -4
}
