scr_getinput()
draw_set_font(font_dialogue)
draw_set_color(c_white)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
switch state
{
    case 0:
        if (ceil(boxx) != targetboxx)
        {
            if (boxx == startingboxx)
                scr_soundeffect(sfx_diatoggle1)
            boxx = lerp(boxx, targetboxx, 0.3)
        }
        else
        {
            boxx = targetboxx
            state = 1
        }
        break
    case 1:
        if (boxx == targetboxx && (!audio_is_playing(sfx_diatoggle1)))
        {
            if (boxw == startingboxw)
                scr_soundeffect(sfx_diatoggle2)
            if (boxw < (targetboxw - 0.05))
                boxw = lerp(boxw, targetboxw, 0.3)
            else
            {
                boxw = targetboxw
                state = 2
            }
        }
        break
    case 2:
        currchar = string_char_at(ttext[currline], floor(textprog))
        if (textprog < string_length(ttext[currline]))
        {
            textprog += (currchar == "." ? (typewriterspd / 3) : typewriterspd)
            if (texttimer <= 0)
            {
                truecharportrait = asset_get_index((string(sprite_get_name(characterportrait)) + "TALK"))
                audio_stop_sound(playedsound)
                playedsound = audio_play_sound(sound[irandom_range(0, (array_length(sound) - 1))], 0, false, global.option_sfx_volume, 0, random_range(0.9, 1.1))
                settime = (irandom_range(25, 40) * (audio_sound_length(playedsound) * 2))
                texttimer = settime
            }
        }
        else if (irandom(50) == 5 && truecharportrait != asset_get_index((string(sprite_get_name(characterportrait)) + "BLINK")))
        {
            truecharportrait = asset_get_index((string(sprite_get_name(characterportrait)) + "BLINK"))
            charportraitindex = 0
        }
        if key_jump
        {
            if (textprog < string_length(ttext[currline]))
            {
                textprog = string_length(ttext[currline])
                key_jump = 0
            }
            if (textprog >= string_length(ttext[currline]))
            {
                if (currline < (array_length(ttext) - 1))
                {
                    textprog = 0
                    currline++
                    key_jump = 0
                }
                if (currline == (array_length(ttext) - 1))
                {
                    state = 3
                    key_jump = 0
                    return;
                }
            }
        }
        break
    case 3:
        if (boxw != startingboxw)
        {
            if (boxw == targetboxw)
                scr_soundeffect(sfx_diatoggle1)
            if (boxw > (startingboxw + 0.05))
                boxw = lerp(boxw, startingboxw, 0.3)
            else
            {
                boxw = startingboxw
                state = 4
            }
        }
        break
    case 4:
        if (boxw == startingboxw && (!audio_is_playing(sfx_diatoggle1)))
        {
            if (boxx == targetboxx)
                scr_soundeffect(sfx_diatoggle2)
            if (boxx > (startingboxx + 5))
                boxx = lerp(boxx, startingboxx, 0.3)
            else
            {
                boxx = startingboxx
                instance_destroy()
            }
        }
        break
}

if (texttimer > 0)
{
    texttimer--
    var spd = (round((settime / 30)) / 2)
    if (spd < 0.4)
        charportraitindex = approach(charportraitindex, 0, 0.25)
    else
        charportraitindex += spd
    if (charportraitindex >= sprite_get_number(truecharportrait))
    {
        texttimer = 0
        truecharportrait = characterportrait
        charportraitindex = 0
    }
}
else if (charportraitindex < sprite_get_number(truecharportrait))
    charportraitindex += charportraitanimspeed
else
{
    truecharportrait = characterportrait
    charportraitindex = 0
}
