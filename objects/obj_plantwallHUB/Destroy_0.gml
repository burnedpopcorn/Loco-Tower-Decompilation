if (needofsave == 1)
{
    repeat (8)
    {
        with (create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), 1772, 1))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_speed = 0.35
        }
    }
    repeat (3)
    {
        with (instance_create((x + random_range(0, 64)), (y + random_range(0, 64)), obj_parryeffect))
        {
            sprite_index = spr_deadjohnsmoke
            image_speed = 0.35
        }
    }
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1)
        audio_stop_sound(sfx_breakblock2)
    }
    scr_soundeffect(sfx_breakblock1, 98)
    ini_open_from_string(obj_savesystem.ini_str)
    if (ini_read_real("Custene", "plantwall", 0) == 0)
    {
        global.custeneplantwall = 1
        ini_write_real("Custene", "plantwall", 1)
        scr_soundeffect(sfx_secretfound)
    }
    obj_savesystem.ini_str = ini_close()
    gamesave_async_save()
}
