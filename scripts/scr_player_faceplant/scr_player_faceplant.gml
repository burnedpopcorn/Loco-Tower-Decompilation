function scr_player_faceplant() //scr_player_faceplant
{
    hsp = (xscale * movespeed)
    move = (key_right + key_left)
    image_speed = 0.5
    if key_slap2
        input_buffer_slap = 0
    if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        var _hitwall = ledge_bump((vsp >= 0 ? 32 : 22))
        if _hitwall
        {
            sprite_index = spr_hitwall
            scr_soundeffect(sfx_groundpound)
            scr_soundeffect(sfx_bumpwall)
            with (obj_camera)
            {
                shake_mag = 20
                shake_mag_acc = (40 / room_speed)
            }
            hsp = 0
            image_speed = 0.35
            with (obj_baddie)
            {
                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
                {
                    stun = 1
                    alarm[0] = 200
                    ministun = 0
                    vsp = -5
                    hsp = 0
                }
            }
            flash = 0
            state = 72
            hsp = -4.5
            vsp = -6
            mach2 = 0
            image_index = 0
            instance_create((x + 10), (y + 10), obj_bumpeffect)
        }
    }
    if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        _hitwall = ledge_bump((vsp >= 0 ? 32 : 22))
        if _hitwall
        {
            sprite_index = spr_hitwall
            scr_soundeffect(sfx_groundpound)
            scr_soundeffect(sfx_bumpwall)
            with (obj_camera)
            {
                shake_mag = 20
                shake_mag_acc = (40 / room_speed)
            }
            hsp = 0
            image_speed = 0.35
            with (obj_baddie)
            {
                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
                {
                    stun = 1
                    alarm[0] = 200
                    ministun = 0
                    vsp = -5
                    hsp = 0
                }
            }
            flash = 0
            state = 72
            hsp = 4.5
            vsp = -6
            mach2 = 0
            image_index = 0
            instance_create((x - 10), (y + 10), obj_bumpeffect)
        }
    }
    if (floor(image_index) == (image_number - 1) && (!key_attack) && input_buffer_slap >= 8)
        state = (0 << 0)
    else if (floor(image_index) == (image_number - 1) && key_attack)
    {
        image_speed = 0.35
        state = 91
        sprite_index = spr_mach4
        grav = 0.5
    }
    else if (floor(image_index) == (image_number - 1) && (!key_attack) && input_buffer_slap < 8)
        image_index = 0
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
}

