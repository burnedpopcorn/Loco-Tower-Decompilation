var p = 0
with (obj_player)
{
    if (targetDoor == "LAP")
    {
        scr_soundeffect(sfx_lapexit)
        p = 1
        state = 19
        x = other.x
        y = other.y
        roomstartx = x
        roomstarty = y
        visible = false
        switch global.laps
        {
            case 3:
                with (instance_create(0, 0, obj_transformationtext))
                    message = "Enemies will last longer now..."
                break
            case 4:
                if (!instance_exists(obj_patripi))
                {
                    scr_soundeffect(sfx_patripi)
                    instance_create((room_width / 2), -10, obj_patripi)
                }
                with (instance_create(0, 0, obj_transformationtext))
                    message = "Patripi is coming..."
                break
            case 5:
                if (!instance_exists(obj_giantpoofeffect))
                    instance_create(0, 0, obj_giantpoofeffect)
                with (instance_create(0, 0, obj_transformationtext))
                    message = "The Heat has risen..."
        }

    }
}
if (!p)
    instance_destroy()
else
    active = 1
