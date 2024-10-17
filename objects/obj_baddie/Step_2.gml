if (state == 109)
    scr_enemy_grabbed()
if (state == 43)
    scr_enemy_lungeattack()
if (obj_player1.state != 120 && obj_player1.state != 33 && obj_player1.state != 22 && state != 43 && state != 105 && lunged)
    lunged = 0
if (state != 109 && state != 126)
{
    scr_collision()
    if (yscale == -1)
        yscale = 1
}
xscale = Approach(xscale, 1, 0.07)
if (yscale != -1)
    yscale = Approach(yscale, 1, 0.07)
if (invtime > 0)
    invtime--
if (y > (room_height + 100))
    instance_destroy()
if (thrown && (x > (room_width + 100) || x < -100 || y < -100))
    instance_destroy()
if (state == 102)
    image_speed = (0.35 + (global.baddiespeed * 0.05))
if (obj_player1.baddiegrabbedID == id && state == 109)
    persistent = 1
else
    persistent = 0
switch object_index
{
    case obj_waddledee:
        if (floor(image_index) == (image_number - 1) && sprite_index == walkspr)
            instance_create((x - (image_xscale * 20)), (y + 43), obj_cloudeffect)
        break
}

