function scr_boss_grabbed() //scr_boss_grabbed
{
    var playerid = (grabbedby == 1 ? obj_player1.id : obj_player2.id)
    with (playerid)
    {
        if (state != 57 || baddiegrabbedID != other)
        {
            if (other.elitehit <= 1)
                other.destroyable = 1
            baddiegrabbedID = other.id
            movespeed = 4
            state = 57
            sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
            image_index = 0
        }
    }
    image_xscale = (-playerid.xscale)
    sprite_index = grabbedspr
    state = 106
    stunned = 200
    thrown = 1
    linethrown = 1
    var f = 15
    if (obj_player.tauntstoredstate == 91)
        f = 25
    if (abs(hithsp) > abs(hitvsp))
    {
        if (abs(hithsp) < f)
            hithsp = (sign(hithsp) * f)
    }
    else if (abs(hitvsp) < f)
        hitvsp = (sign(hitvsp) * f)
    vsp = hitvsp
    hsp = hithsp
}

