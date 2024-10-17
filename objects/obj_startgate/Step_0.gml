drawing = place_meeting(x, y, obj_player)
eggsprite[0] = (secret_count >= 1 ? 348 : 939)
eggsprite[1] = (secret_count >= 2 ? 348 : 939)
eggsprite[2] = (secret_count >= 3 ? 348 : 939)
if place_meeting(x, y, obj_doorA)
    targetdoorhub = "A"
if place_meeting(x, y, obj_doorB)
    targetdoorhub = "B"
if place_meeting(x, y, obj_doorC)
    targetdoorhub = "C"
if place_meeting(x, y, obj_doorD)
    targetdoorhub = "D"
if place_meeting(x, y, obj_doorE)
    targetdoorhub = "E"
if place_meeting(x, y, obj_player)
    image_speed = 0.35
else
{
    image_speed = 0
    image_index = 0
}
if (distance_to_object(obj_player) < 50)
    gateactivate = 1
else
    gateactivate = 0
if (gateactivate == 1)
{
    with (obj_camera)
    {
        gateid = other.id
        gatecamera = 1
    }
}
if (gateactivate == 0 && obj_camera.gateid == id && obj_camera.gatecamera == 1)
    obj_camera.gatecamera = 0
switch level
{
    case "tutorial":
        sprite_index = spr_gatetutorial
        bgdraw1 = 473
        break
    case "hall":
        sprite_index = spr_gatehall
        bgdraw1 = 445
        break
    case "locotown":
        sprite_index = spr_gatelocotown
        break
    case "forestmaze":
        sprite_index = spr_gatehall
        break
}

var fadeRange = 60
var fadeThresh = 4
var playerDis = distance_to_object(obj_player1)
alphagate = (-((((fadeThresh + fadeRange) - playerDis) / fadeRange)))
gatebgfill1 -= 0.6
if (gatebgfill1 < -192)
    gatebgfill1 = 0
gatebgfill2 -= 0.3
if (gatebgfill2 < -192)
    gatebgfill2 = 0
