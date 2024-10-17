prevpillar_on_camera = pillar_on_camera
if instance_exists(obj_hungrypillar)
{
    var p = 0
    with (obj_hungrypillar)
    {
        if bbox_in_camera(view_camera[0], 0)
            p = 1
    }
    if (p != pillar_on_camera)
        pillar_on_camera = p
}
else
    pillar_on_camera = 0
audio_sound_pitch(escapemusic,marxpitch)

if instance_exists(obj_marx)
	marxpitch = Wave(0.95,1,0.07,1)
else
	marxpitch = 1
if (prevpillar_on_camera != pillar_on_camera)
{
    if pillar_on_camera
    {
        audio_sound_gain(pillarmusicID, (0.6 * global.option_music_volume), 2000)
        audio_sound_gain(global.music, 0, 2000)
    }
    else
    {
        audio_sound_gain(pillarmusicID, 0, 2000)
        audio_sound_gain(global.music, (0.6 * global.option_music_volume), 2000)
    }
}
if global.lap
	escapemusic = (global.laps >= 3 ? mu_lap3 : mu_lap)
else
{
	if obj_player1.character == "T"
		escapemusic = mu_tvNescape
	else
		escapemusic = mu_pizzatime
}
if (audio_sound_get_gain(prevmuID) <= 0)
    audio_stop_sound(prevmuID)
else if instance_exists(obj_specialdoor)
{
	if music != mu_specialstage
	{
		music = mu_specialstage
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
	}
}
if (room != timesuproom && room != rank_room)
{
{
    var _song = -4
    if (array_length(room_details) > 4)
        _song = self.room_details[4]()
    if global.panic
    {
        _song = escapemusic
        unforce_cont = 1
    }
    else
        unforce_cont = 0
    if (_song != -4 && music != _song)
    {
        music = _song
        prevmuID = global.music
        var cur_mus_pos = (audio_sound_get_track_position(prevmuID) / audio_sound_length(prevmuID))
        global.music = scr_music(music)
        var set_mus_pos = (cur_mus_pos * audio_sound_length(global.music))
        if (!unforce_cont)
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
}
if music == mu_pizzatime && global.panic
{
	var trackpos = audio_sound_get_track_position(global.music)
	/*
	if trackpos >= 141.73
		audio_sound_set_track_position(global.music, 45.766667)
		*/
	
	
	if trackpos >= 7.35 && !startbgescape
	{
		with instance_create(x,y,obj_backgroundchange)
			ending = 1
		
		var roomname = room_get_name(room)
		if (string_letters(roomname) == "Nhall")
		{
			var lay_id = layer_get_id("Backgrounds_1")
			var bg_id = layer_background_get_id(lay_id)
			if layer_background_get_sprite(bg_id) = bg_hall2
				layer_background_change(bg_id,bg_hall2escape)

			var lay_id2 = layer_get_id("Backgrounds_2")
			var bg_id2 = layer_background_get_id(lay_id2)
			if layer_background_get_sprite(bg_id2) = bg_hall1
				layer_background_change(bg_id2,bg_hall1escape)
		}
		if string_letters(roomname) == "Nlocotown" || string_letters(roomname) == "Nlocotownb"
		{
			var lay_id = layer_get_id("Backgrounds_sky5")
			var bg_id = layer_background_get_id(lay_id)
			if layer_background_get_sprite(bg_id) = bg_cementary3
				layer_background_change(bg_id,bg_cementaryescape3)

			var lay_id2 = layer_get_id("Backgrounds_sky4")
			var bg_id2 = layer_background_get_id(lay_id2)
			if layer_background_get_sprite(bg_id2) = bg_cementary2
				layer_background_change(bg_id2,bg_cementaryescape2)

			var lay_id3 = layer_get_id("Backgrounds_sky3")
			var bg_id3 = layer_background_get_id(lay_id3)
			if layer_background_get_sprite(bg_id3) = bg_cementary1
				layer_background_change(bg_id3,bg_cementaryescape1)
		}
		
		var bricksfalling = layer_create(-350, "Foreground_escape")
		var back = layer_background_create(bricksfalling, bg_fallingbricksforefront)
		layer_background_htiled(back, true)
		layer_background_vtiled(back, true)
		layer_vspeed(bricksfalling, 4)
		
		startbgescape = true
	}
}
if music == mu_lap3 && global.panic
{
	var bricksfalling = layer_get_id("Foreground_escape")
	var back_vspeed = layer_get_vspeed(bricksfalling)
	if back_vspeed = 4 
		layer_vspeed(bricksfalling, 0)	
	
	
	var trackpos = audio_sound_get_track_position(global.music)	
	if trackpos >= 5.73 && !global.lap3activate
	{
		with instance_create(x,y,obj_backgroundchange)
			ending = 1
			
		global.wave = global.maxwave
		scr_panicbg_init()
		layer_vspeed(bricksfalling, -4)
		global.lap3activate = true
	}
}

}