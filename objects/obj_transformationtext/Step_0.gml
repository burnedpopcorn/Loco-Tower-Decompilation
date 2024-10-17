if (ended == 0)
    alpha = Approach(alpha, 1, 0.2)
if (ended == 1)
{
    alpha = Approach(alpha, 0, 0.02)
    if (alpha == 0)
        instance_destroy()
}
