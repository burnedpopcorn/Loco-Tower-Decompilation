if ending
{
    var cx = camera_get_view_x(view_camera[0])
    var cy = camera_get_view_y(view_camera[0])
    draw_set_color(c_white)
    draw_set_alpha(fade)
    draw_rectangle_color(cx, cy, (cx + 960), (cy + 540), c_white, c_white, c_white, c_white, 0)
    draw_set_alpha(1)
    with (obj_sausageman_dead)
    {
        if (sprite_index == spr_patrickpillardebris)
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    }
    shader_set(global.Pal_Shader)
    with (obj_player1)
    {
        if visible
        {
            pal_swap_set(spr_palette, paletteselect, 0)
            draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, image_blend, image_alpha)
        }
    }
    shader_reset()
}
