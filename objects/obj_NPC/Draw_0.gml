draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
shader_reset()
if flash
{
    shader_set(shd_hit)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    shader_reset()
}

draw_sprite_ext(sprbubblebox, bubblebox_index, sprbubblebox == spr_textbox || sprbubblebox == spr_bubbleboxtotextbox || sprbubblebox == spr_textboxtobubblebox?x - 32 : x, sprbubblebox == spr_textbox || sprbubblebox == spr_bubbleboxtotextbox || sprbubblebox == spr_textboxtobubblebox? y - 80 : y - 48, 1, 1, 0, c_white, bubblealpha)

draw_sprite_ext(spr_bubbleboxcontent, contentindex, x, (y - 46) + contenty, 1, 1, 0, c_white, contentalpha * bubblealpha)