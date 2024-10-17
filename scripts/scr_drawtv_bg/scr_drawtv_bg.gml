function scr_drawtv_bg(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //scr_drawtv_bg
{
    if (argument6 == undefined)
        argument6 = spr_tv_bghall1
    if (argument7 == undefined)
        argument7 = spr_tv_bgusing
    var w = (sprite_get_width(argument7) * argument2)
    var h = (sprite_get_height(argument7) * argument3)
    if (!surface_exists(surfclip))
        surfclip = surface_create(w, h)
    if (!surface_exists(surffinal))
        surffinal = surface_create(w, h)
    surface_set_target(surfclip)
    draw_clear_alpha(c_black, 0)
    draw_rectangle_color(0, 0, w, h, c_white, c_white, c_white, c_white, 0)
    gpu_set_blendmode(bm_subtract)
    draw_sprite_ext(argument7, 0, 0, 0, argument2, argument3, 0, c_white, alpha)
    reset_blendmode()
    gpu_set_blendmode(bm_normal)
    surface_reset_target()
    surface_set_target(surffinal)
    draw_sprite_tiled(argument6, 0, tvbgfill, 1)
    draw_sprite_tiled(argument6, 1, tvbgfill2, 1)
    gpu_set_blendmode(bm_subtract)
    draw_surface(surfclip, 0, 0)
    reset_blendmode()
    gpu_set_blendmode(bm_normal)
    surface_reset_target()
    draw_surface(surffinal, argument0, argument1)
    return;
}

