scr_getinput()
if (grounded && vsp > 0)
    coyote_time = 8
if (vsp < 0)
    coyote_time = 0
can_jump = ((grounded && (upsidedown ? vsp < 0 : vsp > 0)) || (coyote_time && (upsidedown ? vsp < 0 : vsp > 0)))
switch state
{
    case (0 << 0):
        scr_player_normal()
        break
    case (106 << 0):
        scr_player_grabbed()
        break
    case (3 << 0):
        scr_player_finishingblow()
        break
    case (2 << 0):
        scr_player_tumble()
        break
    case (8 << 0):
        scr_player_titlescreen()
        break
    case (4 << 0):
        scr_player_ejected()
        break
    case (7 << 0):
        scr_player_firemouth()
        break
    case (6 << 0):
        scr_player_fireass()
        break
    case (5 << 0):
        scr_player_transitioncutscene()
        break
    case (9 << 0):
        scr_playerN_hookshot()
        break
    case (12 << 0):
        scr_player_slap()
        break
    case (10 << 0):
        scr_player_tacklecharge()
        break
    case (13 << 0):
        scr_player_zombie()
        break
    case (11 << 0):
        scr_player_cheeseball()
        break
    case (14 << 0):
        scr_player_cheesepepstick()
        break
    case (15 << 0):
        scr_player_boxxedpep()
        break
    case (16 << 0):
        scr_player_pistolaim()
        break
    case (17 << 0):
        scr_player_climbwall()
        break
    case 18:
        scr_player_knightpepslopes()
        break
    case 19:
        scr_player_portal()
        break
    case 20:
        scr_player_secondjump()
        break
    case 21:
        scr_player_chainsawbump()
        break
    case 22:
        scr_player_handstandjump()
        break
    case 23:
        scr_player_gottreasure()
        break
    case 24:
        scr_player_knightpep()
        break
    case 25:
        scr_player_knightpepattack()
        break
    case 26:
        scr_player_meteorpep()
        break
    case 27:
        scr_player_bombpep()
        break
    case 28:
        scr_player_grabbing()
        break
    case 29:
        scr_player_chainsawpogo()
        break
    case 30:
        scr_player_shotgunjump()
        break
    case 31:
        scr_player_stunned()
        break
    case 32:
        scr_player_highjump()
        break
    case 33:
        scr_player_chainsaw()
        break
    case 34:
        scr_player_facestomp()
        break
    case 36:
        scr_player_timesup()
        break
    case 37:
        scr_player_machroll()
        break
    case 39:
        scr_player_pistol()
        break
    case 38:
        scr_player_shotgun()
        break
    case 40:
        scr_player_machfreefall()
        break
    case 41:
        scr_player_throw()
        break
    case 43:
        scr_player_superslam()
        break
    case 42:
        scr_player_slam()
        break
    case 44:
        scr_player_skateboard()
        break
    case 45:
        scr_player_grind()
        break
    case 46:
        scr_player_grab()
        break
    case 47:
        scr_player_punch()
        break
    case 48:
        scr_player_backkick()
        break
    case 49:
        scr_player_uppunch()
        break
    case 50:
        scr_player_shoulder()
        break
    case 51:
        scr_player_backbreaker()
        break
    case 52:
        scr_player_bossdefeat()
        break
    case 54:
        scr_player_bossintro()
        break
    case 62:
        scr_player_smirk()
        break
    case 53:
        scr_player_pizzathrow()
        break
    case 55:
        scr_player_gameover()
        break
    case 93:
        scr_player_Sjumpland()
        break
    case 92:
        scr_player_freefallprep()
        break
    case 90:
        scr_player_runonball()
        break
    case 88:
        scr_player_boulder()
        break
    case 56:
        scr_player_keyget()
        break
    case 57:
        scr_player_tackle()
        break
    case 60:
        scr_player_slipnslide()
        break
    case 59:
        scr_player_ladder()
        break
    case 58:
        scr_player_jump()
        break
    case 64:
        scr_player_victory()
        break
    case 61:
        scr_player_comingoutdoor()
        break
    case 63:
        scr_player_Sjump()
        break
    case 65:
        scr_player_Sjumpprep()
        break
    case 66:
        scr_player_crouch()
        break
    case 67:
        scr_player_crouchjump()
        break
    case 68:
        scr_player_crouchslide()
        break
    case 69:
        scr_player_mach1()
        break
    case 70:
        scr_player_mach2()
        break
    case 91:
        scr_player_mach3()
        break
    case 71:
        scr_player_machslide()
        break
    case 72:
        scr_player_bump()
        break
    case 73:
        scr_player_hurt()
        break
    case 74:
        scr_player_freefall()
        break
    case 77:
        scr_player_freefallland()
        break
    case 75:
        scr_player_hang()
        break
    case 78:
        scr_player_door()
        break
    case 84:
        scr_player_barrelnormal()
        break
    case 83:
        scr_player_barrelfall()
        break
    case 82:
        scr_player_barrelmach1()
        break
    case 81:
        scr_player_barrelmach2()
        break
    case 80:
        scr_player_barrelfloat()
        break
    case 79:
        scr_player_barrelcrouch()
        break
    case 85:
        scr_player_barrelslipnslide()
        break
    case 86:
        scr_player_barrelroll()
        break
    case 87:
        scr_player_current()
        break
    case 89:
        scr_player_taxi()
        break
    case 110:
        scr_player_actor()
        break
    case 111:
        scr_player_debugstate()
        break
    case 112:
        scr_player_zombiejump()
        break
    case 113:
        scr_player_parry()
        break
    case 114:
        scr_player_faceplant()
        break
    case 115:
        scr_player_gateeject()
        break
    case 116:
        scr_player_bubble()
        break
    case 117:
        scr_player_zombieattack()
        break
    case 118:
        scr_player_skateboardslide()
        break
    case 119:
        scr_player_slipbanana()
        break
    case 120:
        scr_player_lungeattack()
        break
}

