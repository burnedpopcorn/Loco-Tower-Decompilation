if ((global.panic == 1 || global.snickchallenge == 1) && global.panicbg)
    scr_panicbg_init()
if instance_exists(obj_music)
{
    if global.lap3activate
        global.wave = global.maxwave
    else
        global.wave = (global.maxwave - global.fill)
}
else
    global.wave = (global.maxwave - global.fill)
application_surface_draw_enable(true)
if (room != rm_2point5test && room != hall_treasureV2)
{
    x = obj_player1.x
    y = obj_player1.y
    with (obj_camera)
    {
        shake_mag = 0
        shake_mag_acc = 0
    }
    camera_set_view_size(view_camera[0], prezoomx, prezoomy)
    camera_set_view_angle(view_camera[0], preangle)
}
