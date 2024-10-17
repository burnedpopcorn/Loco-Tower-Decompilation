with (obj_player1)
{
    if (room == rank_room && global.coop == 0)
    {
        obj_player1.x = 480
        obj_player1.y = 270
        other.yp = lerp(other.yp, 0, 0.07)
    }
}
if (instance_exists(obj_player2) && global.coop == 1)
{
    if (room == rank_room)
    {
        obj_player1.x = 380
        obj_player1.y = 270
        obj_player2.x = 580
        obj_player2.y = 270
    }
}
if (fadealpha > 1 && stop == 0)
{
    if (room != Tutori_1)
    {
        fadein = 1
        if (room != rank_room)
            room = rank_room
    }
    else if (tutorialfinal == 0)
    {
        tutorialfinal = 1
        alarm[1] = 200
    }
}
if (room != Tutori_1)
{
    var audiotrack = audio_sound_get_track_position(rankmu)
    if (audiotrack >= 3.44 && (!instance_exists(obj_rank)))
        instance_create((room_width / 2), (room_height / 2), obj_rank)
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
if (fadein == 1 && fadealpha < 0 && room != rank_room)
    instance_destroy()
