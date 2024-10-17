if (other.state == 13 || other.state == 112)
{
    with (other)
    {
        if (!grounded)
            state = 58
        else
            state = 0
    }
}
