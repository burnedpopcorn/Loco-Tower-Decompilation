scr_initinput()
scr_collision_init()
spritereal = 1540
global.saveroom = ds_list_create()
global.escaperoom = ds_list_create()
global.followerlist = ds_list_create()
global.instancelist = ds_list_create()
global.currentsavefile = 1
global.leveltosave = 0
global.lap = 0
global.laps = 1
global.option_vibration = 0
global.collectspecial = 0
global.collectspecialmax = 10
global.combodrop = 0
genomode = 0
genotimer = 0
genotimer_max = 0
genodelay = 0
genodelay_max = 0
can_jump = 0
coyote_time = 0
Doublejump = 0
lunge_hits = 0
parrysound = 0
breakdance_pressed = 0
breakdance_speed = 0.25
notecreate = 10
ladderx = x
lasthub = 36
lastdoorhub = "C"
TUx = 0
TUy = 0
grabclimbbuffer = 0
steppybuffer = 0
storedvsp = 0
roombefore = 39
styledtaunting = 0
styledtaunts = 0
roomafter = 0
c = 0
fastpizzabox = 0
vhallway = 0
vhallwaydirection = 0
vhallwayoffset = 0
hallwayoffset = 0
flamecloud_buffer = 0
input_buffer_walljump = 0
input_buffer_slap = 8
input_attack_buffer = 0
input_finisher_buffer = 0
input_up_buffer = 0
input_down_buffer = 0
supercharge = 0
superchargecombo_buffer = -1
supercharged = 0
superchargedeffectid = 291
used_supercharge = 0
tauntstoredvsp = 0
baddiegrabbedIDkeep = 0
angle = 0
grav = 0.5
hsp = 0
vsp = 0
hitX = x
hitY = y
X = hitX
Y = hitY
hitLag = 0
global.playerhealth = 5
parry = 0
parry_inst = -4
taunt_to_parry_max = 10
parry_count = 0
parry_max = 8
xscale = 1
yscale = 1
facehurt = 0
steppy = 0
mach4mode = 0
railmovespeed = 0
raildir = 1
depth = -7
enemyindex = 0
crouchslipbuffer = 0
sjumpvsp = -12
movespeed = 19
jumpstop = 0
lastTargetDoor = 0
secretportalID = 0
verticalbuffer = 0
scale_xs = 1
scale_ys = 1
swingdingendcooldown = 0
visible = true
state = 8
jumpAnim = 1
landAnim = 0
machslideAnim = 0
moveAnim = 1
stopAnim = 1
crouchslideAnim = 1
crouchAnim = 1
machhitAnim = 0
stompAnim = 0
inv_frames = 0
hurted = 0
autodash = 0
mach2 = 0
input_buffer_jump = 8
input_buffer_secondjump = 8
input_buffer_highjump = 8
player_x = x
player_y = y
targetRoom = 0
targetDoor = "A"
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
global.treasure = 0
global.combo = 0
global.highest_combo = 0
global.combotime = 0
global.comboscore = 0
global.previouscombo = 0
global.savedcombo = 0
global.pizzacoin = 0
global.toppintotal = 1
global.hit = 0
global.baddieroom = ds_list_create()
global.gotshotgun = 0
key_particles = 0
barrel = 0
bounce = 0
a = 0
idle = 0
attacking = 0
slamming = 0
superslam = 0
grounded = 1
grinding = 0
machpunchAnim = 0
punch = 0
machfreefall = 0
shoot = 1
instakillmove = 0
windingAnim = 0
facestompAnim = 0
ladderbuffer = 0
toomuchalarm1 = 0
toomuchalarm2 = 0
toomuchalarm3 = 0
transeffect = 0
idleanim = 0
momemtum = 0
cutscene = 0
grabbing = 0
dir = xscale
shotgunAnim = 0
goingdownslope = 0
goingupslope = 0
fallinganimation = 0
bombpeptimer = 100
suplexmove = 0
suplexhavetomash = 0
anger = 0
angry = 0
baddiegrabbedID = 0
spr_palette = 440
character = "P"
scr_characterspr()
paletteselect = 1
global.panic = 0
global.snickchallenge = 0
colorchange = 0
treasure_x = 0
treasure_y = 0
treasure_room = 0
wallspeed = 0
tauntstoredstate = 0
tauntstoredmovespeed = 6
tauntstoredsprite = 538
tauntstoredindex = 0
taunttimer = 20
global.golfhit = 0
ini_open("saveData.ini")
global.option_fullscreen = ini_read_real("Option", "fullscreen", 1)
global.option_resolution = ini_read_real("Option", "resolution", 1)
global.option_language = ini_read_string("Option", "language", 0)
global.option_master_volume = ini_read_real("Option", "master_volume", 1)
global.option_music_volume = ini_read_real("Option", "music_volume", 1)
global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1)
global.smoothcam = ini_read_real("Option", "smoothcamera", 0)
global.anglerotation = ini_read_real("Option", "anglerotation", 0)
global.danikyo = ini_read_real("Option", "danikyo", 0)
global.unfocus = ini_read_real("Option", "unfocus", 1)
ini_close()
if (global.option_fullscreen == 0)
    window_set_fullscreen(true)
