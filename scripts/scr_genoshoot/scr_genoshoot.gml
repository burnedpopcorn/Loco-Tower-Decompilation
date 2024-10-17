function scr_genoshoot() //scr_genoshoot
{
    breakdance_pressed = 0
    genodelay = genodelay_max
    if audio_is_playing(sfx_shotgun)
        audio_stop_sound(sfx_shotgun)
    audio_sound_pitch(scr_soundeffect(sfx_shotgun), random_range(0.9, 1.1))
    state = 38
    with (instance_create(x, y, obj_pistoleffect))
        image_xscale = other.xscale
    image_index = 0
    sprite_index = spr_shotgunshoot
    instance_create((x + (xscale * 20)), (y + 20), obj_genobullet)
}

