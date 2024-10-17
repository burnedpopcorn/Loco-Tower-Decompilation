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
if (state == 94)
    attack--
if (attack <= 0 && state == 94)
{
    sprite_index = jumpprepspr
    image_index = 0
    state = 95
}
if (global.bosshealth == 5)
    helmet = 1
if (helmet == 0)
{
    idlespr = 27
    stunfallspr = 19
    walkspr = 23
    grabbedspr = 19
    jumpprepspr = 25
    jumpspr = 23
    landspr = 21
    airspr = 17
}
else
{
    idlespr = 14
    stunfallspr = 20
    walkspr = 28
    grabbedspr = 20
    jumpprepspr = 26
    jumpspr = 24
    landspr = 22
    airspr = 18
}
if (global.bosshealth <= 0)
    instance_destroy()
if (caughtplayer == 1 && (!grounded))
{
    obj_player.state = 72
    obj_player.image_index = 0
    obj_player.x = x
    obj_player.y = y
}
if (caughtplayer == 1 && grounded)
{
    obj_player.state = 15
    if (obj_player.sprite_index != spr_boxxedpep_intro)
    {
        obj_player.sprite_index = spr_boxxedpep_intro
        scr_sound(sfx_explosion)
    }
    obj_player.image_index = 0
    obj_player.hsp = 0
    obj_player.vsp = 0
    obj_player.x = x
    obj_player.y = (y - 20)
    caughtplayer = 0
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != 109)
    depth = 0
scr_collide()
if (state != 106)
    thrown = 0
