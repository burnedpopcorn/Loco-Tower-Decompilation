if (cantmove == 0)
{
    var index = global.language == "eng"
    if (!instance_exists(obj_pausescreen))
        draw_sprite_tiled_ext(spr_pausecomplex, index, x, y, 1, 1, c_white, alphapausetile)
    vspeed = 0.25
}
