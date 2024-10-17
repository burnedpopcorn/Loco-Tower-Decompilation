if (image_alpha <= 0)
{
}
switch state
{
    case 144:
        if (arenastate < 3)
        {
            draw_set_alpha(1)
            draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, 0)
            draw_sprite_ext(playerspr, -1, playerx, 540, 1, 1, 0, c_black, 1)
            draw_sprite_ext(bossspr, -1, bossx, 540, 1, 1, 0, c_black, 1)
            draw_set_alpha(whitefade)
            draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, 0)
            draw_set_alpha(1)
        }
        else
        {
            draw_sprite_tiled(spr_versusflame, -1, 0, flamey)
            var c_player = c_white
            var sx = irandom_range((-introshake), introshake)
            var sy = irandom_range((-introshake), introshake)
            var _index = 0
            var _xs = 1
            var _ys = 1
            var px = (playerx + sx)
            var py = (540 + sy)
            var bx = (bossx + sy)
            var by = (540 + sy)
            if (px > 0)
                px = 0
            if (py < 540)
                py = 540
            if (bx < 960)
                bx = 960
            if (by < 540)
                by = 540
            draw_sprite_ext(playerspr, -1, px, py, 1, 1, 0, c_player, 1)
            draw_sprite_ext(bossspr, 0, bx, by, _xs, _ys, 0, c_player, 1)
            if (_index == 1)
                draw_sprite_ext(bossspr, _index, bx, by, _xs, _ys, 0, c_player, glitchalpha)
            var xx = (irandom_range(-1, 1) + sx)
            var yy = (irandom_range(-1, 1) + sy)
            draw_sprite(vstitle, -1, xx, yy)
        }
        break
    case 0:
    case 98:
        scr_bosscontroller_draw_health(1798, player_rowmax, player_columnmax, player_hp, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad, player_index, image_alpha, 440, 0, 0)
        scr_bosscontroller_draw_health(boss_hpsprite, boss_rowmax, boss_columnmax, boss_prevhp, boss_maxhp, boss_hp_x, boss_hp_y, boss_xpad, boss_ypad, boss_index, image_alpha, -4, -4, -4)
        for (var i = 0; i < ds_list_size(particlelist); i++)
        {
            var b = ds_list_find_value(particlelist, i)
            with (b)
            {
                if (type == 0)
                {
                    x += hsp
                    y += vsp
                    if (vsp < 20)
                        vsp += 0.5
                    if (y > (540 + sprite_get_height(sprite_index)))
                        ds_list_delete(other.particlelist, i--)
                    else
                        draw_sprite(sprite_index, image_index, x, y)
                }
                else if (type == 1)
                {
                    if (image_index > (sprite_get_number(sprite_index) - 1))
                        ds_list_delete(other.particlelist, i--)
                    else
                    {
                        image_index += image_speed
                        draw_sprite(sprite_index, image_index, x, y)
                    }
                }
            }
        }
        break
}

