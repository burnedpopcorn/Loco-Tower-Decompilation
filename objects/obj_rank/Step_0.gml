scr_getinput()
if (floor(image_index) == (image_number - 1))
    image_speed = 0
if (global.rank == "p" || global.rank == "s" || global.rank == "a")
    afterrankmusic = mu_arankl
if (global.rank == "b" || global.rank == "c" || global.rank == "d")
    afterrankmusic = mu_arankc
if ((!audio_is_playing(obj_endlevelfade.rankmu)) && (!instance_exists(obj_fadeout)))
{
    if (!audio_is_playing(afterrankmusicid))
        afterrankmusicid = scr_soundeffect(afterrankmusic)
}
if audio_is_playing(afterrankmusicid)
{
    audio_sound_gain(afterrankmusicid, levelvolume, 2000)
    brown = 1
    yOff = lerp(yOff, 0, 0.07)
    var _audiotrack = audio_sound_get_track_position(afterrankmusicid)
    if (_audiotrack >= 15.41)
        audio_sound_set_track_position(afterrankmusicid, 8.6)
}
if (global.collect >= global.collectN)
{
    if (obj_player1.character == "P")
    {
        if (global.rank == "p")
            sprite_index = spr_rankP
        if (global.rank == "s")
            sprite_index = spr_rankS
        if (global.rank == "a")
            sprite_index = spr_rankA
        if (global.rank == "b")
            sprite_index = spr_rankB
        if (global.rank == "c")
            sprite_index = spr_rankC
        if (global.rank == "d")
            sprite_index = spr_rankD
    }
    else
    {
        if (global.rank == "s")
            sprite_index = spr_rankNS
        if (global.rank == "a")
            sprite_index = spr_rankNA
        if (global.rank == "b")
            sprite_index = spr_rankNB
        if (global.rank == "c")
            sprite_index = spr_rankNC
        if (global.rank == "d")
            sprite_index = spr_rankND
    }
}
if (global.collectN > global.collect)
{
    if (obj_player2.character == "P")
    {
        if (global.rank == "s")
            sprite_index = spr_rankS
        if (global.rank == "a")
            sprite_index = spr_rankA
        if (global.rank == "b")
            sprite_index = spr_rankB
        if (global.rank == "c")
            sprite_index = spr_rankC
        if (global.rank == "d")
            sprite_index = spr_rankD
    }
    else
    {
        if (global.rank == "s")
            sprite_index = spr_rankNS
        if (global.rank == "a")
            sprite_index = spr_rankNA
        if (global.rank == "b")
            sprite_index = spr_rankNB
        if (global.rank == "c")
            sprite_index = spr_rankNC
        if (global.rank == "d")
            sprite_index = spr_rankND
    }
}
if brown
{
    if (key_jump2 && (!instance_exists(obj_fadecircle)))
    {
        instance_create(x, y, obj_fadecircle)
        levelvolume = 0
    }
}
toppin_has[0] = global.shroomfollow
toppin_has[1] = global.cheesefollow
toppin_has[2] = global.tomatofollow
toppin_has[3] = global.sausagefollow
toppin_has[4] = global.pineapplefollow
if brown
    brownfade = Approach(brownfade, 1, 0.07)
