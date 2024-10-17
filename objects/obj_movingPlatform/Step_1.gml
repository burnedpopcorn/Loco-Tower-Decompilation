hsp = round(lengthdir_x((moveSpeed - stopSpeed), targetDirection))
vsp = round(lengthdir_y((moveSpeed - stopSpeed), targetDirection))
trueX += hsp
trueY += vsp
x = round(trueX)
y = round(trueY)
if (place_meeting((x + sign(hsp)), (y + sign(vsp)), obj_movingPlatformTrigger) && stopped == 0)
{
    with (instance_place((x + sign(hsp)), (y + sign(vsp)), obj_movingPlatformTrigger))
    {
        if (other.stopid != id)
        {
            other.platformDirection = targetAngle
            other.stopped = 1
            other.stopid = id
        }
    }
}
if (stopped == 1)
{
    stopSpeed = approach(stopSpeed, stopSpeedMax, stopSpeedAcc)
    if (stopSpeed >= stopSpeedMax)
    {
        targetDirection = platformDirection
        stopped = 0
    }
}
else
    stopSpeed = approach(stopSpeed, 0, stopSpeedDecc)
