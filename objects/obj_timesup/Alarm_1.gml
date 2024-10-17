scr_playerreset()
obj_player1.state = 110
obj_player1.visible = false
obj_player1.targetDoor = obj_player1.lastdoorhub
obj_player1.targetRoom = obj_player1.lasthub
with (instance_create(x, y, obj_fadeout))
{
    targetDoor = obj_player1.targetDoor
    targetRoom = obj_player1.targetRoom
}
