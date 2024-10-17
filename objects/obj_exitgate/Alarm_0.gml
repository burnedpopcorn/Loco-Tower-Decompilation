if (!instance_exists(obj_endlevelfade))
{
    with (instance_create(x, y, obj_endlevelfade))
    {
        if (room != Tutori_1)
            alarm[0] = 680
        if (room != Tutori_1)
        {
            if (global.rank == "p")
                rankmu = scr_soundeffect(mu_rankl)
            if (global.rank == "s")
                rankmu = scr_soundeffect(mu_ranks)
            if (global.rank == "a")
                rankmu = scr_soundeffect(mu_ranka)
            if (global.rank == "b")
                rankmu = scr_soundeffect(mu_rankb)
            if (global.rank == "c")
                rankmu = scr_soundeffect(mu_rankc)
            if (global.rank == "d")
                rankmu = scr_soundeffect(mu_rankc)
        }
    }
}
