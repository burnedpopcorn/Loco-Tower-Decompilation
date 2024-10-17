function scr_pizzagoblin_throw() //scr_pizzagoblin_throw
{
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0
        global.throw_frame[239] = 2
        global.throw_frame[243] = 6
        global.throw_frame[251] = 2
        global.throw_frame[252] = 2
        global.throw_frame[253] = 2
        global.throw_frame[244] = 2
        global.throw_frame[245] = 8
        global.throw_frame[237] = 6
        global.throw_frame[240] = 0
        global.throw_sprite = 0
        global.throw_sprite[239] = spr_pizzagoblin_throwbomb
        global.throw_sprite[243] = spr_cheeserobot_attack
        global.throw_sprite[251] = spr_spitcheese_spit
        global.throw_sprite[252] = spr_trash_throw
        global.throw_sprite[253] = spr_invtrash_throw
        global.throw_sprite[244] = spr_robot_attack
        global.throw_sprite[245] = spr_kentukykenny_throw
        global.throw_sprite[237] = spr_pizzard_shoot
        global.throw_sprite[240] = spr_pepgoblin_kick
        global.reset_timer = 0
        global.reset_timer[239] = 200
        global.reset_timer[243] = 200
        global.reset_timer[251] = 100
        global.reset_timer[252] = 100
        global.reset_timer[253] = 100
        global.reset_timer[244] = 200
        global.reset_timer[245] = 200
        global.reset_timer[237] = 100
        global.reset_timer[240] = 100
    }
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) == (image_number - 1))
        state = 102
    if (bombreset == 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(sfx_enemyprojectile)
        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    hsp = (other.image_xscale * 10)
                    vsp = -8
                }
                break
            case 243:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 8)
                    vsp = 0
                    grav = 0
                }
                break
            case 251:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -6
                }
                break
            case 252:
            case 253:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -4
                }
                break
            case 244:
                with (instance_create(x, y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 245:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale
                break
            case 237:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale
                break
            case 240:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
        }

    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
}

