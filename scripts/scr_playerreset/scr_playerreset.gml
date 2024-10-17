function scr_playerreset() //scr_playerreset
{
    with (obj_music)
    {
        secret = 0
        music = -4
        secretmusic = -4
        escapemusic = 170
        startbgescape = 0
    }
    global.lap3activate = 0
    obj_chunktimer.room_done = 0
    global.collectspecial = 0
    global.timeractive = 0
    global.wave = 0
    global.maxwave = 0
    global.secretfound = 0
    global.hurtcounter = 0
    global.snickchallenge = 0
    global.timeattack = 0
    global.comboscore = 0
    global.combodrop = 0
    global.previouscombo = 0
    if instance_exists(obj_patripi)
        instance_destroy(obj_patripi)
    if instance_exists(obj_itspizzatime)
        instance_destroy(obj_itspizzatime)
    if instance_exists(obj_zombiefollow)
        instance_destroy(obj_zombiefollow)
    obj_timeattack.stop = 0
    global.taseconds = 0
    global.taminutes = 0
    obj_player1.spotlight = 1
    obj_player2.x = -1000
    obj_player2.y = 500
    obj_player2.state = 8
    if instance_exists(obj_coopflag)
        instance_destroy(obj_coopflag)
    if instance_exists(obj_cooppointer)
        instance_destroy(obj_cooppointer)
    global.miniboss = 0
    with (obj_tv)
    {
        spritetvchanging = 998
        idlespr = -4
        changingtv = 0
        changingtvindex = 0
        changingtvspeed = 0.25
        bglevel = 0
        fadebg = 0
        alphaend = 1
        shownranka = 0
        shownrankb = 0
        shownrankc = 0
        patrickanglespeed = 0
        patrickangle = 0
        ds_list_clear(tvprompts_list)
        prompt = ""
        bubblespr = -4
        promptx = promptxstart
        sprite_index = spr_tv_off
        tvsprite = 134
        state = 0
        tv_set_idle()
    }
    global.SAGEshotgunsnicknumber = 0
    audio_stop_all()
    if instance_exists(obj_timesup)
        instance_destroy(obj_timesup)
    global.seconds = 59
    global.minutes = 1
    obj_player1.state = (0 << 0)
    obj_player1.visible = true
    ds_list_clear(global.saveroom)
    ds_list_clear(global.baddieroom)
    ds_list_clear(global.escaperoom)
    global.fill = 500
    global.chunk = 5
    global.lap = 0
    global.laps = 1
    with (obj_camera)
    {
        zoom = 1
        alphaend = 1
        gateid = 0
        gatecamera = 0
        keepsecondalarm = 0
        addseconds = 0
        gettingfilltimer = 0
        marxseconds = 15
        marxstunned = 0
        alarm[5] = -1
    }
    with (obj_player1)
    {
        upsidedown = 0
        ladderx = x
        roombefore = 36
        steppybuffer = 0
        alarm[0] = -1
        alarm[1] = -1
        alarm[3] = -1
        alarm[4] = -1
        alarm[5] = -1
        alarm[6] = -1
        alarm[7] = -1
        alarm[8] = -1
        alarm[9] = -1
        alarm[10] = -1
        parrysound = 0
        scale_xs = 1
        scale_ys = 1
        c = 0
        genomode = 0
        genotimer = 0
        genotimer_max = 0
        genodelay = 0
        genodelay_max = 0
        image_blend = make_colour_hsv(0, 0, 255)
        input_buffer_walljump = 0
        input_buffer_slap = 8
        input_attack_buffer = 0
        input_finisher_buffer = 0
        input_up_buffer = 0
        input_down_buffer = 0
        grav = 0.5
        hsp = 0
        vsp = 0
        global.playerhealth = 5
        global.highest_combo = 0
        xscale = 1
        yscale = 1
        supercharge = 0
        supercharged = 0
        x = backtohubstartx
        y = backtohubstarty
        backupweapon = 0
        shotgunAnim = 0
        box = 0
        steppy = 0
        movespeedmax = 5
        jumpstop = 0
        start_running = 1
        obj_camera.ded = 0
        visible = true
        global.panic = 0
        turn = 0
        jumpAnim = 1
        dashAnim = 1
        landAnim = 0
        machslideAnim = 0
        moveAnim = 1
        stopAnim = 1
        crouchslideAnim = 1
        crouchAnim = 1
        machhitAnim = 0
        stompAnim = 0
        inv_frames = 0
        turning = 0
        hurtbounce = 0
        hurted = 0
        autodash = 0
        mach2 = 0
        input_buffer_jump = 8
        input_buffer_secondjump = 8
        input_buffer_highjump = 8
        flash = 0
        global.key_inv = 0
        global.shroomfollow = 0
        global.cheesefollow = 0
        global.tomatofollow = 0
        global.sausagefollow = 0
        global.pineapplefollow = 0
        global.gerome = 0
        global.keyget = 0
        global.collect = 0
        global.collectN = 0
        global.ammo = 0
        global.treasure = 0
        global.combo = 0
        global.combotime = 0
        global.pizzacoin = 0
        global.toppintotal = 1
        global.hit = 0
        ini_open("saveData.ini")
        global.SAGEshotgunsnick = ini_read_string("SAGE2019", "shotgunsnick", 0)
        global.SAGEshotgunsnicknumber = 0
        global.SAGEdungeonbackup = ini_read_string("SAGE2019", "dungeonbackup", 0)
        global.SAGEsrank = ini_read_string("SAGE2019", "srank", 0)
        global.SAGEsnicksrank = ini_read_string("SAGE2019", "snicksrank", 0)
        global.SAGEcombo10 = ini_read_string("SAGE2019", "combo10", 0)
        global.SAGEsecret = ini_read_string("SAGE2019", "secret", 0)
        global.SAGEknight = ini_read_string("SAGE2019", "knight", 0)
        global.SAGEknighttaken = 0
        global.SAGEtoppin = ini_read_string("SAGE2019", "toppin", 0)
        global.SAGEtreasure = ini_read_string("SAGE2019", "treasure", 0)
        ini_close()
        in_water = 0
        key_particles = 0
        barrel = 0
        bounce = 0
        a = 0
        idle = 0
        attacking = 0
        slamming = 0
        superslam = 0
        machpunchAnim = 0
        punch = 0
        machfreefall = 0
        shoot = 1
        instakillmove = 0
        windingAnim = 0
        facestompAnim = 0
        ladderbuffer = 0
        chainsaw = 50
        toomuchalarm1 = 0
        toomuchalarm2 = 0
        dashdust = 0
        throwforce = 0
        hurtsound = 0
        idleanim = 0
        momemtum = 0
        cutscene = 0
        grabbing = 0
        dir = xscale
        goingdownslope = 0
        goingupslope = 0
        fallinganimation = 0
        bombpeptimer = 100
        slapbuffer = 0
        slaphand = 1
        suplexmove = 0
        suplexhavetomash = 0
        timeuntilhpback = 300
        anger = 0
        angry = 0
        canthspmove = 0
        cantvspmove = 0
    }
    with (obj_player2)
    {
        alarm[0] = -1
        alarm[1] = -1
        alarm[3] = -1
        alarm[4] = -1
        alarm[5] = -1
        alarm[6] = -1
        alarm[7] = -1
        alarm[8] = -1
        alarm[9] = -1
        alarm[10] = -1
        grav = 0.5
        hsp = 0
        vsp = 0
        global.playerhealth = 5
        xscale = 1
        yscale = 1
        x = backtohubstartx
        y = backtohubstarty
        backupweapon = 0
        shotgunAnim = 0
        box = 0
        steppy = 0
        movespeedmax = 5
        jumpstop = 0
        start_running = 1
        obj_camera.ded = 0
        visible = true
        global.panic = 0
        turn = 0
        jumpAnim = 1
        dashAnim = 1
        landAnim = 0
        machslideAnim = 0
        moveAnim = 1
        stopAnim = 1
        crouchslideAnim = 1
        crouchAnim = 1
        machhitAnim = 0
        stompAnim = 0
        inv_frames = 0
        turning = 0
        hurtbounce = 0
        hurted = 0
        autodash = 0
        mach2 = 0
        input_buffer_jump = 8
        input_buffer_secondjump = 8
        input_buffer_highjump = 8
        flash = 0
        global.key_inv = 0
        global.shroomfollow = 0
        global.cheesefollow = 0
        global.tomatofollow = 0
        global.sausagefollow = 0
        global.pineapplefollow = 0
        global.keyget = 0
        global.collect = 0
        global.collectN = 0
        global.ammo = 0
        global.treasure = 0
        global.combo = 0
        global.combotime = 0
        global.pizzacoin = 0
        global.toppintotal = 1
        global.hit = 0
        ini_open("saveData.ini")
        global.SAGEshotgunsnick = ini_read_string("SAGE2019", "shotgunsnick", 0)
        global.SAGEshotgunsnicknumber = 0
        global.SAGEdungeonbackup = ini_read_string("SAGE2019", "dungeonbackup", 0)
        global.SAGEsrank = ini_read_string("SAGE2019", "srank", 0)
        global.SAGEsnicksrank = ini_read_string("SAGE2019", "snicksrank", 0)
        global.SAGEcombo10 = ini_read_string("SAGE2019", "combo10", 0)
        global.SAGEsecret = ini_read_string("SAGE2019", "secret", 0)
        global.SAGEknight = ini_read_string("SAGE2019", "knight", 0)
        global.SAGEknighttaken = 0
        global.SAGEtoppin = ini_read_string("SAGE2019", "toppin", 0)
        global.SAGEtreasure = ini_read_string("SAGE2019", "treasure", 0)
        ini_close()
        in_water = 0
        key_particles = 0
        barrel = 0
        bounce = 0
        a = 0
        idle = 0
        attacking = 0
        slamming = 0
        superslam = 0
        machpunchAnim = 0
        punch = 0
        machfreefall = 0
        shoot = 1
        instakillmove = 0
        windingAnim = 0
        facestompAnim = 0
        ladderbuffer = 0
        chainsaw = 50
        toomuchalarm1 = 0
        toomuchalarm2 = 0
        dashdust = 0
        throwforce = 0
        hurtsound = 0
        idleanim = 0
        momemtum = 0
        cutscene = 0
        grabbing = 0
        dir = xscale
        goingdownslope = 0
        goingupslope = 0
        fallinganimation = 0
        bombpeptimer = 100
        slapbuffer = 0
        slaphand = 1
        suplexmove = 0
        suplexhavetomash = 0
        timeuntilhpback = 300
        anger = 0
        angry = 0
    }
    instance_destroy(obj_followcharacter)
    global.style = 0
    global.stylethreshold = 0
    global.stylemultiplier = 0
    global.baddiespeed = 1
}

