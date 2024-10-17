function scr_specialplayer_punch() //scr_specialplayer_punch
{
    hsp = (xscale * movespeed)
    movespeed = Approach(movespeed, 10, 0.4)
    if (!grounded)
        vsp = 0
    if (floor(image_index) == (image_number - 1))
        state = 0
    if (((!grounded) && (place_meeting_collision((x + sign(hsp)), y) || place_meeting_solid((x + sign(hsp)), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting_slope((x + sign(hsp)), y)))) || (grounded && (place_meeting_collision((x + hsp), (y - 64)) || place_meeting_solid((x + hsp), (y - 64))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting_slope(x, (y + 1))))
    {
        scr_soundeffect(sfx_bumpwall)
        state = 0
        sprite_index = spr_player_fall
        xscale *= -1
        vsp = -5
        jumpstop = 1
        movespeed = 6
    }
    if (grounded && (!scr_slope()) && (place_meeting_collision((x + sign(hsp)), y) || place_meeting_solid((x + sign(hsp)), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting_slope((x + sign(hsp)), y))) && (!(place_meeting_slope((x + sign(hsp)), y))))
        xscale *= -1
}

