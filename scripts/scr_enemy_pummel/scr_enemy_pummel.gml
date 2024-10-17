function scr_enemy_pummel() //scr_enemy_pummel
{
    var _player = (grabbedby == 1 ? obj_player1.id : obj_player2.id)
    sprite_index = stunfallspr
    x = (_player.x + (_player.xscale * 16))
    y = _player.y
    image_xscale = (-_player.xscale)
    with (_player)
    {
        if (sprite_index == spr_idle)
        {
            if key_slap2
            {
                image_index = 0
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 464)
            }
        }
    }
}

