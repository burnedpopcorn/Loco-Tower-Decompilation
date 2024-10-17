if (sprite_index == spr_peashooter_shoot)
{
    if (image_index >= 2 && (!shooted))
    {
        scr_soundeffect(sfx_enemyprojectile)
        with (instance_create((x + (16 * image_xscale)), (y + 16), obj_peashooterbullet))
            image_xscale = other.image_xscale
        shooted = 1
    }
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_peashooter_idle
        alarm[0] = 120
    }
}
if (sprite_index == spr_peashooter_idle)
    shooted = 0
