function scr_player_Sjump() //scr_player_Sjump
{
    hsp = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    move = (key_left + key_right)
    if (sprite_index == spr_superjump || sprite_index == spr_player_presentbox)
        vsp = sjumpvsp
    sjumpvsp -= 0.1
    if (sprite_index == spr_player_supersidejump)
    {
        if (a < 25)
            a++
        hsp = (xscale * a)
        vsp = 0
    }
    if ((sprite_index == spr_superjump || sprite_index == spr_player_presentbox) && (!instance_exists(crazyruneffectid)))
    {
        with (instance_create(x, (y - 4), obj_crazyrunothereffect))
        {
            playerid = other.object_index
            image_angle = 90
            other.crazyruneffectid = id
        }
    }
    if ((place_meeting_solid(x, (y - 1)) || place_meeting_platform(x, (y - 1))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(place_meeting_slope((x - sign(hsp)), y))) && (!(place_meeting_slope((x + sign(hsp)), y))))
    {
        var _cancollide = 1
        if place_meeting_platform(x, (y - 1))
        {
            with (instance_place(x, (y - 1), obj_platform))
            {
                if (image_yscale != -1)
                {
                    with (other)
                        _cancollide = 0
                }
            }
        }
        if (_cancollide == 1)
        {
            a = 0
            if (sprite_index == spr_player_supersidejump)
                sprite_index = spr_player_supersidejumpland
            if (sprite_index == spr_superjump)
                sprite_index = spr_superjumpland
            if (sprite_index == spr_player_presentbox)
                sprite_index = spr_superjumpland
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            with (obj_baddie)
            {
                if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), (__view_get(0, 0) + __view_get(2, 0)), (__view_get(1, 0) + __view_get(3, 0)))
                {
                    image_index = 0
                    if grounded
                        vsp = -7
                }
            }
            scr_soundeffect(sfx_groundpound)
            image_index = 0
            state = 93
            machhitAnim = 0
        }
    }
    else if ((key_slap2 || key_attack2) && sprite_index != spr_player_presentbox && sprite_index != spr_player_Sjumpcancelstart)
    {
        if (move != 0)
            xscale = move
        audio_sound_pitch(scr_soundeffect(sfx_superjumpcancel), 1.5)
        image_index = 0
        sprite_index = spr_player_Sjumpcancelstart
    }
    if (sprite_index == spr_player_Sjumpcancelstart)
    {
        vsp = 0
        if (move != 0)
            xscale = move
        if (floor(image_index) == (image_number - 1))
        {
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale
            scr_soundeffect(sfx_suplexdash)
            state = 91
            vsp = -5
            movespeed = 12
            image_index = 0
            sprite_index = spr_player_Sjumpcancel
            jumpstop = 1
            flash = 1
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale
        }
    }
    image_speed = 0.5
    scr_collision()
}

