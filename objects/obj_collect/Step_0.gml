if (sprite_index == spr_shroomcollect || sprite_index == spr_sausagecollect)
    colorpalettesprite = 578
else if (sprite_index == spr_cheesecollect)
    colorpalettesprite = 238
else if (sprite_index == spr_tomatocollect)
    colorpalettesprite = 1656
else if (sprite_index == spr_pineapplecollect)
    colorpalettesprite = 1522
if (global.collectsound < 10)
    global.collectsound += 1
if (global.timeattack == 1)
    instance_destroy()
if (abs(distance_to_object(obj_player1)) < 25 && (!(place_meeting(x, y, obj_destructibles))) && (!(place_meeting(x, y, obj_iceblock))))
{
    if (!gotowardsplayer)
        scr_ghostcollectible()
    gotowardsplayer = 1
}
if (gotowardsplayer == 1)
{
    move_towards_point(obj_player1.x, obj_player1.y, movespeed)
    movespeed++
}
