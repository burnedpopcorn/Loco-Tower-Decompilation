switch state
{
    case 94:
        scr_enemy_idle()
        break
    case 98:
        scr_enemy_turn()
        break
    case 102:
        scr_enemy_walk()
        break
    case 104:
        scr_enemy_land()
        break
    case 105:
        scr_enemy_hit()
        break
    case 106:
        scr_enemy_stun()
        break
    case 109:
        scr_enemy_grabbed()
        break
}

if (!instance_exists(obj_slaphitbox))
    slapped = 0
stunned = 100
if (cigar == 0)
{
    landspr = 36
    idlespr = 36
    fallspr = 36
    hitceillingspr = 36
    stunfalltransspr = 36
    hitwallspr = 36
    stunfallspr = 34
    rollingspr = 36
    walkspr = 36
    turnspr = 36
    flyingspr = 36
    hitspr = 36
    stunlandspr = 36
    stunspr = 36
    recoveryspr = 36
    stompedspr = 36
    grabbedspr = 34
}
if (state != 109)
    depth = 0
if (state != 106)
    thrown = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
