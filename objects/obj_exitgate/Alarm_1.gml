scr_soundeffect(sfx_groundpound)
with (obj_camera)
{
    shake_mag = 10
    shake_mag_acc = (30 / room_speed)
}
obj_player.visible = false
audio_stop_sound(mu_pizzatime)
audio_stop_sound(sfx_escaperumble)
audio_stop_sound(mu_lap)
image_index = 0
alarm[0] = 100
