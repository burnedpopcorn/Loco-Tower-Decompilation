image_alpha = 0.5
image_speed = 0.35
depth = -10
idstill = 0
waterbuffer = 0
function anon_gml_Object_obj_water_Create_0_95_gml_Object_obj_water_Create_0(argument0) //anon_gml_Object_obj_water_Create_0_95_gml_Object_obj_water_Create_0
{
    if (argument0 == undefined)
        argument0 = obj_player
    switch argument0
    {
        case obj_player:
        case 148:
        case 147:
            var _state = argument0.state
            return (_state == 91 || (argument0.state == 71 && argument0.sprite_index == argument0.spr_mach3boost));
        default:
            return 0;
    }

}

