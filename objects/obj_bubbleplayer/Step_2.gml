x = playerid.x
y = playerid.y
mask_index = playerid.mask_index
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    visible = false
else
    visible = playerid.visible
if (playerid.state != 116)
    instance_destroy()
