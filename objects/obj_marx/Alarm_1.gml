with (instance_create(x, y, obj_afterimage))
{
    sprite_index = other.sprite_index
    image_xscale = other.image_xscale
    image_index = other.image_index
}
with (instance_create(wingsx, wingsy, obj_afterimage))
{
    sprite_index = spr_marx_parts
    image_index = 0
}
with (instance_create(shoesx, shoesy, obj_afterimage))
{
    sprite_index = spr_marx_parts
    image_index = 1
}
alarm[1] = 10
