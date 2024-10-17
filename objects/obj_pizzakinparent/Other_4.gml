event_inherited()
switch object_index
{
    case obj_pizzakincheese:
        if (!global.cheesefollow)
            instance_destroy()
        break
    case 303:
        if (!global.tomatofollow)
            instance_destroy()
        break
    case 305:
        if (!global.pineapplefollow)
            instance_destroy()
        break
    case 301:
        if (!global.shroomfollow)
            instance_destroy()
        break
    case 304:
        if (!global.sausagefollow)
            instance_destroy()
        break
}

