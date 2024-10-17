function reload_langfile() //reload_langfile
{
    global.languagemap = -1
    var langbuffer = buffer_load((("languages/lang_" + global.language) + ".json"))
    if (langbuffer > -1)
    {
        global.languagemap = json_decode(buffer_read(langbuffer, buffer_string))
        buffer_delete(langbuffer)
        show_debug_message("loaded the language file I tghink")
    }
    else if (langbuffer == -1)
    {
        show_debug_message("oopsies game failed to load the language file")
        game_end()
    }
}

