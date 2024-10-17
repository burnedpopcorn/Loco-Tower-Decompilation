function baddie_pummel() //baddie_pummel
{
    if (input_attack_buffer == 25 && sprite_index != spr_player_suplexmash1)
    {
        input_attack_buffer = 15
        if (sprite_index == spr_player_suplexmash5)
            sprite_index = spr_player_suplexmash1
        if (sprite_index == spr_player_suplexmash3)
            sprite_index = spr_player_suplexmash5
        var set_throw = sprite_index == spr_player_suplexmash1
        scr_soundeffect(sfx_killingblow)
        image_index = 0
        trace("Lungeattack2")
        with (obj_baddie)
        {
            var bID = id
            var p = other.id
            if lunged
            {
                lungeHP--
                flash = 1
                with (instance_create(bID.x, bID.y, obj_parryeffect))
                    sprite_index = spr_kungfueffect
                if bID.elite
                    bID.elitehit--
                state = 43
                image_xscale = (-obj_player1.xscale)
                if set_throw
                {
                    thrown = 1
                    linethrown = 1
                    lunge_throw = 1
                    lunged = 0
                    hsp = (image_xscale * -25)
                    hithsp = (image_xscale * -25)
                    vsp = 0
                    state = 106
                    obj_player1.vsp = -6
                }
                if (!bID.important)
                    global.combotime += 10
                with (obj_player1)
                {
                    lunge_hits++
                    var lag = 5
                    if set_throw
                        lag = 15
                    var redo_lunge = 0
                    if (bID.state == 120)
                        redo_lunge = 1
                    if redo_lunge
                        bID.state = 43
                }
                if set_throw
                    hithsp = (image_xscale * -25)
                hitX = (obj_player1.x + (obj_player1.xscale * 30))
                hitY = (obj_player1.y - 25)
            }
        }
    }
    return;
}

