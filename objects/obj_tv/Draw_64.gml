var tv_x = 845
var tv_y = 80
var _cx = (tv_x + combo_posX)
var _cy = (((tv_y + 121) + hud_posY) + combo_posY)
var _perc = (global.combotime / 60)
var _minX = (_cx - 56)
var _maxX = (_cx + 59)
combofill_x = lerp(combofill_x, (_minX + ((_maxX - _minX) * _perc)), 0.5)
combofill_y = _cy
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y)
draw_sprite(spr_tv_combobubble, -1, _cx, _cy)
draw_set_font(global.combofont2)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
var _tx = (_cx - 69)
var _ty = (_cy + 6)
var _str = string(global.combo)
var num = string_length(_str)
for (var i = num; i > 0; i--)
{
    var char = string_char_at(_str, i)
    draw_text(_tx, _ty, char)
    _tx -= 22
    _ty -= 8
}
if (sprite_index != spr_tv_open)
{
    if (!bglevel)
        draw_sprite_ext(spr_tv_bg, 0, tv_x, (tv_y + hud_posY), 1, 1, 0, c_white, alpha)
    else
    {
        var tvbg = (instance_exists(obj_ghostcollectibles) ? spr_tv_bgsecret : tvbgdraw)
        scr_drawtv_bg((tv_x - 139), (tv_y - 134), 1, 1, tvbgfill, 1, tvbg)
    }
}
draw_sprite_ext(spr_tv_bgfade, 0, tv_x, (tv_y + hud_posY), 1, 1, 0, c_white, fadebg)
pal_swap_set(516, obj_player1.paletteselect, 0)
draw_sprite_ext(sprite_index, image_index, tv_x, (tv_y + hud_posY), 1, 1, 0, c_white, alpha)
shader_reset()
if (changingtv == 1)
    draw_sprite_ext(spritetvchanging, changingtvindex, tv_x, (tv_y + hud_posY), 1, 1, 0, c_white, alpha)
if (bubblespr != -4)
    draw_sprite_ext(bubblespr, bubbleindex, 512, 53, 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
    promptsurface = surface_create(290, 102)
surface_set_target(promptsurface)
draw_clear_alpha(c_black, 0)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(alpha)
if (bubblespr == 1795)
{
    promptx -= promptspd
    if (bubblespr != 109 && promptx < (350 - string_width(prompt)))
    {
        bubblespr = 109
        bubbleindex = 0
    }
    draw_text_color((promptx - 350), 50, prompt, c_black, c_black, c_black, c_black, 1)
}
draw_set_halign(fa_left)
surface_reset_target()
draw_surface(promptsurface, 350, 0)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_set_font(alpha)
if global.panic
{
    var _fill = global.fill
    var _currentbarpos = (chunkmax - _fill)
    _perc = (_currentbarpos / chunkmax)
    var _max_x = 299
    var _max_patrickspeed = 0.35
    var _max_patrickshake = 3
    var _barpos = (_max_x * _perc)
    var _shakejohn = (_max_patrickshake * _perc)
    var patrickspeed = (_max_patrickspeed * _perc)
    patricksun_index += patrickspeed
    draw_sprite(spr_timer_bar, -1, timer_x, timer_y)
    if (!surface_exists(bar_surface))
        bar_surface = surface_create(298, 36)
    var _barfillpos = (floor(_barpos) + 13)
    if (_barfillpos > 0)
    {
        surface_resize(bar_surface, _barfillpos, 36)
        surface_set_target(bar_surface)
        draw_clear_alpha(c_black, 0)
        var clip_x = timer_x
        var clip_y = timer_y
        draw_sprite(spr_timer_barfillday, 0, 0, 0)
        for (i = 0; i < 3; i++)
            draw_sprite(spr_timer_barfill, 0, (barfill_x + (i * 306)), 0)
        surface_reset_target()
        draw_surface(bar_surface, clip_x, clip_y)
    }
    draw_sprite(patricksun_sprite, patricksun_index, (((timer_x + 13) + _barpos) + shakeboth(_shakejohn)), ((timer_y + 20) + shakeboth(_shakejohn)))
    draw_sprite(marx_sprite, marx_index, (timer_x + 320), (timer_y + 10))
    draw_set_font(global.bigfont)
    var shakingy = 0
    var shakingx = 0
    if (obj_camera.addseconds > 0)
    {
        draw_set_color(c_green)
        shakingy = 2
        shakingx = 2
    }
    else
    {
        draw_set_color(((global.seconds <= 30 && global.minutes == 0) ? c_red : c_white))
        shakingy = 0
        shakingx = 0
    }
    if (global.seconds < 10)
        draw_text(((timer_x + 149) + shakeboth(shakingx)), ((timer_y - 32) + shakeboth(shakingy)), string_hash_to_newline(string_hash_to_newline(((string(global.minutes) + ":0") + string(global.seconds)))))
    else if (global.seconds >= 10)
        draw_text(((timer_x + 149) + shakeboth(shakingx)), ((timer_y - 32) + shakeboth(shakingy)), string_hash_to_newline(string_hash_to_newline(((string(global.minutes) + ":") + string(global.seconds)))))
}
