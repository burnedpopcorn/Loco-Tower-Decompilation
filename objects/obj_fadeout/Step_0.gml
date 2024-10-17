if instance_exists(obj_pausefadeout)
    instance_destroy(obj_pausefadeout)
if (fadealpha > 1)
{
    if instance_exists(obj_camera)
    {
        if (obj_camera.gatecamera == 1)
            obj_camera.gatecamera = 0
    }
    fadein = 1
    if instance_exists(obj_player)
    {
        with (obj_player)
        {
            if place_meeting(x, y, obj_goldendoor)
                game_restart()
        }
        if (titlecardthingy == 1)
        {
            if (!instance_exists(obj_titlecard))
            {
                with (instance_create(x, y, obj_titlecard))
                    music = other.levelmusic
            }
        }
        else if (room != obj_player1.targetRoom)
            room_goto(obj_player1.targetRoom)
        if (global.coop == 1)
        {
            if (room != obj_player2.targetRoom)
                room_goto(obj_player2.targetRoom)
        }
    }
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
if instance_exists(obj_player)
{
    with (obj_player1)
    {
        if ((other.fadein == 1 && (!other.titlecardthingy) && (obj_player1.state == 78 || obj_player1.state == 64) && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_elevator) || place_meeting(x, y, obj_geromedoor) || room == Titlescreen || place_meeting(x, y, obj_startgate))) || room == titlecard)
        {
            state = 61
            sprite_index = spr_walkfront
            image_index = 0
            if (global.coop == 1)
            {
                obj_player2.state = 61
                obj_player2.image_index = 0
            }
        }
        if (other.fadein == 1 && obj_player1.state == 78 && (obj_player1.sprite_index == spr_downpizzabox || obj_player1.sprite_index == spr_uppizzabox))
        {
            state = 67
            if (global.coop == 1)
                obj_player2.state = 67
        }
    }
    if instance_exists(obj_player2)
    {
        with (obj_player2)
        {
            if (other.fadein == 1 && (obj_player2.state == 78 || obj_player2.state == 64) && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
            {
                state = 61
                image_index = 0
                if (global.coop == 1)
                {
                    obj_player1.state = 61
                    obj_player1.image_index = 0
                }
            }
            if (other.fadein == 1 && obj_player2.state == 78 && (obj_player2.sprite_index == spr_downpizzabox || obj_player2.sprite_index == spr_uppizzabox))
            {
                state = 67
                if (global.coop == 1)
                    obj_player1.state = 67
            }
        }
    }
}
if (fadein == 1 && fadealpha < 0)
    instance_destroy()
