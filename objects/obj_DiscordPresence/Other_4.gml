var roomname = room_get_name(room)
switch string_letters(roomname)
{
    case "Tutori":
        stateroom = "Tutorii Aprindus"
        break
    case "timesuproom":
        stateroom = "Uh oh! Your time is up!"
        break
    case "hubstart":
    case "hubtutorial":
    case "hubafterstart":
    case "hubafterhall":
    case "hubhall":
    case "hubhallway":
    case "hublocotown":
    case "hublobby":
    case "hub3":
    case "hubforestmaze":
    case "hubboss":
    case "hubmagmamine":
    case "hubcafe":
        stateroom = choose("In the tower...", "Enjoying the tower's hallways", "Relaxing on the tower's lobby")
        break
    case "Nhall":
    case "Nhallsecret":
        stateroom = "Hallway Longway"
        break
    case "Nlocotown":
    case "Nlocotownsecret":
        stateroom = "Loco Town"
        break
    case "rmtest":
        stateroom = "The testing room"
        break
    default:
        stateroom = "Undefined"
        break
}