if (global.option_fullscreen == 1)
    window_set_fullscreen(false)
if (global.option_resolution == 0)
    window_set_size(480, 270)
if (global.option_resolution == 1)
    window_set_size(960, 540)
if (global.option_resolution == 2)
    window_set_size(1920, 1080)
set_master_gain(global.option_master_volume)
backtohubstartx = x
backtohubstarty = y
backtohubroom = 0
global.style = 0
slapcharge = 0
slaphand = 1
slapbuffer = 8
slapflash = 0
freefallsmash = 0
costumercutscenetimer = 0
heavy = 0
lastroom_x = 0
lastroom_y = 0
lastroom = 0
hallway = 0
hallwaydirection = 0
box = 0
roomstartx = 0
roomstarty = 0
global.secretfound = 0
global.shotgunammo = 0
swingdingbuffer = 0
lastmove = 0
backupweapon = 0
ini_open("saveData.ini")
if (!ini_section_exists("SAGE2019"))
{
    ini_write_string("SAGE2019", "shotgunsnick", 0)
    ini_write_string("SAGE2019", "dungeonbackup", 0)
    ini_write_string("SAGE2019", "srank", 0)
    ini_write_string("SAGE2019", "snicksrank", 0)
    ini_write_string("SAGE2019", "combo10", 0)
    ini_write_string("SAGE2019", "secret", 0)
    ini_write_string("SAGE2019", "knight", 0)
    ini_write_string("SAGE2019", "toppin", 0)
    ini_write_string("SAGE2019", "treasure", 0)
}
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
stickpressed = 0
spotlight = 1
macheffect = 0
chargeeffectid = 291
dashcloudid = 291
crazyruneffectid = 291
fightball = 0
superslameffectid = 291
speedlineseffectid = 291
angryeffectid = 291
global.coop = 0
thrown = 0
mach1snd = -1
mach2snd = -1
machrollsnd = -1
mach3snd = -1
knightslide = -1
bombpep1snd = -1
mach4snd = -1
tumble2snd = -1
tumble1snd = -1
tumble3snd = -1
superjumpholdsnd = -1
superjumpprepsnd = -1
mach2jumpsnd = -1
suplexdashsnd = -1
divesnd = -1
groundpoundloopsnd = -1
cantvspmove = 0
canthspmove = 0
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¿?.:1234567890ÁÉÍÓÚ", 1, 0)
global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", 1, 0)
global.scorefont = font_add_sprite_ext(spr_font_collectds, "0123456789", 1, 0)
global.collectfontds = font_add_sprite_ext(spr_font_collectds, "0123456789", 1, 0)
global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", 1, 0)
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!.:?1234567890ÁÉÍÓÚ", 1, 0)
global.smallerfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!.,_1234567890:?", 1, 0)
global.smallnumber = font_add_sprite_ext(spr_smallnumber, "1234567890", 1, 0)
global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 2)
global.stylelock = 0
global.heattime = 0
global.stylethreshold = 0
model = 0
