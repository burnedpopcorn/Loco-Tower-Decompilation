if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (global.panic == 1)
    {
        repeat (8)
        {
            with (instance_create((x + random_range(0, 64)), (y + random_range(0, 64)), obj_debris))
            {
                sprite_index = spr_towerblockdebris
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
                image_speed = 0.35
            }
        }
        tile_layer_delete_at(1, x, y)
        tile_layer_delete_at(1, (x + 32), y)
        tile_layer_delete_at(1, (x + 32), (y + 32))
        tile_layer_delete_at(1, x, (y + 32))
        if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
        {
            audio_stop_sound(sfx_breakblock1)
            audio_stop_sound(sfx_breakblock2)
        }
        scr_soundeffect(sfx_breakblock1, 98)
        ds_list_add(global.saveroom, id)
    }
}
