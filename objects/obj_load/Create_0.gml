tex_list = -4
draw_flush()
group_arr = ["playergroup", "backgroundsgroup", "hudgroup", "baddiegroup", "Default", "tilesetgroup"]
tex_list = ds_list_create()
tex_pos = 0
for (var i = 0; i < array_length(group_arr); i++)
{
    var _tex_array = texturegroup_get_textures(group_arr[i])
    ds_list_add(tex_list, _tex_array)
}
tex_max = ds_list_size(tex_list)
alarm[0] = 70
window_set_size(960, 540)
surface_resize(application_surface, 960, 540)
camera_set_view_size(view_camera[0], 960, 540)
bg_surf = -4
