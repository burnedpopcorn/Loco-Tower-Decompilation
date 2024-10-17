if audio_is_playing(sfx_collecttopping)
    audio_stop_sound(sfx_collecttopping)
audio_sound_pitch(scr_soundeffect(sfx_collecttopping), (1 + random(0.2)))
global.collect += 10
global.combotime += 10
global.combotime = clamp(global.combotime, 0, 60)
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(10)
create_collect_color(x, y, sprite_index, colorpalettesprite, colorpalette)
instance_destroy()
