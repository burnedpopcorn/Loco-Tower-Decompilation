function scr_player_chainsaw() //scr_player_chainsaw
{
    var _st = tauntstoredstate
    var _spr = tauntstoredsprite
    hsp = 0
    vsp = 0
    x = (hitX + random_range(-4, 4))
    y = (hitY + random_range(-4, 4))
    hitLag--
    if key_jump
        input_buffer_jump = 0
    if key_slap2
        input_buffer_slap = 0
    if (global.laps >= 6 && (tauntstoredsprite == spr_player_suplexmash1 || tauntstoredsprite == spr_player_suplexmash3) && (!(floor(image_index) == (image_number - 1))))
        image_speed = 0.2
    else
        image_speed = 0
    if (_st == 120)
    {
        if (key_slap && input_attack_buffer < 25)
            input_attack_buffer = 40
        if key_slap2
            input_attack_buffer = 25
        baddie_pummel()
    }
    if key_slap2
        input_attack_buffer = 8
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
        if (tauntstoredstate == 113 && parrysound)
        {
            audio_sound_pitch(scr_soundeffect(sfx_parry), random_range(1, 1.1))
            parrysound = 0
        }
        if (tauntstoredstate == 22 || sprite_index == spr_piledriverland)
        {
            jumpAnim = 1
            state = 58
            sprite_index = spr_player_backflip
            vsp = -11
            jumpstop = 0
            image_index = 0
        }
        else if (tauntstoredstate == 22 || tauntstoredstate == 3)
            state = (0 << 0)
    }
}

