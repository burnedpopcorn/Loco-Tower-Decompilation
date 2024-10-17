event_inherited()
ladderx = x
if (!instance_exists(obj_25Dcamera))
{
    if (depth == -32)
        depth = -7
}
if global.smoothcam
{
    with (obj_camera)
    {
        if (secretcam == 1)
        {
            player = obj_secretportalstart
            secretcam = 0
        }
        else if (secretcamexit == 1)
        {
            player = obj_player1.secretportalID
            secretcamexit = 0
        }
        else
            player = 148
        var target = player
        if (!instance_exists(target))
            target = 148
        var cam_width = camera_get_view_width(view_camera[0])
        var cam_height = camera_get_view_height(view_camera[0])
        var cam_x = camera_get_view_x(view_camera[0])
        var cam_y = camera_get_view_y(view_camera[0])
        cam_x = ((target.x - (cam_width / 2)) + chargecamera)
        cam_y = ((target.y - (cam_height / 2)) - 50)
        camera_set_view_pos(view_camera[0], cam_x, (cam_y + irandom_range((-shake_mag), shake_mag)))
    }
}
