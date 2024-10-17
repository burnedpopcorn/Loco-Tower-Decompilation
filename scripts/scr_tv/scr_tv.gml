function tv_do_expression(argument0) //tv_do_expression
{
    with (obj_tv)
    {
        if (expressionsprite != argument0)
        {
            state = 250
            expressionsprite = argument0
            changingtv = 1
            changingtvindex = 0
            changingtvspeed = 0.25
            switch expressionsprite
            {
                case 1405:
                    expressionbuffer = 60
                    break
                case 1746:
                    expressionbuffer = 150
                    break
            }

        }
    }
    return;
}

function tv_set_idle() //tv_set_idle
{
    with (obj_tv)
    {
        state = 0
        sprite_index = spr_tv_off
    }
    return;
}

function tv_create_prompt(argument0, argument1, argument2, argument3) //tv_create_prompt
{
    return [argument0, argument1, argument2, argument3];
}

function tv_push_prompt(argument0, argument1, argument2, argument3) //tv_push_prompt
{
    with (obj_tv)
    {
        var b = [argument0, argument1, argument2, argument3]
        var play = 0
        switch argument1
        {
            case 0:
                play = 1
                ds_list_insert(tvprompts_list, 0, b)
                break
            case 1:
                var placed = 0
                var i = 0
                while (i < ds_list_size(tvprompts_list))
                {
                    var b2 = ds_list_find_value(tvprompts_list, i)
                    if (b2[1] == 2)
                    {
                        if (i == 0)
                            play = 1
                        ds_list_insert(tvprompts_list, i, b)
                        placed = 1
                        break
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
                if (!placed)
                    ds_list_add(tvprompts_list, b)
                break
            case 2:
                ds_list_add(tvprompts_list, b)
                break
        }

        if play
            state = 0
    }
    return;
}

function tv_push_prompt_array(argument0) //tv_push_prompt_array
{
    i = 0
    b = 0
    for (i = 0; i < array_length(argument0); i++)
    {
        with (obj_tv)
        {
            b = argument0[i]
            tv_push_prompt(b[0], b[1], b[2], b[3])
        }
    }
    return;
}

function tv_default_condition() //tv_default_condition
{
    return place_meeting(x, y, obj_player);
}

