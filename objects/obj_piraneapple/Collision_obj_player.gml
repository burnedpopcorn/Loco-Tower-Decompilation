with (obj_player)
{
    if (state != 73 && hurted == 0 && cutscene == 0 && state != 72 && state != 91 && state != 22)
        scr_hurtplayer(self)
}
if (obj_player.state == 91 || obj_player.state == 22)
    instance_destroy()
