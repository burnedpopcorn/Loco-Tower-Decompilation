switch rank
{
    case "p":
        rankindex = 5
        break
    case "s":
        rankindex = 4
        break
    case "a":
        rankindex = 3
        break
    case "b":
        rankindex = 2
        break
    case "c":
        rankindex = 1
        break
    case "d":
        rankindex = 0
        break
}

if (level != "tutorial")
{
    draw_set_font(global.collectfontds)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(c_white)
    _y = lerp(_y, (drawing ? 150 : 0), 0.15)
    _xscale = Approach(_xscale, (_y > 100 ? 1 : 0.5), 0.06)
    _yscale = Approach(_yscale, (_y > 130 ? 1 : 1.2), 0.06)
    draw_sprite_ext(spr_scoregate, 0, x, (y - _y), _xscale, _yscale, 0, c_white, 1)
    draw_text_transformed(x, ((y - _y) - 36), highscore, _xscale, _yscale, 0)
}
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
var xw = (x - sprite_get_xoffset(sprite_index))
var yh = (y - sprite_get_yoffset(sprite_index))
if (!surface_exists(bgsurfcase))
    bgsurfcase = surface_create((sprite_width - 70), (sprite_height - 50))
surface_set_target(bgsurfcase)
draw_clear_alpha(c_black, 0)
for (var i = 0; i < 3; i++)
    draw_sprite(bgdraw1, 0, (gatebgfill1 + (i * 192)), -50)
for (var o = 0; o < 3; o++)
    draw_sprite(bgdraw1, 1, (gatebgfill2 + (o * 192)), -50)
surface_reset_target()
draw_surface(bgsurfcase, (xw + 35), (yh + 50))
draw_set_alpha(alphagate)
draw_sprite(sprite_index, 1, x, y)
draw_set_alpha(1)
draw_self()
if (drawing && level != "tutorial")
{
    draw_sprite(spr_ranks_hud, rankindex, x, (y - 250))
    if (rank == "p")
    {
        for (i = 0; i < (laps - 1); i++)
            draw_sprite(spr_ranks_hudfill, rankindex, ((x + ((sprite_get_width(spr_ranks_hudfill) / 4) * i)) - (((sprite_get_width(spr_ranks_hudfill) / 4) / 2) * (laps - 2))), (y - 250))
    }
    draw_sprite((toppin[0] ? spr_pizzakinshroom : spr_pizzakinshroom_pause), -1, (x - 75), (y - 100))
    draw_sprite((toppin[1] ? spr_pizzakincheese : spr_pizzakincheese_pause), -1, (x - 35), (y - 100))
    draw_sprite((toppin[2] ? spr_pizzakintomato : spr_pizzakintomato_pause), -1, x, (y - 100))
    draw_sprite((toppin[3] ? spr_pizzakinsausage : spr_pizzakinsausage_pause), -1, (x + 35), (y - 100))
    draw_sprite((toppin[4] ? spr_pizzakinpineapple : spr_pizzakinpineapple_pause), -1, (x + 75), (y - 100))
}
