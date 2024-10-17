instance_create((x + (obj_player1.xscale * 40)), y, obj_punchdust)
with (obj_player)
{
    if (state == 22)
    {
        image_index = 0
        sprite_index = spr_player_haulingstart
        if (other.heavy == 1)
            heavy = 1
        else
            heavy = 0
        state = 46
    }
}
if (obj_player.state != 117)
{
    state = 109
    instance_destroy(other.id)
}
else
{
    global.combotime = 60
    instance_destroy()
}
