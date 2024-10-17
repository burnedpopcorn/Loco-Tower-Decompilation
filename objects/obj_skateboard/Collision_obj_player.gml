if (obj_player1.vsp > 0 && obj_player1.state != 44)
{
    instance_create(obj_player1.x, obj_player1.y, obj_genericpoofeffect)
    obj_player1.sprite_index = spr_playerN_mach
    obj_player1.state = 44
    obj_player1.xscale = image_xscale
    obj_player1.movespeed = 3
}
