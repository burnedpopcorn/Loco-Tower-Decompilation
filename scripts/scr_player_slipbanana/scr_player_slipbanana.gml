function scr_player_slipbanana() //scr_player_slipbanana
{
    hsp = (xscale * movespeed)
    if grounded
        movespeed = Approach(movespeed, 0, 0.5)
    if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_rockethitwall)
        image_speed = 0
    else
        image_speed = 0.35
    if (sprite_index == spr_player_slipbanan2)
    {
        scr_player_addslopemomentum(0.25, 0.75)
        if (!grounded)
        {
            sprite_index = spr_player_slipbanan1
            image_index = 3
        }
    }
    if (grounded && vsp > -1 && sprite_index != spr_player_slipbanan2 && (!(place_meeting(x, (y + 1), obj_metalblock))) && (!(place_meeting(x, (y + 1), obj_destructibles))))
    {
        if (sprite_index == spr_player_rockethitwall)
        {
            scr_soundeffect(choose(46, 182, 198))
            sprite_index = spr_player_slipbanan2
            image_index = 0
            image_speed = 0.35
        }
        else
        {
            scr_soundeffect(choose(196, 34, 208, 189, 89, 47, 74, 18))
            vsp = -6
            movespeed = Approach(movespeed, 0, 3)
            sprite_index = spr_player_rockethitwall
            instance_create(x, (y + 43), obj_bangeffect)
        }
    }
    if (sprite_index == spr_player_slipbanan2)
    {
        if (floor(image_index) == (image_number - 1) && abs(hsp) <= 2)
            state = (0 << 0)
    }
    if (place_meeting_collision((x + xscale), y) && (!scr_slope()) && (place_meeting_slope((x + sign(hsp)), y) || place_meeting_solid((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        scr_soundeffect(choose(196, 34, 208, 189, 89, 47, 74, 18))
        if (sprite_index == spr_player_slipbanan1)
            movespeed = Approach(movespeed, 0, 3)
        sprite_index = spr_player_rockethitwall
        instance_create((x + 30), y, obj_bangeffect)
        xscale *= -1
        scr_sleep(1)
    }
    return;
}

