global.MyCollisionList = ds_list_create();

function place_meeting_collision(argument0, argument1, argument2 = (0 << 0))
{
    var check_slopes, check_solids, check_platforms, check_moving;
    
    check_slopes = ((1 << 0) & argument2) != (1 << 0);
    check_solids = ((2 << 0) & argument2) != (2 << 0);
    check_platforms = ((8 << 0) & argument2) != (8 << 0);
    check_moving = ((4 << 0) & argument2) != (4 << 0);
    
    if (check_solids)
    {
        if (place_meeting_solid(argument0, argument1))
            return true;
        
        if (place_meeting_slopeSolid(argument0, argument1))
            return true;
    }
    
    if (check_slopes)
    {
        if (check_solids)
        {
            if (place_meeting_slope(argument0, argument1, false))
                return true;
        }
        
        if (check_platforms)
        {
            if (place_meeting_slopePlatform(argument0, argument1))
                return true;
        }
    }
    
    if (check_platforms)
    {
        if (place_meeting_platform(argument0, argument1))
            return true;
        
        if (place_meeting_sidePlatform(argument0, argument1))
            return true;
    }
    
    if (check_moving)
    {
        if (place_meeting_movingPlatform(argument0, argument1))
            return true;
    }
    
    return false;
}

function instance_place_list_collision(argument0, argument1, argument2 = undefined, argument3 = (0 << 0))
{
    var collided, check_slopes, check_solids, check_platforms, check_moving;
    
    collided = 0;
    check_slopes = ((1 << 0) & argument3) != (1 << 0);
    check_solids = ((2 << 0) & argument3) != (2 << 0);
    check_platforms = ((8 << 0) & argument3) != (8 << 0);
    check_moving = ((4 << 0) & argument3) != (4 << 0);
    
    if (check_solids)
        collided += instance_place_list_solid(argument0, argument1, argument2);
    
    if (check_slopes)
    {
        if (check_solids)
            collided += instance_place_list_slope(argument0, argument1, argument2);
        
        if (check_platforms)
            collided += instance_place_list_slopePlatform(argument0, argument1, argument2);
    }
    
    if (check_platforms)
    {
        collided += instance_place_list_platform(argument0, argument1, argument2);
        collided += instance_place_list_sidePlatform(argument0, argument1, argument2);
    }
    
    if (check_moving)
        collided += instance_place_list_movingPlatform(argument0, argument1, argument2);
    
    return collided;
}

function instance_place_list_solid(argument0, argument1, argument2 = undefined)
{
    var solid_number, collided, i, solid_object, _can_collide;
    
    if (place_meeting(argument0, argument1, obj_solid))
    {
        solid_number = instance_place_list(argument0, argument1, 138, global.MyCollisionList, false);
        collided = 0;
        
        if (solid_number > 0)
        {
            for (i = 0; i < solid_number; i++)
            {
                solid_object = ds_list_find_value(global.MyCollisionList, i);
                _can_collide = true;
                
                if (variable_instance_exists(solid_object, "canCollide"))
                    _can_collide = solid_object.canCollide(object_index);
                
                if (_can_collide == true)
                {
                    collided++;
                    
                    if (!is_undefined(argument2))
                        ds_list_add(argument2, solid_object.id);
                    else
                        break;
                }
            }
        }
        
        ds_list_clear(global.MyCollisionList);
        
        if (collided > 0)
            return collided;
    }
    
    return 0;
}

function place_meeting_solid(argument0, argument1)
{
    return instance_place_list_solid(argument0, argument1) > 0;
}

function instance_place_list_platform(argument0, argument1, argument2 = undefined)
{
    var collided, platform_number, i, platform_object, _can_collide, _check;
    
    collided = 0;
    
    if (place_meeting(argument0, argument1, obj_platform))
    {
        platform_number = instance_place_list(argument0, argument1, 271, global.MyCollisionList, false);
        
        if (platform_number > 0)
        {
            for (i = 0; i < platform_number; i++)
            {
                platform_object = ds_list_find_value(global.MyCollisionList, i);
                _can_collide = true;
                
                if (variable_instance_exists(platform_object, "canCollide"))
                    _can_collide = platform_object.canCollide(object_index);
                
                _check = (sign(platform_object.image_yscale) <= -1) ? (argument1 <= y) : (argument1 > y);
                
                if (object_index == obj_player)
                {
                    if (_check == true && _can_collide && place_meeting(argument0, argument1, platform_object) && !place_meeting(argument0, y, platform_object))
                    {
                        collided++;
                        
                        if (!is_undefined(argument2))
                            ds_list_add(argument2, platform_object.id);
                        else
                            break;
                    }
                }
                else if (_check == true && _can_collide && place_meeting(argument0, argument1, platform_object) && !place_meeting(argument0, y, platform_object) && platform_object != 318 && platform_object != 93)
                {
                    collided++;
                    
                    if (!is_undefined(argument2))
                        ds_list_add(argument2, platform_object.id);
                    else
                        break;
                }
            }
        }
        
        ds_list_clear(global.MyCollisionList);
        
        if (collided > 0)
            return collided;
    }
    
    return 0;
}

