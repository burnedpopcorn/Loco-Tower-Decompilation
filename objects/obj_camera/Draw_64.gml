if (obj_player1.spotlight == 1)
    pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
else
    pal_swap_set(obj_player2.spr_palette, obj_player2.paletteselect, 0)
if (obj_player.backupweapon == 1)
    draw_sprite_ext(spr_shotgunbackup, -1, 50, 100, 1, 1, 1, c_white, alpha)
if (obj_player.state != 55)
{
    if (obj_player.x < 250 && obj_player.y < 169)
        hud_posY = Approach(hud_posY, -300, 15)
    else
        hud_posY = Approach(hud_posY, 0, 15)
    if (pizzascore_index > (pizzascore_number - 1))
        pizzascore_index = (0 + frac(pizzascore_index))
    _y = lerp(_y, (global.laps >= 5 ? 372 : 540), 0.1)
    draw_sprite_ext(spr_dsiheat, -1, 0, _y, 1, 1, 0, c_white, alpha)
    var sw = sprite_get_width(spr_heatmeterds_fill)
    var sh = sprite_get_height(spr_heatmeterds_fill)
    var b = global.stylemultiplier
    draw_sprite_part(spr_heatmeterds_fill, 0, 0, 0, (sw * b), sh, 105, (_y + 99))
    var _xoffset = Wave(-2, 2, 4, 2)
    var _yoffset = Wave(-3, 3, 6, 2)
    var _score = global.collect
    var oghud_xx = (117 + _xoffset)
    var oghud_yy = ((127 + hud_posY) + _yoffset)
    var hud_xx = (oghud_xx + irandom_range((-collect_shake), collect_shake))
    var hud_yy = (oghud_yy + irandom_range((-collect_shake), collect_shake))
    var rx = (oghud_xx + 110)
    var ry = (oghud_yy - 22)
    var rank_ix = 0
    if (_score >= global.srank)
    {
        if (global.lap && global.secretfound >= 3 && global.treasure && (!global.combodrop))
            rank_ix = 5
        else
            rank_ix = 4
    }
    else if (_score >= global.arank)
        rank_ix = 3
    else if (_score >= global.brank)
        rank_ix = 2
    else if (_score >= global.crank)
        rank_ix = 1
    if (previousrank != rank_ix)
    {
        previousrank = rank_ix
        rank_scale = 3
    }
    rank_scale = Approach(rank_scale, 1, 0.2)
    var spr_w = sprite_get_width(spr_ranks_hudfill)
    var spr_h = sprite_get_height(spr_ranks_hudfill)
    var spr_xo = sprite_get_xoffset(spr_ranks_hudfill)
    var spr_yo = sprite_get_yoffset(spr_ranks_hudfill)
    var perc = 0
    switch rank_ix
    {
        case 4:
            perc = 1
            break
        case 3:
            perc = ((_score - global.arank) / (global.srank - global.arank))
            break
        case 2:
            perc = ((_score - global.brank) / (global.arank - global.brank))
            break
        case 1:
            perc = ((_score - global.crank) / (global.brank - global.crank))
            break
        default:
            perc = (_score / global.crank)
    }

    var t = (spr_h * perc)
    var top = (spr_h - t)
    draw_sprite_ext(spr_scorehud, pizzascore_index, oghud_xx, oghud_yy, 1, 1, 0, c_white, alpha)
    draw_sprite_ext(spr_ranks_hud, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, alpha)
    if (rank_ix != 5)
        draw_sprite_part_ext(spr_ranks_hudfill, rank_ix, 0, top, spr_w, (spr_h - top), (rx - spr_xo), ((ry - spr_yo) + top), rank_scale, rank_scale, c_white, alpha)
    else
    {
        for (var i = 0; i < (global.laps - 1); i++)
            draw_sprite_ext(spr_ranks_hudfill, rank_ix, ((rx + ((sprite_get_width(spr_ranks_hudfill) / 4) * i)) - (((sprite_get_width(spr_ranks_hudfill) / 4) / 2) * (global.laps - 2))), ry, rank_scale, rank_scale, 0, c_white, alpha)
    }
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(global.scorefont)
    var text_y = 0
    switch floor(pizzascore_index)
    {
        case 1:
        case 2:
        case 3:
            text_y = 1
            break
        case 5:
        case 10:
            text_y = -1
            break
        case 6:
        case 9:
            text_y = -2
            break
        case 7:
            text_y = -3
            break
        case 8:
            text_y = -5
            break
    }

    var cs = 0
    with (obj_comboend)
        cs += comboscore
    var sc = ((_score - global.comboscore) - cs)
    var str = string(sc)
    var num = string_length(str)
    var w = string_width(str)
    var xx = (hud_xx - (w / 2))
    if (lastcollect != sc)
    {
        color_array = array_create(num, 0)
        for (i = 0; i < array_length(color_array); i++)
            color_array[i] = choose(irandom(3))
        lastcollect = sc
    }
    shader_set(global.Pal_Shader)
    draw_set_alpha(alpha)
    draw_set_color(c_white)
    for (i = 0; i < num; i++)
    {
        var yy = (((i + 1) % 2) == 0 ? -5 : 0)
        var c = color_array[i]
        pal_swap_set(1785, c, 0)
        draw_text(xx, (((hud_yy - 88) + text_y) + yy), string_char_at(str, (i + 1)))
        xx += (w / num)
    }
    draw_set_alpha(1)
    shader_reset()
    draw_set_font(global.bigfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    if marxstunned
    {
        draw_sprite_ext(spr_marxlaugh, marx_index, (480 + random_range(-3, 3)), (96 + random_range(-3, 3)), 1, 1, 0, c_white, 0.2)
        if (marxseconds < 10)
            draw_text((480 + random_range(-1, 1)), 96, string_hash_to_newline(("0:0" + string(marxseconds))))
        else if (marxseconds >= 10)
            draw_text((480 + random_range(-1, 1)), 96, string_hash_to_newline(("0:" + string(marxseconds))))
    }
}
draw_set_blend_mode(0)
