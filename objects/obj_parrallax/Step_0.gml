var _cam_x, _cam_y;

_cam_x = camera_get_view_x(view_camera[0]);
_cam_y = camera_get_view_y(view_camera[0]);
layer_x("Backgrounds_1", floor((_cam_x * 0.25) + bg_1xoffset));
layer_y("Backgrounds_1", floor((_cam_y * 0.25) + bg_1yoffset));
layer_x("Backgrounds_2", floor((_cam_x * 0.15) + bg_2xoffset));
layer_y("Backgrounds_2", floor((_cam_y * 0.15) + bg_2yoffset));
layer_x("Backgrounds_3", floor(_cam_x * 0.05));
layer_y("Backgrounds_3", floor(_cam_y * 0.05));
layer_x("Backgrounds_Ground1", floor(_cam_x * 0.25));
layer_x("Backgrounds_Ground2", floor(_cam_x * 0.15));
layer_x("Backgrounds_sky", _cam_x);
layer_y("Backgrounds_sky", _cam_y);
layer_x("Backgrounds_sky1", _cam_x);
layer_y("Backgrounds_sky1", _cam_y);
layer_x("Backgrounds_skystill", floor(_cam_x * 0.75));
layer_y("Backgrounds_skystill", floor(_cam_y * 0.75));
layer_x("Backgrounds_skystill1", floor((_cam_x * 0.85) + bg_scrollskystill1x + bg_skystill1xoffest));
layer_y("Backgrounds_skystill1", floor((_cam_y * 0.85) + bg_scrollskystill1y + bg_skystill1yoffest));
layer_x("Backgrounds_sky2", _cam_x);
layer_y("Backgrounds_sky2", _cam_y);
layer_x("Backgrounds_sky3", floor(_cam_x * 0.75));
layer_y("Backgrounds_sky3", _cam_y);
layer_x("Backgrounds_sky4", floor((_cam_x * 0.65) + bg_sky4scrollx));
layer_y("Backgrounds_sky4", floor(_cam_y + bg_sky4scrolly));
layer_x("Backgrounds_sky5", floor(_cam_x * 0.55));
layer_y("Backgrounds_sky5", _cam_y);
layer_x("Backgrounds_sky2scroll", floor(bg_sky2xoffest + (_cam_x * 0.75) + bg_sky2x));
layer_y("Backgrounds_sky2scroll", floor(bg_sky2yoffest + (_cam_y * 0.75) + bg_sky2y));
layer_x("Backgrounds_sky3scroll", floor(bg_sky3xoffest + (_cam_x * 0.65) + bg_sky3x));
layer_y("Backgrounds_sky3scroll", floor(bg_sky3yoffest + (_cam_y * 0.65) + bg_sky3y));/*
layer_x("Backgrounds_still1", floor((bg_still1xoffset + _cam_x) - clamp(_cam_x * (0.15 * (960 / room_width)), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still1")))) - 960)));
layer_y("Backgrounds_still1", floor((bg_still1yoffset + _cam_y) - clamp(_cam_y * (0.15 * (540 / room_height)), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still1")))) - 540)));
layer_x("Backgrounds_still2", floor((bg_still2xoffset + _cam_x) - clamp(_cam_x * (0.25 * (960 / room_width)), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still2")))) - 960)));
layer_y("Backgrounds_still2", floor((bg_still2yoffset + _cam_y) - clamp(_cam_y * (0.25 * (540 / room_height)), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still2")))) - 540)));
layer_x("Backgrounds_stillscroll", floor((bg_still1xoffset + bg_scrollx + _cam_x) - clamp(_cam_x * (0.15 * (960 / room_width)), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillscroll")))) - 960)));
layer_y("Backgrounds_stillscroll", floor((bg_still1yoffset + bg_scrolly + _cam_y) - clamp(_cam_y * (0.15 * (540 / room_height)), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillscroll")))) - 540)));
layer_x("Backgrounds_stillH1", floor(bg_stillH1xoffset + (_cam_x * 0.25)));
layer_y("Backgrounds_stillH1", floor(bg_stillH1yoffset + (_cam_y - clamp(_cam_y * (0.15 * (540 / room_height)), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillH1")))) - 540))));
layer_x("Backgrounds_stillH2", floor(bg_stillH2xoffset + (_cam_x * 0.25)));
layer_y("Backgrounds_stillH2", floor(bg_stillH2yoffset + (_cam_y - clamp(_cam_y * (0.15 * (540 / room_height)), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillH2")))) - 540))));
*/layer_x("Backgrounds_scroll", floor((_cam_x * 0.25) + bg_scrollx + bg_scrollxoffset));
layer_y("Backgrounds_scroll", floor((_cam_y * 0.25) + bg_scrolly + bg_scrollyoffset));
bg_scrollx += layer_get_hspeed("Backgrounds_scroll");
bg_scrolly += layer_get_vspeed("Backgrounds_scroll");
bg_scrollx += layer_get_hspeed("Backgrounds_stillscroll");
bg_scrolly += layer_get_vspeed("Backgrounds_stillscroll");
bg_scrollskystill1x += layer_get_hspeed("Backgrounds_skystill1");
bg_scrollskystill1y += layer_get_vspeed("Backgrounds_skystill1");
layer_x("Backgrounds_scroll2", (_cam_x * 0.25) + bg_scroll2x + bg_scroll2xoffset);
layer_y("Backgrounds_scroll2", (_cam_y * 0.25) + bg_scroll2y + bg_scroll2yoffset);
bg_scroll2x += layer_get_hspeed("Backgrounds_scroll2");
bg_scroll2y += layer_get_vspeed("Backgrounds_scroll2");
bg_sky2x += layer_get_hspeed("Backgrounds_sky2scroll");
bg_sky2y += layer_get_vspeed("Backgrounds_sky2scroll");
bg_sky3x += layer_get_hspeed("Backgrounds_sky3scroll");
bg_sky3y += layer_get_vspeed("Backgrounds_sky3scroll");
bg_sky4scrollx += layer_get_hspeed("Backgrounds_sky4");
bg_sky4scrolly += layer_get_vspeed("Backgrounds_sky4");
bg_foreground1scrollx += layer_get_hspeed("Foreground_1");
bg_foreground1scrolly += layer_get_vspeed("Foreground_1");
bg_foregroundescapescrollx += layer_get_hspeed("Foreground_escape");
bg_foregroundescapescrolly += layer_get_vspeed("Foreground_escape");
layer_x("Foreground_1", (_cam_x * 0.35) + bg_foreground1scrollx);
layer_y("Foreground_1", (_cam_y * 0.35) + bg_foreground1scrolly);
layer_x("Foreground_escape", (_cam_x * -0.25) + bg_foregroundescapescrollx);
layer_y("Foreground_escape", (_cam_y * -0.25) + bg_foregroundescapescrolly);
layer_x("Foreground_Ground1", _cam_x * 0.15);
//layer_y("Foreground_Ground1", room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Foreground_Ground1")))));
/*
var _cam_x = camera_get_view_x(view_camera[0])
var _cam_y = camera_get_view_y(view_camera[0])
layer_x("Backgrounds_1", floor(((_cam_x * 0.25) + bg_1xoffset)))
layer_y("Backgrounds_1", floor(((_cam_y * 0.25) + bg_1yoffset)))
layer_x("Backgrounds_2", floor(((_cam_x * 0.15) + bg_2xoffset)))
layer_y("Backgrounds_2", floor(((_cam_y * 0.15) + bg_2yoffset)))
layer_x("Backgrounds_3", floor((_cam_x * 0.05)))
layer_y("Backgrounds_3", floor((_cam_y * 0.05)))
layer_x("Backgrounds_Ground1", floor((_cam_x * 0.25)))
layer_x("Backgrounds_Ground2", floor((_cam_x * 0.15)))
layer_x("Backgrounds_sky", _cam_x)
layer_y("Backgrounds_sky", _cam_y)
layer_x("Backgrounds_sky1", _cam_x)
layer_y("Backgrounds_sky1", _cam_y)
layer_x("Backgrounds_skystill", floor((_cam_x * 0.75)))
layer_y("Backgrounds_skystill", floor((_cam_y * 0.75)))
layer_x("Backgrounds_skystill1", floor((((_cam_x * 0.85) + bg_scrollskystill1x) + bg_skystill1xoffest)))
layer_y("Backgrounds_skystill1", floor((((_cam_y * 0.85) + bg_scrollskystill1y) + bg_skystill1yoffest)))
layer_x("Backgrounds_sky2", _cam_x)
layer_y("Backgrounds_sky2", _cam_y)
layer_x("Backgrounds_sky3", floor((_cam_x * 0.75)))
layer_y("Backgrounds_sky3", _cam_y)
layer_x("Backgrounds_sky4", floor(((_cam_x * 0.65) + bg_sky4scrollx)))
layer_y("Backgrounds_sky4", floor((_cam_y + bg_sky4scrolly)))
layer_x("Backgrounds_sky5", floor((_cam_x * 0.55)))
layer_y("Backgrounds_sky5", _cam_y)
layer_x("Backgrounds_sky2scroll", floor(((bg_sky2xoffest + (_cam_x * 0.75)) + bg_sky2x)))
layer_y("Backgrounds_sky2scroll", floor(((bg_sky2yoffest + (_cam_y * 0.75)) + bg_sky2y)))
layer_x("Backgrounds_sky3scroll", floor(((bg_sky3xoffest + (_cam_x * 0.65)) + bg_sky3x)))
layer_y("Backgrounds_sky3scroll", floor(((bg_sky3yoffest + (_cam_y * 0.65)) + bg_sky3y)))
layer_x("Backgrounds_still1", floor(((bg_still1xoffset + _cam_x) - clamp((_cam_x * (0.15 * (960 / room_width))), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still1")))) - 960)))))
layer_y("Backgrounds_still1", floor(((bg_still1yoffset + _cam_y) - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still1")))) - 540)))))
layer_x("Backgrounds_still2", floor(((bg_still2xoffset + _cam_x) - clamp((_cam_x * (0.25 * (960 / room_width))), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still2")))) - 960)))))
layer_y("Backgrounds_still2", floor(((bg_still2yoffset + _cam_y) - clamp((_cam_y * (0.25 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still2")))) - 540)))))
layer_x("Backgrounds_stillscroll", floor((((bg_still1xoffset + bg_scrollx) + _cam_x) - clamp((_cam_x * (0.15 * (960 / room_width))), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillscroll")))) - 960)))))
layer_y("Backgrounds_stillscroll", floor((((bg_still1yoffset + bg_scrolly) + _cam_y) - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillscroll")))) - 540)))))
layer_x("Backgrounds_stillH1", floor((bg_stillH1xoffset + (_cam_x * 0.25))))
layer_y("Backgrounds_stillH1", floor((bg_stillH1yoffset + (_cam_y - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillH1")))) - 540))))))
layer_x("Backgrounds_stillH2", floor((bg_stillH2xoffset + (_cam_x * 0.25))))
layer_y("Backgrounds_stillH2", floor((bg_stillH2yoffset + (_cam_y - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillH2")))) - 540))))))
layer_x("Backgrounds_scroll", floor((((_cam_x * 0.25) + bg_scrollx) + bg_scrollxoffset)))
layer_y("Backgrounds_scroll", floor((((_cam_y * 0.25) + bg_scrolly) + bg_scrollyoffset)))
bg_scrollx += layer_get_hspeed("Backgrounds_scroll")
bg_scrolly += layer_get_vspeed("Backgrounds_scroll")
bg_scrollx += layer_get_hspeed("Backgrounds_stillscroll")
bg_scrolly += layer_get_vspeed("Backgrounds_stillscroll")
bg_scrollskystill1x += layer_get_hspeed("Backgrounds_skystill1")
bg_scrollskystill1y += layer_get_vspeed("Backgrounds_skystill1")
layer_x("Backgrounds_scroll2", (((_cam_x * 0.25) + bg_scroll2x) + bg_scroll2xoffset))
layer_y("Backgrounds_scroll2", (((_cam_y * 0.25) + bg_scroll2y) + bg_scroll2yoffset))
bg_scroll2x += layer_get_hspeed("Backgrounds_scroll2")
bg_scroll2y += layer_get_vspeed("Backgrounds_scroll2")
bg_sky2x += layer_get_hspeed("Backgrounds_sky2scroll")
bg_sky2y += layer_get_vspeed("Backgrounds_sky2scroll")
bg_sky3x += layer_get_hspeed("Backgrounds_sky3scroll")
bg_sky3y += layer_get_vspeed("Backgrounds_sky3scroll")
bg_sky4scrollx += layer_get_hspeed("Backgrounds_sky4")
bg_sky4scrolly += layer_get_vspeed("Backgrounds_sky4")
bg_foreground1scrollx += layer_get_hspeed("Foreground_1")
bg_foreground1scrolly += layer_get_vspeed("Foreground_1")
bg_foregroundescapescrollx += layer_get_hspeed("Foreground_escape")
bg_foregroundescapescrolly += layer_get_vspeed("Foreground_escape")
layer_x("Foreground_1", ((_cam_x * 0.35) + bg_foreground1scrollx))
layer_y("Foreground_1", ((_cam_y * 0.35) + bg_foreground1scrolly))
layer_x("Foreground_escape", ((_cam_x * -0.25) + bg_foregroundescapescrollx))
layer_y("Foreground_escape", ((_cam_y * -0.25) + bg_foregroundescapescrolly))
layer_x("Foreground_Ground1", (_cam_x * 0.15))
layer_y("Foreground_Ground1", (room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Foreground_Ground1"))))))
