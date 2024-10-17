if (scr_solid((x + spd), y) && (!(place_meeting((x + spd), y, obj_destructibles))) && (!(place_meeting((x + spd), y, obj_ratblock))))
    instance_destroy()
with (instance_place((x + spd), y, obj_destructibles))
    instance_destroy()
if place_meeting((x + spd), y, obj_ratblock)
{
    with (instance_place((x + spd), y, obj_ratblock))
        instance_destroy()
    instance_destroy()
}
spd = Approach(spd, 0, 0.8)
if (spd == 0)
    instance_destroy()
x += spd
y += (-spdh)
