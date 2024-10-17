function ds_list_add_unique(argument0) //ds_list_add_unique
{
    if (argument_count > 1)
    {
        for (var i = 1; i < argument_count; i++)
        {
            b = argument[i]
            if (ds_list_find_index(argument0, b) == -1)
                ds_list_add(argument0, b)
        }
    }
    return;
}

function concat() //concat
{
    var _string = ""
    for (i = 0; i < argument_count; i++)
        _string += string(argument[i])
    return _string;
}

function vertex_add_point(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) //vertex_add_point
{
    var vbuffer = argument0
    var xx = argument1
    var yy = argument2
    var zz = argument3
    var nx = argument4
    var ny = argument5
    var nz = argument6
    var utex = argument7
    var vtex = argument8
    var color = argument9
    var alpha = argument10
    vertex_position_3d(vbuffer, xx, yy, zz)
    vertex_normal(vbuffer, nx, ny, nz)
    vertex_texcoord(vbuffer, utex, vtex)
    vertex_color(vbuffer, color, alpha)
}

function shakeboth(argument0) //shakeboth
{
    var shaking = argument0
    return random_range(shaking, (-shaking));
}

function heat_calculate(argument0) //heat_calculate
{
    trace(global.stylemultiplier)
    return (argument0 + round((argument0 * global.stylemultiplier)));
}

function draw_sprite_wave(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //draw_sprite_wave
{
    var sprite = argument0
    var image = argument1
    var X = argument2
    var Y = argument3
    var axis = argument4
    var wavelength = argument5
    var amplitude = argument6
    var phase = argument7
    var width = sprite_get_width(sprite)
    var height = sprite_get_height(sprite)
    var xoff = sprite_get_xoffset(sprite)
    var yoff = sprite_get_yoffset(sprite)
    if axis
        var size = height
    else
        size = width
    for (i = 0; i < size; i += 1)
    {
        var shift = (amplitude * sin(((2 * pi) * ((i / wavelength) + phase))))
        if axis
        {
            var sx = ((shift - xoff) + X)
            var sy = ((i - yoff) + Y)
            draw_sprite_part(sprite, image, 0, i, width, 1, sx, sy)
        }
        else
        {
            sx = ((i - xoff) + X)
            sy = ((shift - yoff) + Y)
            draw_sprite_part(sprite, image, i, 0, 1, height, sx, sy)
        }
    }
}

function camera_zoom(argument0, argument1) //camera_zoom
{
    with (obj_camera)
    {
        targetzoom = argument0
        targetzoom = clamp(targetzoom, 0, max_zoom)
        if (argument1 != undefined)
            zoomspd = abs(argument1)
    }
    return;
}

function camera_angle(argument0, argument1) //camera_angle
{
    with (obj_camera)
    {
        targetangle = argument0
        targetangle = clamp(targetangle, 0, max_angle)
        if (argument1 != undefined)
            anglespd = abs(argument1)
    }
    return;
}

function camera_set_zoom(argument0) //camera_set_zoom
{
    with (obj_camera)
        zoom = argument0
    return;
}

function Wave(argument0, argument1, argument2, argument3) //Wave
{
    var a4 = ((argument1 - argument0) * 0.5)
    return ((argument0 + a4) + (sin(((((current_time * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi))) * a4));
}

function point_in_camera(argument0, argument1, argument2) //point_in_camera
{
    var cam_x = camera_get_view_x(argument2)
    var cam_y = camera_get_view_y(argument2)
    var cam_w = camera_get_view_width(argument2)
    var cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

