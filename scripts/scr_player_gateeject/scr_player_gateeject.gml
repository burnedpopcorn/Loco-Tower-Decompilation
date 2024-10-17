function scr_player_gateeject() //scr_player_gateeject
{
    if (sprite_index != spr_hurt)
    {
        cutscene = 1
        vsp = 0
        hsp = 0
        movespeed = 0
    }
    else
    {
        image_speed = 0.5
        if grounded
        {
            switch bounce
            {
                case 0:
                    vsp = -12
                    bounce = 1
                    scr_soundeffect(sfx_bumpwall)
                    break
                case 1:
                    vsp = -9
                    bounce = 2
                    scr_soundeffect(sfx_bumpwall)
                    break
                case 2:
                    state = (0 << 0)
                    bounce = 0
                    scr_soundeffect(sfx_bumpwall)
                    break
            }

        }
    }
}

