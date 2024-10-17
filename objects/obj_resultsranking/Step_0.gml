scr_getinput()
if (pointsmax >= global.collect)
    pointsmax = global.collect
if (lapsmax >= global.laps)
    lapsmax = global.laps
var i = 0
for (i = 0; i < array_length(toppin_sprite); i++)
    topping_shake[i] = Approach(topping_shake[i], 0, 0.4)
shakepoints = Approach(shakepoints, 0, 0.4)
shakelaps = Approach(shakelaps, 0, 0.4)
toppin_has[0] = global.shroomfollow
toppin_has[1] = global.cheesefollow
toppin_has[2] = global.tomatofollow
toppin_has[3] = global.sausagefollow
toppin_has[4] = global.pineapplefollow
switch global.rank
{
    case "d":
        rankindex = 0
        break
    case "c":
        rankindex = 1
        break
    case "b":
        rankindex = 2
        break
    case "a":
        rankindex = 3
        break
    case "s":
        rankindex = 4
        break
    case "p":
        rankindex = 5
        break
}

if (dead == 1)
{
    audio_sound_pitch(mu_results, pitch)
    pitch -= 0.003
}
if (dead == 1 && pitch <= 0)
{
    dead = 0
    audio_stop_sound(mu_results)
    audio_sound_pitch(mu_results, 1)
    alarm[5] = 60
}
if (gameover == 1)
{
    yfont += vspfont
    if (vspfont != 20)
        vspfont += gravfont
    if (yfont >= 270)
    {
        switch bounce
        {
            case 0:
                vspfont = 0
                gravfont = 0
                break
            case 1:
                vspfont = -4
                bounce = 0
                break
            case 2:
                vspfont = -8
                bounce = 1
                break
            case 3:
                vspfont = -12
                bounce = 2
                break
        }

    }
}
if (key_jump2 && ((showrank == 1 && global.rank != "d") || gameover == 1))
{
    scr_playerreset()
    obj_player.state = 0
    obj_player1.targetDoor = obj_player1.lastdoorhub
    obj_player.visible = true
    room = obj_player1.lasthub
}
