pal_swap_set(1258, paletteselect, 0)
draw_sprite_ext(sprite_index, image_index, x, (y + stundraw), (xscale * image_xscale), yscale, image_angle, image_blend, image_alpha)
shader_reset()
if flash
{
    shader_set(shd_hit)
    draw_sprite_ext(sprite_index, image_index, x, (y + stundraw), (xscale * image_xscale), yscale, image_angle, image_blend, image_alpha)
    shader_reset()
}
