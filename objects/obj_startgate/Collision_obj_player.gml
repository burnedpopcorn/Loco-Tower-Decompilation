var gate = id
with (obj_player1)
{
    if (key_up && grounded && (state == 0 || state == 69 || state == 70 || state == 91) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != 64 && state != 61 && obj_player1.spotlight == 1)
    {
        audio_stop_all()
        global.leveltosave = other.level
        global.combodrop = 0
        lasthub = room
        lastdoorhub = other.targetdoorhub
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = 64
        obj_player2.backtohubstartx = x
        obj_player2.backtohubstarty = y
        obj_player2.backtohubroom = room
        if (global.coop == 1)
        {
            with (obj_player2)
            {
                x = obj_player1.x
                mach2 = 0
                obj_camera.chargecamera = 0
                image_index = 0
                state = 64
            }
        }
    }
}
if (obj_player1.state == 64)
{
    with (obj_player1)
        x = lerp(x, other.x, 0.2)
}
with (obj_player2)
{
    if (key_up && grounded && (state == 0 || state == 69 || state == 70 || state == 91) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != 64 && state != 61 && obj_player1.spotlight == 0)
    {
        audio_stop_all()
        global.leveltosave = other.level
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        DoorID = other.id
        obj_camera.chargecamera = 0
        image_index = 0
        state = 64
        obj_player1.backtohubstartx = x
        obj_player1.backtohubstarty = y
        obj_player1.backtohubroom = room
        if (global.coop == 1)
        {
            with (obj_player1)
            {
                x = obj_player2.x
                mach2 = 0
                obj_camera.chargecamera = 0
                image_index = 0
                state = 64
            }
        }
    }
}
if ((floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == 64) || (floor(obj_player2.image_index) == (obj_player2.image_number - 1) && obj_player2.state == 64))
{
    with (obj_player)
    {
        if (other.level == "tutorial")
        {
            obj_music.fadeoff = 0
            targetDoor = other.targetDoor
            targetRoom = other.targetRoom
            if (!instance_exists(obj_fadeout))
                instance_create(x, y, obj_fadeout)
        }
        else
        {
            obj_music.fadeoff = 0
            targetDoor = other.targetDoor
            targetRoom = 21
            roomafter = other.targetRoom
            if (!other.donotrepeat)
            {
                with (obj_camera)
                    alphaend = 0
                with (obj_tv)
                    alphaend = 0
                if (!instance_exists(obj_titlecard))
                {
                    with (instance_create(x, y, obj_titlecard))
                    {
                        title_music = gate.title_music
                        titlecard_sprite = gate.titlecard_sprite
                        title_sprite = gate.title_sprite
                    }
                    other.donotrepeat = 1
                }
            }
        }
    }
}
