radious = 17
surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
surface_set_target(surf)
draw_clear_alpha(c_black, 0)
surface_reset_target()
targetRoom = 0
circlein = 1
alarmuse = 0
circleout = 0
playerendedit = 0
depth = -99999
notagain = 0
scr_soundeffect(sfx_circlein)
