function scr_enemy_grabbed() //scr_enemy_grabbed
{
    var _obj_player = asset_get_index(concat("obj_player", grabbedby))
    image_xscale = (-_obj_player.xscale)
    image_xscale = (-_obj_player.xscale)
    stunned = 200
    _obj_player.baddiegrabbedID = id
    if (_obj_player.state == 28 || _obj_player.state == 46 || _obj_player.state == 41 || _obj_player.state == 42 || _obj_player.state == 10)
    {
        x = _obj_player.x
        if (_obj_player.sprite_index != _obj_player.spr_haulingstart)
            y = (_obj_player.y - 40)
        else if (floor(_obj_player.image_index) == 0)
            y = _obj_player.y
        else if (floor(_obj_player.image_index) == 1)
            y = (_obj_player.y - 10)
        else if (floor(_obj_player.image_index) == 2)
            y = (_obj_player.y - 20)
        else if (floor(_obj_player.image_index) == 3)
            y = (_obj_player.y - 30)
        image_xscale = (-_obj_player.xscale)
    }
    with (_obj_player)
    {
        suplexhavetomash = (other.hp - 1)
        move = (key_left2 + key_right2)
        if (!((state == 46 || state == 3 || state == 28 || (state == 33 && tauntstoredstate == 43) || state == 41 || state == 42 || state == 10 || state == 47 || state == 43 || state == 48 || state == 49 || state == 50)))
        {
            other.x = x
            other.y = y
            other.state = 106
            other.image_index = 0
        }
    }
    hsp = 0
    if (_obj_player.state == 47)
    {
        alarm[3] = 3
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        hp -= 1
        instance_create((x + (_obj_player.xscale * 30)), y, obj_bumpeffect)
        alarm[1] = 5
        thrown = 1
        x = _obj_player.x
        vsp = 0
        y = _obj_player.y
        state = 106
        hsp = ((-image_xscale) * 25)
        grav = 0
        global.combotime = 60
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        flash = 1
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
    }
    if (_obj_player.state == 3)
    {
        if (floor(_obj_player.image_index) < 1 && _obj_player.sprite_index == _obj_player.spr_swingdingend)
        {
            x = (_obj_player.x + (_obj_player.xscale * 60))
            y = _obj_player.y
        }
        else if (floor(_obj_player.image_index) < 4)
        {
            x = (_obj_player.x + (_obj_player.xscale * 60))
            y = _obj_player.y
        }
        check_grabbed_solid(_obj_player)
    }
    if (_obj_player.state == 3 && (floor(_obj_player.image_index) >= 4 || (floor(_obj_player.image_index) < 1 && _obj_player.sprite_index == _obj_player.spr_swingdingend)))
    {
        var lag = 5
        hitLag = lag
        hitX = x
        hitY = y
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        _obj_player.movespeed = 0
        _obj_player.hitLag = lag
        _obj_player.hitX = _obj_player.x
        _obj_player.hitY = _obj_player.y
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
        alarm[3] = 3
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        global.combotime = 60
        alarm[1] = 5
        thrown = 1
        state = 106
        with (_obj_player)
        {
            vsp = -6
            if (sprite_index == spr_uppercutfinishingblow)
            {
                other.hithsp = 0
                other.hitvsp = -25
                other.linethrown = 1
            }
            else
            {
                other.hithsp = ((-other.image_xscale) * 25)
                other.hitvsp = -8
                other.linethrown = 1
            }
        }
        check_grabbed_solid(_obj_player)
        check_grabbed_solid(_obj_player)
    }
    if (_obj_player.state == 48)
    {
        alarm[3] = 3
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        hp -= 1
        instance_create((x + ((-_obj_player.xscale) * 50)), y, obj_bumpeffect)
        alarm[1] = 5
        thrown = 1
        x = _obj_player.x
        y = _obj_player.y
        state = 106
        image_xscale *= -1
        hsp = ((-image_xscale) * 20)
        vsp = -7
        global.combotime = 60
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        flash = 1
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
    }
    if (_obj_player.state == 50)
    {
        alarm[3] = 3
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        hp -= 1
        instance_create(x, (y + 20), obj_bumpeffect)
        alarm[1] = 5
        thrown = 1
        x = _obj_player.x
        y = _obj_player.y
        state = 106
        if (_obj_player.sprite_index == spr_player_shoulder)
            vsp = 15
        if (_obj_player.sprite_index == spr_player_diagonaldownthrow)
        {
            hsp = ((-image_xscale) * 10)
            vsp = 15
        }
        if (_obj_player.sprite_index == spr_player_diagonalupthrow)
        {
            hsp = ((-image_xscale) * 10)
            vsp = -15
        }
        global.combotime = 60
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        flash = 1
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
    }
    if (_obj_player.state == 41)
    {
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        alarm[1] = 5
        thrown = 1
        x = _obj_player.x
        y = _obj_player.y
        state = 106
        hsp = ((-image_xscale) * 8)
        vsp = -6
        check_grabbed_solid(_obj_player)
        check_grabbed_solid(_obj_player)
    }
    if (_obj_player.state == 49)
    {
        alarm[3] = 3
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        hp -= 1
        instance_create((x + ((-_obj_player.xscale) * 15)), (y - 50), obj_bumpeffect)
        alarm[1] = 5
        thrown = 1
        x = _obj_player.x
        y = _obj_player.y
        hsp = ((-image_xscale) * 2)
        state = 106
        vsp = -20
        global.combotime = 60
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        flash = 1
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
        check_grabbed_solid(_obj_player)
    }
    if (_obj_player.state == 10)
    {
        x = (_obj_player.x + (_obj_player.xscale * 15))
        y = _obj_player.y
    }
    if (_obj_player.state == 43 && _obj_player.sprite_index == _obj_player.spr_piledriver)
    {
        if (_obj_player.character == "P")
        {
            yscale = -1
            if (floor(_obj_player.image_index) == 0)
            {
                depth = 0
                x = (_obj_player.x + (_obj_player.xscale * 10))
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 1)
            {
                depth = 0
                x = (_obj_player.x + (_obj_player.xscale * 5))
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 2)
            {
                depth = 0
                x = _obj_player.x
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 3)
            {
                depth = 0
                x = (_obj_player.x + (_obj_player.xscale * -5))
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 4)
            {
                depth = 0
                x = (_obj_player.x + (_obj_player.xscale * -10))
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 5)
            {
                depth = -8
                x = (_obj_player.x + (_obj_player.xscale * -5))
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 6)
            {
                depth = -8
                x = _obj_player.x
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 7)
            {
                depth = -8
                x = (_obj_player.x + (_obj_player.xscale * 5))
                y = _obj_player.y
            }
            check_grabbed_solid(_obj_player)
        }
        else
        {
            depth = -7
            x = _obj_player.x
            y = (_obj_player.y - 40)
            check_grabbed_solid(_obj_player)
        }
    }
    if (_obj_player.sprite_index == _obj_player.spr_piledriverland && floor(_obj_player.image_index) == (_obj_player.image_number - 1))
    {
        lag = 5
        hitLag = lag
        hitX = x
        hitY = y
        _obj_player.hitLag = lag
        _obj_player.hitX = _obj_player.x
        _obj_player.hitY = _obj_player.y
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        flash = 1
        global.combotime = 60
        global.hit += 1
        hp -= 5
        alarm[1] = 5
        thrown = 1
        state = 106
        hsp = ((-image_xscale) * 10)
        with (_obj_player)
        {
            if (state != 33)
            {
                tauntstoredmovespeed = movespeed
                tauntstoredsprite = sprite_index
                tauntstoredstate = state
            }
            state = 33
            other.hithsp = ((-other.image_xscale) * 8)
            other.hitvsp = -11
        }
    }
    if (_obj_player.state == 46 && _obj_player.sprite_index == _obj_player.spr_swingding)
    {
        if (floor(_obj_player.image_index) == 0)
        {
            depth = -8
            x = (_obj_player.x + (_obj_player.xscale * 25))
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 1)
        {
            depth = -8
            x = _obj_player.x
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 2)
        {
            depth = -8
            x = (_obj_player.x + (_obj_player.xscale * -25))
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 3)
        {
            depth = 0
            x = (_obj_player.x + (_obj_player.xscale * -50))
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 4)
        {
            depth = 0
            x = (_obj_player.x + (_obj_player.xscale * -25))
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 5)
        {
            depth = 0
            x = _obj_player.x
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 6)
        {
            depth = 0
            x = (_obj_player.x + (_obj_player.xscale * 25))
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 7)
        {
            depth = 0
            x = (_obj_player.x + (_obj_player.xscale * 50))
            y = _obj_player.y
        }
    }
    if (state != 109 || _obj_player.state != 46)
    {
        check_grabbed_solid(_obj_player)
        if (state == 105)
        {
            hitX = x
            hitY = y
        }
    }
    sprite_index = stunfallspr
    image_speed = 0.35
}

function check_grabbed_solid(argument0) //check_grabbed_solid
{
    if instakilled
        return;
    if ((!(place_meeting(x, y, obj_destructibles))) && (place_meeting_collision(x, y) || collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true) != -4))
    {
        var _dist = abs((x - argument0.x))
        x = argument0.x
        y = argument0.y
        if (!(place_meeting_collision((x + argument0.xscale), y)))
        {
            var i = 0
            while (!(place_meeting_collision((x + argument0.xscale), y)))
            {
                x += argument0.xscale
                i++
                if (i > _dist)
                    break
                else
                    continue
            }
            if place_meeting_collision(x, y)
            {
                i = 0
                while place_meeting_collision(x, y)
                {
                    x -= argument0.xscale
                    i++
                    if (i > _dist)
                        break
                    else
                        continue
                }
            }
        }
    }
    return;
}