function instance_place_list_sidePlatform(argument0, argument1, argument2 = undefined)
{
    var collided, side_platform_number, i, side_platform_object, _can_collide, _check;
    
    collided = 0;
    
    if (place_meeting(argument0, argument1, obj_sidePlatform))
    {
        side_platform_number = instance_place_list(argument0, argument1, 312, global.MyCollisionList, false);
        
        if (side_platform_number > 0)
        {
            for (i = 0; i < side_platform_number; i++)
            {
                side_platform_object = ds_list_find_value(global.MyCollisionList, i);
                _can_collide = true;
                
                if (variable_instance_exists(side_platform_object, "canCollide"))
                    _can_collide = side_platform_object.canCollide(object_index);
                
                _check = (sign(side_platform_object.image_xscale) < 0) ? (argument0 >= x) : (argument0 <= x);
                
                if (_check == true && _can_collide && place_meeting(argument0, argument1, side_platform_object) && !place_meeting(x, argument1, side_platform_object))
                {
                    collided++;
                    
                    if (!is_undefined(argument2))
                        ds_list_add(argument2, side_platform_object.id);
                    else
                        break;
                }
            }
        }
        
        ds_list_clear(global.MyCollisionList);
        
        if (collided > 0)
            return collided;
    }
    
    return 0;
}

function place_meeting_platform(argument0, argument1)
{
    return instance_place_list_platform(argument0, argument1) > 0;
}

function place_meeting_sidePlatform(argument0, argument1)
{
    return instance_place_list_sidePlatform(argument0, argument1) > 0;
}

function instance_place_list_movingPlatform(argument0, argument1, argument2 = undefined)
{
    var collided, movingplatform_number, i, movingplatform_object, _can_collide, _check;
    
    collided = 0;
    
    if (place_meeting(argument0, argument1, obj_movingPlatform))
    {
        movingplatform_number = instance_place_list(argument0, argument1, 66, global.MyCollisionList, false);
        
        if (movingplatform_number > 0)
        {
            for (i = 0; i < movingplatform_number; i++)
            {
                movingplatform_object = ds_list_find_value(global.MyCollisionList, i);
                _can_collide = true;
                
                if (variable_instance_exists(movingplatform_object, "canCollide"))
                    _can_collide = movingplatform_object.canCollide(object_index);
                
                _check = (sign(movingplatform_object.image_yscale) <= -1) ? (argument1 <= y) : (argument1 > y);
                
                if (_check == true && _can_collide && place_meeting(argument0, argument1, movingplatform_object) && !place_meeting(argument0, y, movingplatform_object))
                {
                    collided++;
                    
                    if (!is_undefined(argument2))
                        ds_list_add(argument2, movingplatform_object.id);
                    else
                        break;
                }
            }
        }
        
        ds_list_clear(global.MyCollisionList);
        
        if (collided > 0)
            return collided;
    }
    
    return 0;
}

function place_meeting_movingPlatform(argument0, argument1)
{
    return instance_place_list_movingPlatform(argument0, argument1) > 0;
}

