if (room != rank_room)
{
    with (obj_camera)
        gateactivate = 0
    room_goto(targetRoom)
    with (obj_player1)
    {
        state = 61
        sprite_index = spr_walkfront
        image_index = 0
    }
    circlein = 0
    circleout = 1
}
else
{
    obj_player1.state = 0
    obj_player1.targetDoor = obj_player1.lastdoorhub
    obj_player1.targetRoom = obj_player1.lasthub
    with (instance_create(x, y, obj_fadeout))
    {
        targetDoor = obj_player1.targetDoor
        targetRoom = obj_player1.targetRoom
        fadealpha = 1
    }
    scr_playerreset()
    instance_destroy()
}