if (grounded && Doublejump && state != 58)
    Doublejump = 0
if (state != 59)
    ladderx = x
if (global.anglerotation || angle != 0)
    scr_angle_rotate()
if (state != 51 && styledtaunting == 1)
{
    styledtaunts = 0
    styledtaunting = 0
    room_speed = 60
    obj_camera.zoom = 1
    obj_camera.spdzooming = 0.3
}
if (state != 63)
    sjumpvsp = -12
if (superchargecombo_buffer > 0)
    superchargecombo_buffer--
genotimer = Approach(genotimer, 0, 1)
genodelay = Approach(genodelay, 0, 1)
if (genotimer == 0 && genomode)
{
    genotimer_max = 0
    genomode = 0
}
if (genodelay == 0 && genodelay_max != 0 && (!genomode))
    genodelay_max = 0
else if (superchargecombo_buffer == 0)
{
    superchargecombo_buffer = -1
    global.combotime = 4
}
if ((!instance_exists(superchargedeffectid)) && supercharged)
{
    with (instance_create(x, y, obj_superchargeeffect))
    {
        playerid = other.id
        other.superchargedeffectid = id
    }
}
if (supercharge > 9 && state != 51)
    supercharged = 1
if (!(place_meeting(x, (y + 1), obj_grindrail)))
{
    if (state == 91 || state == 70 || state == 2)
        railmovespeed = Approach(railmovespeed, 0, 0.1)
    else
        railmovespeed = Approach(railmovespeed, 0, 0.5)
}
if (room == Realtitlescreen)
    state = 8
scr_playersounds()
if (global.coop == 0)
    fightball = 0
if (state != 91 && state != 109)
    fightball = 0
if (state != 109 && state != 73)
    thrown = 0
if (grounded && state != 22)
    suplexmove = 0
if (state != 74)
    freefallsmash = 0
if (global.playerhealth <= 0 && state != 55)
{
    image_index = 0
    sprite_index = spr_deathstart
    state = 55
}
if (state == 55 && y > (room_height * 2))
{
    scr_playerreset()
    targetDoor = "C"
    room = hub_hall
}
if (baddiegrabbedID == 0 && (state == 46 || state == 43 || state == 10))
    state = (0 << 0)
if (!((state == 46 || state == 33 || state == 43 || state == 70)))
    baddiegrabbedID = 0
if grinding
    state = 45
if (anger == 0)
    angry = 0
if (anger > 0)
{
    angry = 1
    anger -= 1
}
if (sprite_index == spr_winding && state != (0 << 0))
    windingAnim = 0
if (state != 46)
    swingdingbuffer = 0
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (global.playerhealth == 1 && (!instance_exists(obj_sweat)) && obj_player.state == (0 << 0))
    instance_create(x, y, obj_sweat)
