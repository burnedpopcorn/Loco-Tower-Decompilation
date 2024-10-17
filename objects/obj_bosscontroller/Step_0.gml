switch state
{
    case 144:
        scr_bosscontroller_intro()
        break
    case 0:
        scr_bosscontroller_normal()
        break
    case 98:
        scr_bosscontroller_victory()
        break
}

if (!round_timer_init)
{
    round_timer = round_timermax
    round_timer_init = 1
}
player_index += 0.35
boss_index += 0.35
player_index = wrap(player_index, 0, sprite_get_number(spr_bossfight_playerhp))
boss_index = wrap(boss_index, 0, sprite_get_number(boss_hpsprite))
image_alpha = Approach(image_alpha, 1, 0.1)
with (obj_targetguy)
    image_alpha = other.image_alpha
with (obj_hppickup)
    image_alpha = other.image_alpha
