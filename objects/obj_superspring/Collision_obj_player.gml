with (other)
{
    if (state != 63)
    {
        if (state == 24 || state == 25 || state == 18)
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5
        }
        x = other.x
        if (state == 27)
            instance_create(x, y, obj_bombexplosion)
        if (other.image_yscale == 1)
        {
            sprite_index = spr_player_presentbox
            state = 63
            vsp = -10
        }
        else
        {
            sprite_index = spr_player_rockethitwall
            state = 74
            vsp = 10
        }
        other.image_index = 0
        if (other.sprite_index != other.activatespr)
            scr_soundeffect(sfx_superjumprelease)
        other.sprite_index = other.activatespr
        other.image_speed = 0.35
    }
}
