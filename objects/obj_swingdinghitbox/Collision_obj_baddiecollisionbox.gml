with (other.id)
{
    if (instance_exists(baddieID) && baddieID.state != 109)
    {
        if (other.playerid == 148)
            baddieID.grabbedby = 1
        if (other.playerid == 147)
            baddieID.grabbedby = 2
        instance_destroy()
        instance_destroy(baddieID)
    }
}
