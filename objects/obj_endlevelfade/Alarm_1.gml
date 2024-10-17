fadein = 1
if (room != hub_tutorial)
    room = hub_tutorial
stop = 1
scr_playerreset()
obj_player1.state = 61
obj_player1.sprite_index = obj_player1.spr_walkfront
obj_player1.image_index = 0
obj_player1.targetDoor = "E"
obj_player1.visible = true
