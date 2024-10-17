with (other.id)
{
    sprite_index = choose(spr_sausagecollect, spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_pineapplecollect)
    image_speed = 0.35
    global.collected = 0
    global.collectsound = 0
}
if (obj_player.character == "S")
    sprite_index = spr_snickcollectible1
depth = 11
gotowardsplayer = 0
movespeed = 5
colorpalettesprite = 238
colorpalette = random_range(0, 3)
