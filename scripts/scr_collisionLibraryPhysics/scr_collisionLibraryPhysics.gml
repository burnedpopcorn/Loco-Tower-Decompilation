function scr_collision_init()
{
    usesCollision = true;
    grounded = false;
    groundedSlope = false;
    terminalVelocity = 20;
    onMovingPlatform = -4;
    upsidedown = false;
    grav = 0;
    hsp = 0;
    vsp = 0;
    prevHsp = 0;
    prevVsp = 0;
}

function scr_collision()
{
    var _hspeed, _vspeed, true_hsp, true_vsp, move_hsp, move_vsp;
    
    grounded = false;
    groundedSlope = false;
    onMovingPlatform = -4;
    
    with (obj_movingPlatform)
    {
        _hspeed = x - xprevious;
        _vspeed = y - yprevious;
        
        with (other.id)
        {
            x += _hspeed;
            y += _vspeed;
            
            if (place_meeting_collision(x, y + 1, (-5 << 0)) && place_meeting(x, y + 1, other))
                onMovingPlatform = other.id;
            
            x -= _hspeed;
            y -= _vspeed;
        }
    }
    
    if (instance_exists(onMovingPlatform))
        kinematics_movingPlatforms(id, onMovingPlatform, true);
    
    true_hsp = hsp;
    true_vsp = vsp;
    hsp = (hsp > 0) ? floor(hsp) : ceil(hsp);
    vsp = (vsp > 0) ? floor(vsp) : ceil(vsp);
    move_hsp = clamp(abs(hsp), 0, bbox_right - bbox_left) * sign(hsp);
    
    repeat (abs(move_hsp))
    {
        y -= slope_check_up(x + sign(move_hsp), y);
        y += slope_check_down(x + sign(move_hsp), y);
        y += reverseSlope_check_down(x + sign(move_hsp), y);
        
        if (vsp <= 0 && place_meeting_collision(x, y - 1))
            y -= reverseSlope_check_up(x + sign(move_hsp), y);
        
        if (!place_meeting_collision(x + sign(move_hsp), y))
        {
            x += sign(move_hsp);
        }
        else
        {
            true_hsp = 0;
            move_hsp = 0;
            break;
        }
    }
    
    move_vsp = clamp(abs(vsp), 0, bbox_bottom - bbox_top) * sign(vsp);
    
    repeat (abs(move_vsp))
    {
        if (move_vsp < 0)
        {
            x -= slope_check_left(x, y + sign(move_vsp));
            x += slope_check_right(x, y + sign(move_vsp));
        }
        
        if (!place_meeting_collision(x, y + sign(move_vsp)))
        {
            y += sign(move_vsp);
        }
        else
        {
            true_vsp = 0;
            move_vsp = 0;
            break;
        }
    }
    
    hsp = true_hsp;
    vsp = true_vsp;
    
    if (vsp < terminalVelocity)
    {
        if (upsidedown)
        {
            if ((place_meeting(x, y, obj_water) || place_meeting(x, y, obj_waterunder) || place_meeting(x, y, obj_watercurrent)) && (grav - 0.3) >= 0)
                vsp -= (grav - 0.3);
            else
                vsp -= grav;
        }
        else if ((place_meeting(x, y, obj_water) || place_meeting(x, y, obj_waterunder) || place_meeting(x, y, obj_watercurrent)) && (grav - 0.3) >= 0)
        {
            vsp += (grav - 0.3);
        }
        else
        {
            vsp += grav;
        }
    }
    
    if (upsidedown)
    {
        grounded = place_meeting_collision(x, y - 1);
        groundedSlope = place_meeting_slope(x, y - 1);
    }
    else
    {
        grounded = place_meeting_collision(x, y + 1);
        groundedSlope = place_meeting_slope(x, y + 1);
    }
    
    prevHsp = hsp;
    prevVsp = vsp;
}

function kinematics_movingPlatforms(argument0, argument1, argument2 = true)
{
    var _hsp, _vsp;
    
    with (argument1)
    {
        _hsp = round(x - xprevious);
        _vsp = round(y - yprevious);
        
        if (!argument2)
        {
            with (argument0)
            {
                x += _hsp;
                y += _vsp;
            }
        }
        else
        {
            with (argument0)
            {
                repeat (abs(_hsp))
                {
                    if (!place_meeting_collision(x + sign(_hsp), y))
                    {
                        x += sign(_hsp);
                    }
                    else
                    {
                        _hsp = 0;
                        break;
                    }
                }
                
                repeat (abs(_vsp))
                {
                    if (!place_meeting_collision(x, y + sign(_vsp)))
                    {
                        y += sign(_vsp);
                    }
                    else
                    {
                        _vsp = 0;
                        break;
                    }
                }
            }
        }
    }
}

function slope_check_up(argument0, argument1, argument2 = 3)
{
    var i, _check, _z;
    
    for (i = argument2; i > 0; i--)
    {
        _check = true;
        _z = i - 1;
        
        repeat (i - 1)
        {
            if (!place_meeting_collision(argument0, argument1 - _z))
                _check = false;
            
            _z--;
        }
        
        if (place_meeting_collision(argument0, argument1) && _check && !place_meeting_collision(argument0, argument1 - i))
            return i;
    }
    
    return 0;
}

function slope_check_down(argument0, argument1, argument2 = 3)
{
    var i, _check, _z;
    
    for (i = 1; i < (argument2 + 1); i++)
    {
        _check = true;
        _z = 1;
        
        repeat (i)
        {
            if (place_meeting_collision(argument0, argument1 + _z))
                _check = false;
            
            _z++;
        }
        
        if (!place_meeting_collision(argument0, argument1) && _check && place_meeting_collision(argument0, argument1 + (i + 1)))
            return i;
    }
    
    return 0;
}

function slope_check_left(argument0, argument1, argument2 = 3)
{
    var i;
    
    for (i = 0; i < argument2; i++)
    {
        if (place_meeting_collision(argument0, argument1) && !place_meeting_collision(argument0 - i, argument1))
            return i;
    }
    
    return 0;
}

function slope_check_right(argument0, argument1, argument2 = 3)
{
    var i;
    
    for (i = 0; i < argument2; i++)
    {
        if (place_meeting_collision(argument0, argument1) && !place_meeting_collision(argument0 + i, argument1))
            return i;
    }
    
    return 0;
}

function reverseSlope_check_down(argument0, argument1, argument2 = 3)
{
    var i;
    
    for (i = 0; i < argument2; i++)
    {
        if (place_meeting_collision(argument0, argument1) && !place_meeting_collision(argument0, argument1 + i))
            return i;
    }
    
    return 0;
}

function reverseSlope_check_up(argument0, argument1, argument2 = 3)
{
    var i;
    
    for (i = 0; i < argument2; i++)
    {
        if (!place_meeting_collision(argument0, argument1) && !place_meeting_collision(argument0, argument1 - i) && place_meeting_collision(argument0, argument1 - (i + 1)))
            return i;
    }
    
    return 0;
}