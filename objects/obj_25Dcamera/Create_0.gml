camera = view_camera[0]
chargecamera = 0
camDist = -350
camFov = 80
camAsp = (camera_get_view_width(camera) / camera_get_view_height(camera))
gpu_set_ztestenable(1)
gpu_set_alphatestenable(1)
gpu_set_texrepeat(1)
if instance_exists(obj_baddie)
{
    with (obj_baddie)
        depth = -32
}
if instance_exists(obj_player)
{
    with (obj_player)
        depth = -32
}
