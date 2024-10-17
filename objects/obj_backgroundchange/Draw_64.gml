if (!ending)
{
    draw_set_alpha(0.6)
    for (var i = 0; i < 3; i++)
        draw_sprite(spr_punchbackground, -1, 0, (bgoffest + (540 * i)))
    draw_set_alpha(1)
    draw_sprite(spr_punchcustene, -1, 0, yoffest)
}
