with (other)
{
    if (!parried)
    {
        parried = 1
        alarm[1] = 40
        obj_camera.zoom = 0.7
        obj_camera.spdzooming = 0.035
    }
}
if (!collisioned)
    event_user(1)
