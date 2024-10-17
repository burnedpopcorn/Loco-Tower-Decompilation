function approach(argument0, argument1, argument2) //approach
{
    return (argument0 + clamp((argument1 - argument0), (-abs(argument2)), abs(argument2)));
}

function chance(argument0) //chance
{
    return argument0 > random(1);
}

function animation_end(argument0, argument1) //animation_end
{
    if (argument0 == undefined)
        argument0 = floor(image_index)
    if (argument1 == undefined)
        argument1 = (image_number - 1)
    return argument0 >= argument1;
}

