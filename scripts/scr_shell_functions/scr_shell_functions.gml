function scr_shell_openconsole() //scr_shell_openconsole
{
    global.shellactivate = 1
}

function scr_shell_closeconsole() //scr_shell_closeconsole
{
    global.shellactivate = 0
}

function scr_fartcommand(argument0) //scr_fartcommand
{
    if (argument0 == undefined)
        argument0 = "BALLS"
    switch argument0
    {
        case "fart":
        case "poop":
        case "crap":
        case "fard":
        case "shart":
        case "shit":
        case "brap":
            return 1;
    }

}

function scr_shell_roomstart() //scr_shell_roomstart
{
    toggle_collision_function()
}

