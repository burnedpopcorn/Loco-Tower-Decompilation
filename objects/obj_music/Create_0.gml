room_details = [hub_start, mu_hub, mu_secrethall, 0]
unforce_cont = 0
startbgescape = false
global.lap3activate = false
force_cont = 0
pausedmusic = 0
prevmuID = -4
fadeoff = 0
global.music = 0
roomname = 0
global.mu = -4
music = -4
global.secretmusic = -4
musicID = -4
secretmusicID = -4
pillarmusicID = -4
marxpitch = 1
secret = 0
secretend = 0
pillar_on_camera = 0
prevpillar_on_camera = 0
escapetheme = true
escapemusic = mu_pizzatime
room_arr = [[Disclamer,mu_noone,mu_noone,0],[NoRoom,mu_noone,mu_noone,0],[rm_titleselect,mu_menuselect,mu_noone,0],[Titlescreen,mu_noone,mu_noone,0],[hub_start,mu_hub,mu_secrethall,0],[hub_afterstart,mu_hub,mu_secrethall,0],[hub_cafe,mu_cafe,mu_secrethall,0],[Tutori_1,mu_tutorial,mu_secrethall,0],[hub_tutorial,mu_hub,mu_secrethall,0],[hub_afterhall,mu_hub,mu_secrethall,0],[rm_test,mu_test,mu_secrethall,0],[hub_hall,mu_hub,mu_secrethall,0],[hub_forestmaze,mu_hubforestmaze,mu_secrethall,0],[forestmaze_1,mu_forestmaze,mu_secrethall,0],[hub_locotown,mu_hub2,mu_secrethall,0],[hub_lobby,mu_hub,mu_secrethall,0],[hub_lobby,mu_hub,mu_secrethall,0],[hub_3,mu_patrickdepth,mu_secrethall,0],[hub_magmamine,mu_hubmagmamine,mu_secrethall,0],[Nhall_1,mu_hall,mu_secrethall,0],[Nlocotown_1,mu_locotown,mu_secretlocotown,0],[Nlocotown_4,mu_locotown,mu_secretlocotown,1],[Nlocotown_5,mu_locotownoutside,mu_secretlocotown,1]]
global.lowpassEffect = audio_effect_create((4 << 0))
global.lowpassEffect.cutoff = 600
global.lowpassEffect.q = 0
global.lowpassEffect.bypass = 1
global.musicemitter = audio_emitter_create()
global.musicbus = audio_bus_create()
master_gain = 1
global.musicbus.effects[0] = global.lowpassEffect
audio_emitter_bus(global.musicemitter, global.musicbus)