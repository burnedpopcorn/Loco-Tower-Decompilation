if (obj_player1.key_up2 && obj_player1.grounded && obj_player1.state == 0)
{
    if (obj_player1.paletteselect < 15)
        obj_player1.paletteselect += 1
    if (obj_player1.paletteselect >= 15)
        obj_player1.paletteselect = 0
}
