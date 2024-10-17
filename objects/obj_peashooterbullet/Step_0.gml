hsp = (image_xscale * 6)
vsp = 0
grav = 0
depth = -1
if place_meeting_collision((x + sign(hsp)), (y + sign(vsp)))
    instance_destroy()
scr_collision()
