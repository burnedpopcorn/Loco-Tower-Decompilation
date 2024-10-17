function anon_gml_Object_obj_platformskateboard_Create_0_13_gml_Object_obj_platformskateboard_Create_0(argument0) //anon_gml_Object_obj_platformskateboard_Create_0_13_gml_Object_obj_platformskateboard_Create_0
{
    if (argument0 == undefined)
        argument0 = obj_player
    switch argument0
    {
        case obj_player:
        case 148:
        case 147:
            var _state = argument0.state
            return (_state == 118 || _state == 44 || (_state == 51 && argument0.styledtaunting));
        default:
            return 0;
    }

}

