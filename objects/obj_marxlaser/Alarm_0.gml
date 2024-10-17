with (obj_player1)
{
    visible = true
    TUx = 20
    TUy = 20
    instance_destroy(obj_fadeout)
    targetDoor = "A"
    room = timesuproom
    state = 36
    image_speed = 0.35
    sprite_index = spr_Timesup
    image_index = 0
    audio_stop_all()
    scr_soundeffect(mu_timesup)
}
instance_destroy()
