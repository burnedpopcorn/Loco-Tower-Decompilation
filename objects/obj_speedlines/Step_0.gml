x = playerid.x
y = playerid.y
image_xscale = playerid.xscale
image_angle = playerid.angle
if (playerid.movespeed <= 0)
    instance_destroy()
with (playerid)
{
    if (state != 91)
        instance_destroy(other.id)
}
