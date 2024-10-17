function langstr_get(argument0) //langstr_get
{
    var returnedstr = ds_map_find_value(global.languagemap, argument0)
    if is_undefined(returnedstr)
    {
        show_debug_message((("failed to fetch " + argument0) + " from the lang file"))
        returnedstr = "...UH, EPIC FAIL!!"
    }
    return returnedstr;
}

