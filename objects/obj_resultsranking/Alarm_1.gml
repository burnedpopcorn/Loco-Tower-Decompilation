if (pointsmax < global.collect)
{
    if (global.collect >= 1000)
        pointsmax += 100
    else
        pointsmax += 10
    shakepoints = 3
    alarm[1] = 2
}
if (pointsmax == global.collect)
{
    shakepoints = 3
    alarm[2] = 100
}
