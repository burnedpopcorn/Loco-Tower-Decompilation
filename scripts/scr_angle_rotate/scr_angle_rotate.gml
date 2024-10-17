function scr_angle_rotate() //scr_angle_rotate
{
    if (state == 70 || state == 91 || state == 44 || state == 71 || state == 114 || state == 22 || (state == 2 && sprite_index != spr_player_machroll && sprite_index != spr_player_backslideland && sprite_index != spr_player_backslide && global.anglerotation))
    {
        if (grounded && (!(place_meeting(x, (y + 1), obj_solid))))
        {
            if scr_slope()
            {
                var Slope = instance_place(x, (y + 1), obj_slope)
                var SlopeXscale = abs(Slope.image_xscale)
                var SlopeYscale = (abs(Slope.image_yscale) / 1.5)
                var targetAngle = ((50 / (SlopeXscale / SlopeYscale)) * (sign(Slope.image_xscale) / sign(Slope.image_yscale)))
                angle = lerp(angle, targetAngle, 0.7)
            }
            else
                angle = lerp(angle, 0, 0.7)
        }
        else
            angle = lerp(angle, 0, 0.7)
    }
    else
        angle = lerp(angle, 0, 0.7)
}

