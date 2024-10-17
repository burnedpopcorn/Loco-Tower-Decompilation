function scr_panicbg_init() //scr_panicbg_init
{
    var layernum = 0
    var arr = ["Backgrounds_", "Backgrounds_Ground", "Backgrounds_still", "Backgrounds_skystill", "Backgrounds_sky"]
    for (var i = 0; i < array_length(arr); i++)
    {
        for (var o = 0; o < 10; o++)
        {
            var _id = (arr[i] + string(o))
            if layer_exists(_id)
                layers[layernum++] = _id
        }
    }
    if (!layernum)
        return;
    var bottom_id = layer_get_id(layers[0])
    var top_id = layer_get_id(layers[(layernum - 1)])
    layer_script_begin(bottom_id, scr_panicbg_start)
    layer_script_end(top_id, scr_panicbg_end)
}

