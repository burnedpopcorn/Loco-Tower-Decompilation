if (sPauseGUI != -4)
{
    draw_sprite_ext(sPause, -1, 480, 270, scalepause, scalepause, 0, c_white, 1)
    draw_sprite_ext(sPauseGUI, -1, 480, 270, scalepause, scalepause, 0, c_white, 1)
}
var index = global.language == "eng"
draw_sprite_tiled_ext(spr_pausecomplex, index, 0, vspeedsprite, 1, 1, c_white, obj_pause.alphapausetile)
