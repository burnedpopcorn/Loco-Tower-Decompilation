function scr_player_skateboard() //scr_player_skateboard
{
    image_speed = 0.35
    machhitAnim = 0
    crouchslideAnim = 1
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    if grounded
    {
        if (movespeed <= 10)
            movespeed = approach(movespeed, 10, 0.2)
        else
            movespeed = approach(movespeed, 10, 0.035)
    }
    if grounded
    {
        if (scr_slope() && hsp != 0)
            scr_player_addslopemomentum(0.1, 0.2, 7)
        if (move == (-xscale) && movespeed >= 6)
        {
            scr_soundeffect(sfx_machslideboost)
            image_index = 0
            sprite_index = spr_playerN_machslideboost
            state = 118
        }
    }
    if (input_buffer_jump < 8 && grounded)
    {
        if (movespeed >= 8)
            movespeed -= 2
        vsp = -10
        image_index = 0
        sprite_index = spr_player_mowerjump
        scr_soundeffect(sfx_jump)
    }
    if (!grounded)
    {
        if (sprite_index == spr_player_mower && vsp >= 0)
        {
            image_index = 0
            sprite_index = spr_player_mowerfall
        }
    }
    if (grounded && vsp >= 0)
    {
        if (sprite_index == spr_player_mowerjump || sprite_index == spr_player_mowerfall)
        {
            image_index = 0
            sprite_index = spr_player_mowerland
        }
        else if (sprite_index != spr_player_mowerland)
            sprite_index = spr_player_mower
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_player_mowerjump)
            sprite_index = spr_player_mowerfall
        if (sprite_index == spr_player_mowerland)
            sprite_index = spr_player_mower
    }
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 10
        jumpstop = 1
    }
    if key_jump
        input_buffer_jump = 0
    if grounded
        jumpstop = 0
    if (place_meeting_collision((x + xscale), y) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting_slope((x + sign(hsp)), y))))
    {
        var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
        if _bump
        {
            if grounded
            {
                scr_soundeffect(sfx_bumpwall)
                state = 72
                image_index = 0
                sprite_index = spr_player_wallsplat
                instance_create(x, (y + 10), obj_skateboarddebris1)
                instance_create(x, (y + 10), obj_skateboarddebris2)
            }
            else
            {
                scr_soundeffect(sfx_bumpwall)
                state = 72
                hsp = ((-xscale) * 5)
                vsp = -2
                sprite_index = spr_bump
                instance_create(x, (y + 10), obj_skateboarddebris1)
                instance_create(x, (y + 10), obj_skateboarddebris2)
            }
        }
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    if (!grounded)
        scr_dotaunt()
}

