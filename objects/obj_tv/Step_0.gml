var roomname = room_get_name(room)
if (room == rank_room || room == NoRoom || room == Special_hall || room == rm_intro || room == titlecard || string_letters(roomname) == "Tutori" || string_letters(roomname) == "Tutorii" || room == hub_start || room == hub_cafe || room == hub_afterstart || room == hub_hall || room == hub_afterhall || room == hub_magmamine || room == hub_boss1 || room == hub_lobby || room == hub_hallway || room == hub_locotown || room == hub_forestmaze || room == rm_introcustene || room == rm_titleselect || room == Realtitlescreen || room == Disclamer || room == Titlescreen || room == Scootertransition || room == credits || room == timesuproom || room == boss_room1 || room == characterselect)
{
    visible = false
    sprite_index = spr_tv_off
}
else
    visible = true
image_speed = 0.35
alpha = Approach(alpha, alphaend, 0.07)
if (fadebg > 0)
    fadebg = Approach(fadebg, 0, 0.1)
if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2
    bubbleindex += image_speed
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0
        switch bubblespr
        {
            case 260:
                bubblespr = 1795
                break
            case 109:
                bubblespr = 475
                if (prompt == -4 || prompt == "")
                    bubblespr = -4
                break
        }

    }
}
switch state
{
    case 0:
        if instance_exists(obj_ghostcollectibles)
            idlespr = (global.panic ? spr_tv_idlesecretpanic : spr_tv_idlesecret)
        else if (global.combo >= 3)
            idlespr = spr_tv_exprcombo
        else
            idlespr = (global.panic ? spr_tv_exprpanic : spr_tv_idle)
        var _state = obj_player1.state
        var _transfo = 1
        switch _state
        {
            case 116:
                idlespr = spr_tv_bubbletransf
                break
            case 24:
            case 18:
                idlespr = spr_tv_knight
                break
            case 13:
            case 112:
            case 117:
                idlespr = spr_tv_zombietransf
                break
            case (2 << 0):
                if (obj_player1.sprite_index == obj_player1.spr_tumble || obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend)
                    idlespr = spr_tv_tumble
                break
            case 6:
                idlespr = spr_tv_fireass
                break
            default:
                _transfo = 0
                break
        }

        if (!_transfo)
        {
            with (obj_player1)
            {
                if (sprite_index == spr_crazyrun)
                    tv_do_expression(1800)
                else if (state == 91 || sprite_index == spr_mach3boost)
                    tv_do_expression(1672)
                else if (state == 73)
                    tv_do_expression(1405)
                else if (global.stylethreshold >= 3)
                    tv_do_expression(1776)
            }
        }
        switch sprite_index
        {
            case spr_tv_off:
                if visible
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                }
                break
            case 1459:
                if (floor(image_index) == (image_number - 1))
                    sprite_index = idlespr
                break
            case 134:
                if (idleanim > 0)
                    idleanim--
                if (sprite_index != idlespr)
                    sprite_index = idlespr
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2)
                    image_index = 0
                }
                break
            case 1643:
            case 1784:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = idlespr
                    idleanim = (240 + (60 * irandom_range(-1, 2)))
                }
                if (idlespr != spr_tv_idle)
                    sprite_index = idlespr
                break
            default:
                sprite_index = idlespr
                break
        }

        if (sprite_index != spr_tv_open)
        {
            if (!ds_list_empty(tvprompts_list))
            {
                var b = ds_list_find_value(tvprompts_list, 0)
                prompt_buffer = prompt_max
                if (b[0] != "" && b[0] != -4)
                {
                    bubblespr = 260
                    bubbleindex = 0
                    prompt = b[0]
                    promptspd = b[3]
                    promptx = promptxstart
                }
                else
                {
                    if (bubblespr != -4 && bubblespr != 475)
                        bubblespr = 109
                    if (bubblespr == 475)
                        bubblespr = -4
                    bubbleindex = 0
                    promptx = promptxstart
                    prompt = -4
                }
                if (b[1] == 0)
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                    tvsprite = b[2]
                }
                else
                {
                    tvsprite = b[2]
                    sprite_index = tvsprite
                    image_index = 0
                }
                state = 8
            }
            else
                bubblespr = -4
        }
        break
    case 8:
        if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
            sprite_index = tvsprite
        if (sprite_index == tvsprite)
        {
            if (prompt_buffer > 0)
                prompt_buffer--
            else
            {
                promptx = promptxstart
                ds_list_delete(tvprompts_list, 0)
                state = 0
            }
        }
        break
    case 250:
        if (changingtv == 1 && floor(changingtvindex) == (changingtvnumber - 1))
        {
            if (expressionsprite != -4)
            {
                state = 251
                sprite_index = expressionsprite
            }
            else
                state = 0
            changingtvindex = 0
            changingtv = 0
        }
        break
    case 251:
        switch expressionsprite
        {
            case spr_tv_exprhurt:
                if (obj_player1.state != 73)
                {
                    if (expressionbuffer > 0)
                        expressionbuffer--
                    else
                    {
                        state = 250
                        expressionsprite = -4
                        changingtv = 1
                        changingtvindex = 0
                        changingtvspeed = 0.25
                    }
                }
                break
            case 1712:
                if (global.combo < 3)
                {
                    state = 250
                    expressionsprite = -4
                    if (obj_player1.state == 73)
                        tv_do_expression(1405)
                    changingtv = 1
                    changingtvindex = 0
                    changingtvspeed = 0.25
                }
                break
            case 1746:
                if (expressionbuffer > 0)
                    expressionbuffer--
                else
                {
                    state = 250
                    expressionsprite = -4
                    changingtv = 1
                    changingtvindex = 0
                    changingtvspeed = 0.25
                }
                break
            case 1672:
                with (obj_player1)
                {
                    if (sprite_index == spr_crazyrun)
                        tv_do_expression(1800)
                    if (state != 91 && state != (17 << 0) && state != 33 && state != 71 && sprite_index != spr_mach3boost && sprite_index != spr_crazyrun)
                    {
                        other.state = 250
                        other.expressionsprite = -4
                        other.changingtv = 1
                        other.changingtvindex = 0
                        other.changingtvspeed = 0.25
                    }
                }
                break
            case 1800:
                with (obj_player1)
                {
                    if (sprite_index != spr_crazyrun && state != 33)
                    {
                        other.state = 250
                        other.expressionsprite = -4
                        other.changingtv = 1
                        other.changingtvindex = 0
                        other.changingtvspeed = 0.25
                    }
                }
                break
            case 1776:
                _transfo = 0
                if (global.stylethreshold < 3 || _transfo)
                {
                    state = 250
                    expressionsprite = -4
                    changingtv = 1
                    changingtvindex = 0
                    changingtvspeed = 0.25
                }
                break
        }

        if (!ds_list_empty(tvprompts_list))
        {
            state = 250
            expressionsprite = -4
            changingtv = 1
            changingtvindex = 0
            changingtvspeed = 0.25
        }
        break
}

