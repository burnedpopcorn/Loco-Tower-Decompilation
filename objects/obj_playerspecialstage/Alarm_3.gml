if (state == 0)
{
    with (instance_create(x, y, obj_transpeffect))
    {
        playerid = other.object_index
        image_index = (other.image_index - 1)
        image_xscale = other.xscale
        sprite_index = other.spritereal
    }
    alarm[3] = 3
}
else
    effectappear = 0
