draw_set_alpha(fadealpha)
draw_set_color(c_white)
draw_rectangle(0, 0, (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)), false)
draw_set_alpha(1)
if ((!instance_exists(obj_rank)) && room != Tutori_1 && fadein == 1)
{
    shader_set(global.Pal_Shader)
    with (obj_player1)
    {
        pal_swap_set(spr_palette, paletteselect, 0)
        draw_sprite_ext(sprite_index, image_index, x, (y + other.yp), xscale, yscale, image_angle, image_blend, image_alpha)
    }
    shader_reset()
}
