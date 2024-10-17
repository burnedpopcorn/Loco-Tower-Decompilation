if (other.state == 13 || other.state == 112 || other.state == 117 || other.state == 44)
{
    with (other)
    {
        instance_create(x, y, obj_genericpoofeffect)
        if (!grounded)
            state = 58
        else
            state = (0 << 0)
    }
}
