switch state
{
    case 94:
        scr_enemy_idle()
        break
    case 95:
        scr_enemy_bounce()
        break
    case 106:
        scr_enemy_stun()
        break
    case 109:
        scr_enemy_grabbed()
        break
}

if (state == 106 && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != 106)
    birdcreated = 0
if (state == 94 && obj_player.x != x)
    image_xscale = sign((obj_player.x - x))
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != 109)
    depth = 0
if (state != 106)
    thrown = 0
