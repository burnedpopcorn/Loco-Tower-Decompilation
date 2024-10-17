highest_y = -170
var _instY = collision_line(obj_player1.x, obj_player1.y, obj_player1.x, (obj_player1.y - 170), obj_solid, false, true)
if (_instY != noone)
    highest_y = ((-(abs((obj_player1.y - (_instY.y + _instY.sprite_height))))) - 32)
if (image_alpha == 1)
{
    if (sprite_index == spr_marxthrow)
    {
        if (floor(image_index) >= 2 && usingonce == 0)
        {
            if (powerlimit < 2)
            {
                usingonce = 1
                instance_create(x, y, obj_ballmarx)
                powerlimit += 1
            }
            else if (powerlimit >= 2)
            {
                usingonce = 1
                instance_create(x, y, obj_ballmarx)
                powerlimit = 0
                powerselect = 1
                usepower = 0
            }
        }
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_marx
            usingonce = 0
            if (powerselect == 0)
                alarm[2] = random_range(100, 150)
        }
    }
    if (!startanim)
    {
        sprite_index = spr_marx
        startanim = 1
    }
    if ((!blackhole) && (!laser))
    {
        if ((!usepower) && (!instakillmove))
        {
            switch powerselect
            {
                case 0:
                    alarm[2] = random_range(100, 300)
                    break
                case 1:
                    alarm[3] = random_range(100, 300)
                    break
                case 2:
                    alarm[4] = random_range(100, 300)
                    break
            }

            usepower = 1
        }
        else if instakillmove
        {
            if (!usepower)
            {
                alarm[6] = random_range(200, 300)
                usepower = 1
            }
        }
        var dir = point_direction(x, y, obj_player1.x, obj_player1.y)
        if (!arrows)
            var yoffest = Wave(-12, 12, 2, 15)
        else
            yoffest = Wave(-25, 25, 0.8, 15)
        var xmove = Wave(-250, 250, 7, 15)
        x = (lerp(x, (obj_player1.x - xmove), 0.2) + wave(waveamnt, (-waveamnt), (wavetime * 2), 0))
        y = (lerp(y, ((obj_player1.y + highest_y) + yoffest), 0.2) + wave(waveamnt, (-waveamnt), wavetime, 0))
        if (x != obj_player1.x)
            image_xscale = (-(sign((x - obj_player1.x))))
    }
    else if blackhole
    {
        x = (lerp(x, obj_player1.x, 0.2) + wave(waveamnt, (-waveamnt), (wavetime * 2), 0))
        y = (lerp(y, obj_player1.y, 0.2) + wave(waveamnt, (-waveamnt), wavetime, 0))
    }
    else if laser
    {
        x = lerp(x, (obj_player1.x + 200), 0.2)
        y = lerp(y, obj_player1.y, 0.2)
        if (amountlaser < 320 && obj_player1.state != 61 && obj_player1.state != 78)
            amountlaser += 1
        if (amountlaser >= 320)
        {
            amountlaser = 320
            if (!instance_exists(obj_marxlaser))
            {
                if audio_is_playing(sfx_lasercharge)
                    audio_stop_sound(sfx_lasercharge)
                instance_create(x, (y - 50), obj_marxlaser)
                scr_soundeffect(sfx_lasershoot)
            }
            ballpower = 0
        }
    }
}
else
{
    x = (lerp(x, obj_player1.x, 0.2) + wave(waveamnt, (-waveamnt), (wavetime * 2), 0))
    y = (lerp(y, obj_player1.y, 0.2) + wave(waveamnt, (-waveamnt), wavetime, 0))
    image_alpha += 0.01
}
if (arrows && (!usingarrows))
{
    alarm[5] = 10
    usingarrows = 1
}
if ballpower
{
    ballscale = Wave(ballmax, (-ballmax), 0.8, 15)
    ballmax = Wave(ballmax, 20, 2, 15)
}
laserbar = ((amountlaser / amountlasermax) * 100)
shoesx = lerp(shoesx, x, 0.35)
shoesy = lerp(shoesy, y, 0.35)
wingsx = lerp(wingsx, x, 0.25)
wingsy = lerp(wingsy, y, 0.25)