if (room == Nhall_1)
{
    global.srank = 30000
    global.arank = (global.srank - (global.srank / 4))
    global.brank = (global.srank - ((global.srank / 4) * 2))
    global.crank = (global.srank - ((global.srank / 4) * 3))
}
marx_index += 0.35
hand_index += 0.35
johnface_index += 0.35
if (global.panic && global.fill > 0)
{
    showtime_buffer = 100
    if (!instance_exists(obj_ghostcollectibles))
        timer_y = Approach(timer_y, timer_ystart, 1)
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 4)
}
else if global.panic
{
    if (marx_sprite == spr_timer_marx1)
    {
        marx_sprite = spr_timer_marx2
        marx_index = 0
    }
    else if (marx_sprite == spr_timer_marx2)
    {
        if (floor(marx_index) == (sprite_get_number(marx_sprite) - 1))
        {
            marx_sprite = spr_timer_marx3
            marx_index = 0
        }
    }
    else if (showtime_buffer > 0)
        showtime_buffer--
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 1)
}
else
{
    marx_sprite = spr_timer_marx1
    hand_sprite = spr_timer_hand1
    timer_y = (timer_ystart + 212)
}
if (global.panic && global.fill < (chunkmax / 5))
    hand_sprite = spr_timer_hand2
barfill_x -= 0.2
if (barfill_x < -306)
    barfill_x = 0
if (marx_index > (sprite_get_number(marx_sprite) - 1))
    marx_index = frac(marx_index)
if (patricksun_index > (sprite_get_number(patricksun_sprite) - 1))
    patricksun_index = frac(patricksun_index)
if (hand_index > (sprite_get_number(hand_sprite) - 1))
    hand_index = frac(hand_index)
if (johnface_index > (sprite_get_number(johnface_sprite) - 1))
    johnface_index = frac(johnface_index)
if (showtext == 1)
{
    xi = (500 + random_range(1, -1))
    if (yi > 500)
        yi -= 5
}
if (showtext == 0)
{
    xi = (500 + random_range(1, -1))
    if (yi < 600)
        yi += 1
}
if (!((obj_player.state == 24 && obj_player.state == 25 && obj_player.state == 18)))
    once = 0
var change_pos = 0
if (obj_player.x > (room_width - 224) && obj_player.y < 187 && room != Special_hall)
    change_pos = 1
var spd = 15
if change_pos
    hud_posY = Approach(hud_posY, -300, spd)
else
    hud_posY = Approach(hud_posY, 0, spd)
combo_posX = Wave(-5, 5, 2, 20)
if (global.combotime > 0 && global.combo != 0)
{
    switch combo_state
    {
        case 0:
            combo_posY += combo_vsp
            combo_vsp += 0.5
            if (combo_posY > 20)
                combo_state++
            break
        case 1:
            combo_posY = lerp(combo_posY, 0, 0.05)
            if (combo_posY < 1)
            {
                combo_posY = 0
                combo_vsp = 0
                combo_state++
            }
            break
        case 2:
            if (global.combotime < 30)
            {
                combo_posY += combo_vsp
                if (combo_vsp < 20)
                    combo_vsp += 0.5
                if (combo_posY > 0)
                {
                    combo_posY = 0
                    combo_vsp = -1
                    if (global.combotime < 15)
                        combo_vsp = -2
                }
            }
            else
                combo_posY = Approach(combo_posY, 0, 10)
            break
    }

}
else
{
    combo_posY = Approach(combo_posY, -500, 5)
    combo_vsp = 0
    combo_state = 0
}
combofill_index += 0.35
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
    combofill_index = frac(combofill_index)
changingtvindex += changingtvspeed
if (changingtvindex > (changingtvnumber - 1))
    changingtvindex = frac(changingtvindex)
if instance_exists(obj_player)
{
    tvbgfill -= (obj_player1.hsp / 12)
    tvbgfill2 -= (obj_player1.hsp / 8)
}
if (tvbgfill < -192 || tvbgfill > 192)
    tvbgfill = 0
if (tvbgfill2 < -192 || tvbgfill2 > 192)
    tvbgfill2 = 0
