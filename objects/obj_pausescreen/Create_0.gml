depth = -520
view_hview[(0 << 0)] = camera_get_view_height(view_camera[0])
view_wview[(0 << 0)] = camera_get_view_width(view_camera[0])
view_xview[(0 << 0)] = camera_get_view_x(view_camera[0])
view_yview[(0 << 0)] = camera_get_view_y(view_camera[0])
vspeedsprite = 0
sPauseGUI = -4
scalepause = 1
sPause = sprite_create_from_surface(application_surface, 0, 0, window_get_width(), window_get_height(), false, false, 480, 270)
surf = surface_create(display_get_gui_width(), display_get_gui_height())
surface_set_target(surf)
var objects = [151, 32, 154, 84, 7, 98, 102, 10, 65, 35]
for (var i = 0; i < array_length(objects); i++)
{
    with (objects[i])
    {
        if visible
        {
            event_perform(ev_draw, ev_gui_begin)
            event_perform(ev_draw, ev_gui)
            event_perform(ev_draw, ev_gui_end)
        }
    }
}
surface_reset_target()
sPauseGUI = sprite_create_from_surface(surf, 0, 0, window_get_width(), window_get_height(), false, false, 480, 270)
