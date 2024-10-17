instance_destroy()
if (!instance_exists(obj_marxbaddie))
{
    with (instance_create(obj_marx.x, obj_marx.y, obj_marxbaddie))
    {
        image_xscale = (-obj_marx.image_xscale)
        hsp = (xscale * 5)
        vsp = -5
        state = 106
        if (stunned < 100)
            stunned = 100
    }
}
if instance_exists(obj_marx)
{
    if audio_is_playing(sfx_lasershoot)
        audio_stop_sound(sfx_lasershoot)
    instance_destroy(obj_marx)
    scr_soundeffect(sfx_marxstun)
}
obj_camera.zoom = 1
obj_camera.spdzooming = 0.035
