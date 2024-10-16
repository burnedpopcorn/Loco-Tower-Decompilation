switch state
{
    case 94:
        scr_enemy_idle()
        break
    case 96:
        scr_enemy_charge()
        break
    case 98:
        scr_enemy_turn()
        break
    case 102:
        scr_enemy_walk()
        break
    case 104:
        scr_enemy_land()
        break
    case 105:
        scr_enemy_hit()
        break
    case 106:
        scr_enemy_stun()
        break
    case 97:
        scr_pizzagoblin_throw()
        break
    case 109:
        scr_enemy_grabbed()
        break
}

if (state == 106 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != 106)
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != 109)
    depth = 0
if (state != 106)
    thrown = 0
scr_scareenemy()
if (bombreset > 0)
    bombreset--
if (x != obj_player1.x && state != 97 && obj_player1.state != 2 && obj_player1.state != 119 && bombreset == 0 && grounded)
{
    if (obj_player1.x > (x - 80) && obj_player1.x < (x + 80) && y <= (obj_player1.y + 100) && y >= (obj_player1.y - 100))
    {
        if (state == 102)
        {
            if (!(global.laps >= 5))
            {
                image_index = 0
                sprite_index = spr_pepgoblin_kick
                image_xscale = (-(sign((x - obj_player1.x))))
                state = 97
            }
            else
            {
                image_index = 0
                sprite_index = spr_pepgoblin_kick
                image_xscale = (-(sign((x - obj_player1.x))))
                flash = 1
                alarm[4] = 5
                state = 97
            }
        }
    }
}
if (grounded && state == 97 && floor(image_index) == 3)
    vsp = -5
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