function instance_place_list_slopePlatform(argument0, argument1, argument2 = undefined)
{
    var old_x, old_y, old_bbox_top, old_bbox_bottom, collided, slopeplatform_number, i, slopeplatform_object, _can_collide, object_side, player_pos, _check1, _check2, _check3;
    
    old_x = x;
    old_y = y;
    old_bbox_top = bbox_top;
    old_bbox_bottom = bbox_bottom;
    x = argument0;
    y = argument1;
    collided = 0;
    
    if (place_meeting(x, y, obj_slopePlatform))
    {
        slopeplatform_number = instance_place_list(x, y, 77, global.MyCollisionList, false);
        
        if (slopeplatform_number > 0)
        {
            for (i = 0; i < slopeplatform_number; i++)
            {
                slopeplatform_object = ds_list_find_value(global.MyCollisionList, i);
                _can_collide = true;
                
                if (variable_instance_exists(slopeplatform_object, "canCollide"))
                    _can_collide = slopeplatform_object.canCollide(object_index);
                
                if (_can_collide)
                {
                    object_side = (slopeplatform_object.image_xscale > 0) ? bbox_right : bbox_left;
                    object_side = (object_side - x) + old_x;
                    player_pos = point_direction(slopeplatform_object.x + slopeplatform_object.sprite_width, slopeplatform_object.y + slopeplatform_object.sprite_height, x, y);
                    
                    if (slopeplatform_object.image_yscale > 0)
                        _check1 = (slopeplatform_object.image_xscale > 0) ? (player_pos <= 180 && player_pos >= 90) : (player_pos <= 90 && player_pos >= 0);
                    else
                        _check1 = (slopeplatform_object.image_xscale > 0) ? (player_pos <= 270 && player_pos >= 180) : ((player_pos <= 360 || player_pos <= 0) && player_pos >= 270);
                    
                    _check2 = !triangle_meeting(old_x, old_y, slopeplatform_object.x, slopeplatform_object.y + slopeplatform_object.sprite_height, slopeplatform_object.x + slopeplatform_object.sprite_width, slopeplatform_object.y, slopeplatform_object.x + slopeplatform_object.sprite_width, slopeplatform_object.y + slopeplatform_object.sprite_height);
                    _check3 = (slopeplatform_object.image_xscale > 0) ? (object_side <= slopeplatform_object.bbox_left) : (object_side >= slopeplatform_object.bbox_right);
                    
                    if (_check1 && (_check2 || _check3) && (slopeplatform_object.image_yscale > 0) ? (old_bbox_bottom <= slopeplatform_object.bbox_bottom) : (old_bbox_top >= slopeplatform_object.bbox_top) && triangle_meeting(x, y, slopeplatform_object.x, slopeplatform_object.y + slopeplatform_object.sprite_height, slopeplatform_object.x + slopeplatform_object.sprite_width, slopeplatform_object.y, slopeplatform_object.x + slopeplatform_object.sprite_width, slopeplatform_object.y + slopeplatform_object.sprite_height))
                    {
                        collided++;
                        
                        if (!is_undefined(argument2))
                            ds_list_add(argument2, slopeplatform_object.id);
                        else
                            break;
                    }
                }
            }
        }
        
        ds_list_clear(global.MyCollisionList);
        
        if (collided > 0)
        {
            x = old_x;
            y = old_y;
            return collided;
        }
    }
    
    x = old_x;
    y = old_y;
    return 0;
}

function place_meeting_slopePlatform(argument0, argument1)
{
    return instance_place_list_slopePlatform(argument0, argument1) > 0;
}

function instance_place_list_slope(argument0, argument1, argument2 = undefined)
{
    var slope_number, collided, i, slope_object, _can_collide;
    
    if (place_meeting(argument0, argument1, obj_slope))
    {
        slope_number = instance_place_list(argument0, argument1, 137, global.MyCollisionList, false);
        collided = 0;
        
        if (slope_number > 0)
        {
            for (i = 0; i < slope_number; i++)
            {
                slope_object = ds_list_find_value(global.MyCollisionList, i);
                _can_collide = true;
                
                if (variable_instance_exists(slope_object, "canCollide"))
                    _can_collide = slope_object.canCollide(object_index);
                
                if (_can_collide == true && triangle_meeting(argument0, argument1, slope_object.x, slope_object.y + slope_object.sprite_height, slope_object.x + slope_object.sprite_width, slope_object.y, slope_object.x + slope_object.sprite_width, slope_object.y + slope_object.sprite_height))
                {
                    collided++;
                    
                    if (!is_undefined(argument2))
                        ds_list_add(argument2, slope_object.id);
                    else
                        break;
                }
            }
        }
        
        ds_list_clear(global.MyCollisionList);
        
        if (collided > 0)
            return collided;
    }
    
    return 0;
}

function place_meeting_slope(argument0, argument1, argument2 = true)
{
    var _check2;
    
    _check2 = argument2 ? place_meeting_slopePlatform(argument0, argument1) : false;
    return instance_place_list_slope(argument0, argument1) > 0 || _check2;
}

function place_meeting_slopeSolid(argument0, argument1)
{
    var slope_number, collided, i, slope_object, _can_collide, _xscale;
    
    if (place_meeting(argument0, argument1, obj_slope))
    {
        slope_number = instance_place_list(argument0, argument1, 137, global.MyCollisionList, false);
        collided = 0;
        
        if (slope_number > 0)
        {
            for (i = 0; i < slope_number; i++)
            {
                slope_object = ds_list_find_value(global.MyCollisionList, i);
                _can_collide = true;
                
                if (variable_instance_exists(slope_object, "canCollide"))
                    _can_collide = slope_object.canCollide(object_index);
                
                _xscale = argument0 - x;
                
                if (_can_collide == true && (sign(slope_object.image_xscale) != _xscale && _xscale != 0) && triangle_meeting(argument0, argument1, slope_object.x, slope_object.y + slope_object.sprite_height, slope_object.x + slope_object.sprite_width, slope_object.y, slope_object.x + slope_object.sprite_width, slope_object.y + slope_object.sprite_height))
                {
                    collided++;
                    break;
                }
            }
        }
        
        ds_list_clear(global.MyCollisionList);
        
        if (collided > 0)
            return true;
    }
    
    return false;
}