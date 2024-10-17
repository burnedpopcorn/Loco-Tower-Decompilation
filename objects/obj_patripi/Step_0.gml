if (room == timesuproom || room == rank_room)
    instance_destroy()
if (!stunned)
{
    var distancefromplayer = point_distance(x, y, obj_player1.x, obj_player1.y)
    targetangle = point_direction(x, y, obj_player1.x, obj_player1.y)
    if (obj_player1.state != 54)
    {
        if (lockon <= 0)
            moveangle += (angleadjustspeed * sign(angle_difference(targetangle, moveangle)))
        if (lockon > 0)
            lockon--
        if point_in_triangle(obj_player1.x, obj_player1.y, x, y, (x + lengthdir_x((distancefromplayer + 64), (moveangle + 10))), (y + lengthdir_y((distancefromplayer + 64), (moveangle + 10))), (x + lengthdir_x((distancefromplayer + 64), (moveangle - 10))), (y + lengthdir_y((distancefromplayer + 64), (moveangle - 10))))
        {
            if (lockon <= 0)
                moveangle = targetangle
            lockon = 15
            targetspeed = movespeedcharge
        }
        else if (lockon <= 0)
            targetspeed = movespeednormal
    }
    else
        targetspeed = 0
    movespeed = median((movespeed - speedadjustspeed), targetspeed, (movespeed + speedadjustspeed))
    direction = moveangle
    speed = movespeed
    if (obj_player1.x > (x - 200) && obj_player1.x < (x + 200) && y <= (obj_player1.y + 200) && y >= (obj_player1.y - 200))
        sprite_index = spr_patripi_near
    else
        sprite_index = spr_patripi_idle
    if (x != obj_player1.x)
        image_xscale = (-(sign((x - obj_player1.x))))
    if place_meeting(x, y, obj_player1)
    {
        if (obj_player1.instakillmove == 1 || obj_player1.state == 22)
        {
            repeat (6)
            {
                with (instance_create((x + random_range(-100, 100)), (y + random_range(-100, 100)), obj_balloonpop))
                    sprite_index = spr_shotgunimpact
            }
            scr_soundeffect(sfx_punch)
            scr_soundeffect(sfx_patripihurt)
            stunned = 1
            sprite_index = spr_patripi_hurt
            image_index = 0
            hsp = (obj_player1.xscale * (obj_player1.movespeed / 2))
            vsp = (obj_player1.vsp - 5)
        }
        else
        {
            scr_hurtplayer(obj_player1)
            repeat (6)
            {
                with (instance_create((x + random_range(-100, 100)), (y + random_range(-100, 100)), obj_balloonpop))
                    sprite_index = spr_shotgunimpact
            }
            x = (room_width / 2)
            y = -100
        }
    }
}
else
{
    x += hsp
    y += vsp
    if (sprite_index == spr_patripi_hurt && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_patripi_idle
        stunned = 0
    }
}
