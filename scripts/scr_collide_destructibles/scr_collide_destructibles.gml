function scr_collide_destructibles() //scr_collide_destructibles
{
    with (obj_player1)
    {
        if (state == 44 || state == 117)
        {
            if place_meeting((x + hsp), y, obj_ratblock)
            {
                with (instance_place((x + hsp), y, obj_ratblock))
                    instance_destroy()
            }
        }
        if (state == 68 || state == 91 || state == 117 || state == 37 || state == 18 || state == 2 || state == 9)
        {
            if place_meeting((x + hsp), y, obj_destructibles)
            {
                with (instance_place((x + hsp), y, obj_destructibles))
                    instance_destroy()
                if (state == 70)
                    machpunchAnim = 1
            }
            if place_meeting((x + hsp), y, obj_hungrypillar)
            {
                with (instance_place((x + hsp), y, obj_hungrypillar))
                {
                    hitLag = 10000
                    hitX = x
                    hitY = y
                    state = 1
                    scr_soundeffect(sfx_punch)
                    obj_camera.zoom = 0.5
                    obj_camera.spdzooming = 0.035
                }
                if (state == 70)
                    machpunchAnim = 1
                tauntstoredstate = state
                tauntstoredsprite = sprite_index
                tauntstoredmovespeed = movespeed
                tauntstoredvsp = vsp
                state = 33
                hitLag = 10000
                hitX = x
                hitY = y
            }
        }
        if (state == 44)
        {
            with (obj_destroyablebigskateboard)
            {
                if place_meeting((x - obj_player1.hsp), y, obj_player1)
                {
                    with (obj_player1)
                        instance_destroy(other)
                }
            }
        }
        if (state == 22 || state == 114 || state == 44 || state == 70 || (state == 47 && sprite_index == spr_player_Sjumpcancel))
        {
            with (obj_destructibles)
            {
                if place_meeting((x - obj_player1.hsp), y, obj_player1)
                {
                    with (obj_player1)
                        instance_destroy(other)
                }
            }
            with (obj_hungrypillar)
            {
                if place_meeting((x - obj_player1.hsp), y, obj_player1)
                {
                    hitLag = 10000
                    hitX = x
                    hitY = y
                    state = 1
                    scr_soundeffect(sfx_punch)
                    obj_camera.zoom = 0.5
                    obj_camera.spdzooming = 0.035
                    with (obj_player1)
                    {
                        tauntstoredstate = state
                        tauntstoredsprite = sprite_index
                        tauntstoredmovespeed = movespeed
                        tauntstoredvsp = vsp
                        state = 33
                        hitLag = 10000
                        hitX = x
                        hitY = y
                    }
                }
            }
        }
        if (state == 73 && thrown == 1)
        {
            if place_meeting((x - hsp), y, obj_destructibles)
            {
                with (instance_place((x - hsp), y, obj_destructibles))
                    instance_destroy()
            }
        }
        if ((state == 24 || state == 43 || state == 9) && vsp > 0)
        {
            if place_meeting(x, (y + 1), obj_destructibles)
            {
                with (instance_place(x, (y + 1), obj_destructibles))
                    instance_destroy()
            }
        }
        if place_meeting(x, (y + 1), obj_destructibleplatform)
        {
            with (instance_place(x, (y + 1), obj_destructibleplatform))
            {
                falling = 1
                if (falling == 1)
                    image_speed = 0.35
            }
        }
        if (vsp <= 0.5 && (state == 58 || state == 17 || (state == 47 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)) || state == 6 || state == 63 || state == 70 || state == 91))
        {
            var vy = -1
            if (state == 47 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
                vy = vsp
            if place_meeting(x, (y + vy), obj_destructibles)
            {
                with (instance_place(x, (y + vy), obj_destructibles))
                {
                    instance_destroy()
                    with (other.id)
                    {
                        if (state != 63 && state != 17 && state != 47)
                            vsp = 0
                    }
                }
            }
        }
        if (vsp >= 0 && (state == 74 || state == 77))
        {
            if place_meeting(x, ((y + vsp) + 2), obj_destructibles)
            {
                with (instance_place(x, ((y + vsp) + 2), obj_destructibles))
                    instance_destroy()
            }
        }
        if (state == 74 || state == 77)
        {
            if (place_meeting(x, (y + 1), obj_metalblock) && freefallsmash >= 10)
            {
                with (instance_place(x, (y + 1), obj_metalblock))
                    instance_destroy()
            }
        }
        if (state == 63 && sprite_index == spr_player_presentbox)
        {
            if place_meeting(x, (y - 1), obj_metalblock)
            {
                with (instance_place(x, (y - 1), obj_metalblock))
                    instance_destroy()
            }
        }
    }
    with (obj_player2)
    {
        if (state == 73 && thrown == 1)
        {
            if place_meeting((x - hsp), y, obj_destructibles)
            {
                with (instance_place((x - hsp), y, obj_destructibles))
                    instance_destroy()
            }
        }
        if (state == 70 || state == 91 || state == 37 || state == 18 || state == 2 || state == 9)
        {
            if place_meeting((x + hsp), y, obj_destructibles)
            {
                with (instance_place((x + hsp), y, obj_destructibles))
                    instance_destroy()
                if (state == 70)
                    machpunchAnim = 1
            }
        }
        if ((state == 24 || state == 43 || state == 9) && vsp > 0)
        {
            if place_meeting(x, (y + 1), obj_destructibles)
            {
                with (instance_place(x, (y + 1), obj_destructibles))
                    instance_destroy()
            }
        }
        if place_meeting(x, (y + 1), obj_destructibleplatform)
        {
            with (instance_place(x, (y + 1), obj_destructibleplatform))
            {
                falling = 1
                if (falling == 1)
                    image_speed = 0.35
            }
        }
        if (vsp <= 0.5 && (state == 58 || state == 17 || state == 6 || state == 63 || state == 70 || state == 91))
        {
            if place_meeting(x, (y - 1), obj_destructibles)
            {
                with (instance_place(x, (y - 1), obj_destructibles))
                {
                    instance_destroy()
                    with (other.id)
                    {
                        if (state != 63 && state != 17)
                            vsp = 0
                    }
                }
            }
        }
        if (vsp >= 0 && (state == 74 || state == 77))
        {
            if place_meeting(x, ((y + vsp) + 2), obj_destructibles)
            {
                with (instance_place(x, ((y + vsp) + 2), obj_destructibles))
                {
                    with (obj_player2)
                    {
                        if place_meeting(x, ((y + vsp) + 2), obj_bigdestructibles)
                        {
                            if (shotgunAnim == 0)
                                sprite_index = spr_bodyslamland
                            else
                                sprite_index = spr_shotgunjump2
                            state = 77
                            image_index = 0
                        }
                    }
                    instance_destroy()
                }
            }
        }
        if (state == 74 || state == 77)
        {
            if (place_meeting(x, (y + 1), obj_metalblock) && freefallsmash > 10)
            {
                with (instance_place(x, (y + 1), obj_metalblock))
                    instance_destroy()
            }
        }
        if (state == 22)
        {
            with (obj_destructibles)
            {
                if place_meeting((x - obj_player2.hsp), y, obj_player2)
                {
                    with (obj_player2)
                    {
                        if place_meeting((x + hsp), y, obj_bigdestructibles)
                        {
                            if (shotgunAnim == 0)
                            {
                                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                                image_index = 0
                                state = 57
                                movespeed = 3
                                vsp = -3
                                instance_destroy(other.id)
                            }
                            else
                            {
                                state = 38
                                image_index = 0
                                sprite_index = spr_shotgunshoot
                                if (character == "P")
                                {
                                    instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet)
                                    with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
                                        spdh = 4
                                    with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
                                        spdh = -4
                                }
                                instance_destroy(other.id)
                            }
                        }
                        else if (other.object_index != obj_bigdestructibles)
                            instance_destroy(other.id)
                    }
                }
            }
        }
    }
}

