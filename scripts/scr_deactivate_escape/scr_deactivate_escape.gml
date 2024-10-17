function scr_deactivate_escape() //scr_deactivate_escape
{
    with (obj_baddie)
    {
        if (escape == 1 || under == 1 || underescape == 1)
            event_perform(ev_other, ev_room_start)
    }
    with (obj_comboend)
    {
    }
}