if (angry == 1 && (!instance_exists(angryeffectid)) && state == (0 << 0))
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index
        other.angryeffectid = id
    }
}
if (global.combo != global.previouscombo)
{
    global.previouscombo = global.combo
    if (global.combo > global.highest_combo)
        global.highest_combo = global.combo
    if ((global.combo % 5) == 0 && global.combo != 0)
    {
        with (instance_create(x, (y - 80), obj_combotitle))
        {
            scr_soundeffect(choose(72, 68, 202))
            title = floor((global.combo / 5))
            scale = 0
        }
    }
}
if (global.combotime > 0 && state != 56 && state != 64 && state != 61 && state != 23 && state != 19 && state != 110 && state != 78 && (!((instance_exists(obj_fadeout) || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart)))))
    global.combotime -= 0.15
if (global.combotime <= 0 && global.combo != 0)
{
    scr_soundeffect(sfx_comboend)
    global.combotime = 0
    global.combo = 0
    global.previouscombo = 0
    supercharge = 0
    if (!global.combodrop)
        global.combodrop = 1
}
if (global.heattime > 0)
    global.heattime -= 0.15
if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
    global.style -= 0.05
if (input_buffer_jump < 8)
    input_buffer_jump++
if (coyote_time > 0)
    coyote_time--
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (input_attack_buffer > 0)
    input_attack_buffer--
if (input_finisher_buffer > 0)
    input_finisher_buffer--
if (input_up_buffer > 0)
    input_up_buffer--
if (input_down_buffer > 0)
    input_down_buffer--
if (input_buffer_walljump > 0)
    input_buffer_walljump--
if (input_buffer_slap < 8)
    input_buffer_slap++
if (grabclimbbuffer > 0)
    grabclimbbuffer--
if (key_particles == 1)
    instance_create(random_range((x + 25), (x - 25)), random_range((y + 35), (y - 25)), obj_keyeffect)
if (inv_frames == 0 && hurted == 0)
    image_alpha = 1
if (state == 70 || state == 10 || state == 44 || state == 24 || state == 15 || state == 117 || state == 18 || state == 25 || state == 27 || state == 34 || state == 40 || state == 34 || state == 37 || state == 91 || state == 74 || state == 63)
    attacking = 1
else
    attacking = 0
if (state == 41 || (state == 47 && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_player_Sjumpcancel && sprite_index != spr_player_kungfujump && sprite_index != spr_player_breakdanceuppercut && sprite_index != spr_player_breakdanceuppercutend) || state == 48 || state == 50 || state == 49)
    grabbing = 1
else
    grabbing = 0
if (state == 91 || (state == 47 && (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_player_kungfujump || sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)) || state == 60 || (state == 73 && thrown == 1) || state == 17 || state == 74 || (state == 2 && (sprite_index == spr_tumblestart || sprite_index == spr_tumble || sprite_index == spr_tumbleend)) || state == 6 || state == 7 || state == 9 || state == 44 || state == 35 || state == 63 || state == 37 || state == 40 || state == 10 || (state == 43 && sprite_index == spr_piledriver) || state == 24 || state == 25 || state == 18 || state == 15 || state == 117 || state == 11)
    instakillmove = 1
else
    instakillmove = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = (0.15 * room_speed)
if (state != 91 && state != 71)
    autodash = 0
if ((state != 58 && state != 67 && state != 12) || vsp < 0)
    fallinganimation = 0
if (state != 77 && state != (0 << 0) && state != 71)
    facehurt = 0
if (state != (0 << 0) && state != 71)
    machslideAnim = 0
if (state != (0 << 0))
{
    idle = 0
    dashdust = 0
}
if (state != 69 && state != 58 && state != 9 && state != 22 && state != (0 << 0) && state != 70 && state != 91 && state != 92 && state != 24 && state != 38 && state != 18)
    momemtum = 0
if (state != 63 && state != 65)
    a = 0
if (state != 34)
    facestompAnim = 0
if (state != 74 && state != 34 && state != 43 && state != 77)
    superslam = 0
if (state != 70)
    machpunchAnim = 0
if (state != 58)
    ladderbuffer = 0
if (state != 58)
    stompAnim = 0
