function scr_player_bubble() //scr_player_bubble
{
    vsp = -4
    sprite_index = spr_machfreefall
    if (grav == 0)
        grav = 0.5
    move = (key_left + key_right)
    hsp = movespeed
    if (place_meeting_collision(x, (y - 1)) || ((!(place_meeting(x, y, obj_water))) && (!(place_meeting(x, y, obj_waterunder))) && (!(place_meeting(x, y, obj_watercurrent)))))
    {
        state = 58
        jumpstop = 1
        sprite_index = spr_machfreefall
        audio_sound_pitch(scr_soundeffect(sfx_pop), 1.5)
    }
    if (move != 0)
        movespeed = Approach(movespeed, (move * 4), 0.5)
    else
        movespeed = Approach(movespeed, 0, 0.1)
}

