if (object_index == obj_player1)
{
    with (obj_secretportal)
    {
        if secret
        {
            if (!instance_exists(obj_ghostcollectibles))
            {
                instance_create(0, 0, obj_ghostcollectibles)
                trace(instance_number(obj_ghostcollectibles))
            }
        }
        if instance_exists(obj_specialdoor)
            state = 110
    }
    if (global.coop == 1)
        scr_changetoppings()
    if (object_index == obj_player2 && obj_player1.spotlight == 1 && global.coop == 1)
    {
        alarm[5] = 2
        alarm[7] = 60
        hurted = 1
    }
    if (object_index == obj_player1 && obj_player1.spotlight == 0)
    {
        alarm[5] = 2
        alarm[7] = 60
        hurted = 1
    }
    if (object_index != obj_player2 || global.coop == 1)
    {
        if (targetDoor == "A" && instance_exists(obj_doorA))
        {
            with (obj_doorA)
                scr_startdoor()
            hallway = 0
            vhallway = 0
            box = 0
            fastpizzabox = 0
        }
        if (targetDoor == "B" && instance_exists(obj_doorB))
        {
            with (obj_doorB)
                scr_startdoor()
            hallway = 0
            vhallway = 0
            box = 0
            fastpizzabox = 0
        }
        if (targetDoor == "C" && instance_exists(obj_doorC))
        {
            with (obj_doorC)
                scr_startdoor()
            hallway = 0
            vhallway = 0
            box = 0
            fastpizzabox = 0
        }
        if (targetDoor == "D" && instance_exists(obj_doorD))
        {
            with (obj_doorD)
                scr_startdoor()
            hallway = 0
            vhallway = 0
            box = 0
            fastpizzabox = 0
        }
        if (targetDoor == "E" && instance_exists(obj_doorE))
        {
            with (obj_doorE)
                scr_startdoor()
            hallway = 0
            vhallway = 0
            box = 0
            fastpizzabox = 0
        }
        if (targetDoor == "ELEVATOR" && instance_exists(obj_doorELEVATOR))
        {
            with (obj_doorELEVATOR)
                scr_startdoor()
            hallway = 0
            vhallway = 0
            box = 0
            fastpizzabox = 0
        }
    }
    roomstartx = x
    roomstarty = y
}