if ((state == 3 || (state == 47 && (sprite_index == spr_player_kungfujump || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_player_Sjumpcancelstart || ((sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend) && vsp < 0))) || state == 91 || (state == 109 && instance_exists(obj_player2) && obj_player2.state == 91) || state == 70 || state == 9 || state == 37 || state == 10) && macheffect == 0)
{
    macheffect = 1
    toomuchalarm1 = 6
    with (instance_create(x, y, obj_mach3effect))
    {
        playerid = other.object_index
        image_index = (other.image_index - 1)
        image_xscale = other.xscale
        sprite_index = other.spritereal
    }
}
if ((!((state == 91 || (state == 109 && instance_exists(obj_player2) && obj_player2.state == 91) || state == 70 || state == 9 || state == 37 || state == 10))) && (!((state == 3 || (state == 47 && (sprite_index == spr_player_kungfujump || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))))
    macheffect = 0
if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1
    if (toomuchalarm1 <= 0 && (state == 3 || (state == 47 && (sprite_index == spr_player_kungfujump || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_player_Sjumpcancelstart || ((sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend) && vsp < 0))) || state == 91 || (state == 109 && instance_exists(obj_player2) && obj_player2.state == 91) || state == 9 || state == 70 || state == 10 || state == 37 || (state == 33 && mach2 >= 100)))
    {
        with (instance_create(x, y, obj_mach3effect))
        {
            playerid = other.object_index
            image_index = (other.image_index - 1)
            image_xscale = other.xscale
            sprite_index = other.spritereal
        }
        toomuchalarm1 = 6
    }
}
if (toomuchalarm2 > 0)
    toomuchalarm2--
else if (state == (2 << 0) || (state == (0 << 0) && breakdance_speed >= 0.5) || state == 117 || (state == 13 && movespeed >= 6) || (state == 115 && sprite_index == spr_machfreefall) || state == 22 || state == 74 || state == 44 || (state == 91 && sprite_index == spr_crazyrun))
{
    with (instance_create(x, y, obj_transpeffect))
    {
        playerid = other.object_index
        image_index = (other.image_index - 1)
        image_xscale = other.xscale
        sprite_index = other.spritereal
    }
    toomuchalarm2 = 2
}
if ((y > (room_height + 300) || y < -800) && state != 55 && room != rank_room && room != timesuproom && (!(place_meeting(x, y, obj_pitfall))) && (!vhallway))
{
    visible = true
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    state = 110
    visible = false
    hsp = 0
    vsp = 0
    scr_soundeffect(sfx_groundpound)
    with (instance_create(x, (y + 540), obj_technicaldifficulty))
    {
        playerid = other.id
        sprite = 1742
    }
    vsp = 10
}
if (character == "S")
{
    if (state == 67 || state == 66)
        state = (0 << 0)
}
if (!(place_meeting(x, y, obj_solid)))
{
    if (state != 72 && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != 2 && state != 6 && state != 66 && state != 15 && state != 39 && sprite_index != spr_player_crouchshoot && state != 65 && state != 33 && state != 37 && state != 73 && state != 68 && state != 67)
        mask_index = spr_player_mask
    else
        mask_index = spr_crouchmask
}
else if place_meeting(x, y, obj_solid)
    mask_index = spr_crouchmask
if (character == "S" && state == 27)
    mask_index = spr_player_mask
else if (character == "S")
    mask_index = spr_crouchmask
if (state == 23 || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == 56 || state == 78 || state == 4 || state == 64 || state == 61 || state == 55)
    cutscene = 1
else
    cutscene = 0
if (((place_meeting(x, y, obj_door) && (!(place_meeting(x, y, obj_doorblocked)))) || place_meeting(x, y, obj_dresser) || place_meeting(x, y, obj_snick) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == (0 << 0) && obj_player1.spotlight == 1)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index
}
if (state == 91 && (!instance_exists(speedlineseffectid)))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index
        other.speedlineseffectid = id
    }
}
if (state == 111)
{
    x += hsp
    y += vsp
}
if (!grounded)
    storedvsp = vsp
scr_collide_destructibles()
if (state != 8 && state != 109 && state != 111 && state != 78 && state != 63 && state != 4 && state != 61 && state != 88 && state != 56 && state != 64 && state != 19 && state != 36 && state != 23 && state != 55)
    scr_collision()
if (state == 88)
    scr_collision()
