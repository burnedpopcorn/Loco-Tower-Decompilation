if (marxseconds <= 0)
{
    marxstunned = 0
    if (!instance_exists(obj_marx))
        instance_create(obj_player1.x, obj_player1.y, obj_marx)
}
else
{
    marxseconds--
    alarm[5] = 60
}
