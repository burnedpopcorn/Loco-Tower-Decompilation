function scr_scareenemy() //scr_scareenemy
{
    if (obj_player1.x > (x - 400) && obj_player1.x < (x + 400) && y <= (obj_player1.y + 60) && y >= (obj_player1.y - 60))
    {
        if (state != 94 && state != 105 && state != 106 && obj_player1.state == 91)
        {
            if (irandom(100) <= 10)
                scr_soundeffect(choose(38, 39, 82))
            state = 94
            sprite_index = scaredspr
            if (x != obj_player1.x)
                image_xscale = (-(sign((x - obj_player1.x))))
            scaredbuffer = 100
            if (grounded && object_index != obj_zombiewater)
                vsp = -3
        }
    }
}

