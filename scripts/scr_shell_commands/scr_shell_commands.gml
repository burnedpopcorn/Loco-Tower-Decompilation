#region Roomnames
var i = 0;
while room_exists(i)
{
	global.roomlist[i] = room_get_name(i)
	i++
}	
#endregion		
#region	Soundnames
var n = 0;
while audio_exists(n)
{
	global.soundlist[n] = audio_get_name(n)
	n++
}	
#endregion		

///////////////

#region Toggle Collisions
function sh_reset(args) 
{
	game_restart()
}
function meta_reset() 
{
	return {
		description: "Resets game",
		arguments: [],
		suggestions: [
		],
		argumentDescriptions: [
			"Resets game"
		]
	}
}
#endregion

#region Set Combo
function sh_setcombo(args) 
{
	var arg0 = args[1]
	global.combotime = 60
	global.combo = arg0
	obj_player1.supercharge = arg0
}
function meta_setcombo() 
{
	return {
		description: "Sets your combo to the number inputted",
		arguments: ["<Combo>"],
		suggestions: [
		],
		argumentDescriptions: [
			"Combo"
		]
	}
}
#endregion

#region Set Character
function sh_setcharacter(args) 
{
	var arg0 = string(args[1])
	with obj_player1
	{
		character = arg0
		scr_characterspr()
	}
}
function meta_setcharacter() 
{
	return {
		description: "Sets your main character",
		arguments: ["<Name>"],
		suggestions: [
		],
		argumentDescriptions: [
			"Name"
		]
	}
}
#endregion

#region Set Heat
function sh_setheat() 
{
	global.heattime = 60
	global.style += (2 + global.combo)
}
function meta_setheat() 
{
	return {
		description: "Sets your heat",
		arguments: [],
		suggestions: [
		],
		argumentDescriptions: [
		]
	}
}
#endregion


#region Toggle Collisions
function sh_toggle_collisions(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !global.showcollisions
		break;		
	}	
	global.showcollisions = arg1 
	toggle_collision_function()
}
function meta_toggle_collisions() 
{
	return {
		description: "toggles collision object visibility",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles visibility"
		]
	}
}
function toggle_collision_function()
{
	if !variable_global_exists("showcollisionarray")
	{	
		var i = 0;
		global.showcollisionarray[i++] = obj_solid;
		global.showcollisionarray[i++] = obj_slope;	
		global.showcollisionarray[i++] = obj_platform;
		global.showcollisionarray[i++] = obj_slopePlatform;
		global.showcollisionarray[i++] = obj_slopePlatformskateboard;
		global.showcollisionarray[i++] = obj_sidePlatform;
		global.showcollisionarray[i++] = obj_secretblock;
		global.showcollisionarray[i++] = obj_secretbigblock;
		global.showcollisionarray[i++] = obj_secretmetalblock;
		global.showcollisionarray[i++] = obj_doorA;
		global.showcollisionarray[i++] = obj_doorB;
		global.showcollisionarray[i++] = obj_doorC;
		global.showcollisionarray[i++] = obj_doorD;
		global.showcollisionarray[i++] = obj_doorE;
		global.showcollisionarray[i++] = obj_ladder;
	}
	var array  = global.showcollisionarray
	var length = array_length(array)
	//Start from the end to the start (more optimized)

	for (var i = length - 1; i >= 0; --i)
	{
		with array[i]
		{
			if (object_index == array[i])
			{
				visible = global.showcollisions;
				image_alpha = 1;
			}
		}
	}
}
#endregion

#region
function sh_danikyo()
{
	global.danikyo = !global.danikyo
}
function meta_danikyo() 
{
	return {
		description: "danikyo",
		arguments: [],
		suggestions: [
		],
		argumentDescriptions: [
		]
	}
}
#endregion

#region
function sh_fastrank()
{
	global.lap = 1
	global.laps++
	global.secretfound = 3
}
function meta_fastrank() 
{
	return {
		description: "fast L rank",
		arguments: [],
		suggestions: [
		],
		argumentDescriptions: [
		]
	}
}
#endregion

#region
function sh_smoothcam()
{
	global.smoothcam = !global.smoothcam
}
function meta_smoothcam() 
{
	return {
		description: "makes camera smooth",
		arguments: [],
		suggestions: [
		],
		argumentDescriptions: [
		]
	}
}
#endregion

#region
function sh_anglerotation()
{
	global.anglerotation = !global.anglerotation
}
function meta_anglerotation() 
{
	return {
		description: "makes player change angle on slopes",
		arguments: [],
		suggestions: [
		],
		argumentDescriptions: [
		]
	}
}
#endregion

#region Show Message
function sh_show_message(args)
{
	var arg0 = string(args[1])
	with instance_create(0, 0, obj_transformationtext)
		message = arg0
}
function meta_show_message() 
{
	return {
		description: "show a message",
		arguments: ["<message>"],
		suggestions: [
		],
		argumentDescriptions: [
		"shows message wanted"
		]
	}
}
#endregion


#region Escape
function sh_escape(args) 
{
	var arg0 = string(args[1])
	var arg1 = args[2], arg2 = args[3], arg3 = args[4]
	
	switch arg0
	{
		case "true": 
		case "1": 
		arg0 = true 
		break;
		case "false": 
		case "0": 
		arg0 = false 
		break;
		default: 
		arg0 = !global.panic
		break;
	}
	switch arg3
	{
		case "true": 
		case "1": 
		arg3 = true 
		break;
		case "false": 
		case "0": 
		arg3 = false 
		break;
		default: 
		arg3 = !(obj_music.escapetheme)
		break;
	}
	global.panic = 0
	obj_music.escapetheme = arg3
	global.panic = arg0 
	global.minutes = real(string_digits(arg1))
	global.seconds = real(string_digits(arg2))
    global.fill = (((global.minutes * 60) + global.seconds) * 60)
    with (obj_tv)
        chunkmax = global.fill
    with (obj_chunktimer)
        fillmax = global.fill
    with (obj_escapecollect)
        image_alpha = 1
    with (obj_escapecollectbig)
        image_alpha = 1
	global.wave = 0
	global.maxwave = (((global.minutes * 60) + global.seconds) * 60)			
	obj_camera.alarm[1] = 60
}
function meta_escape() 
{
	return {
		description: "activates escape, sets escape time and decides if escape music plays",
		arguments: ["<bool>","<min>","<sec>","<theme>"],
		suggestions: [
			["true","false"],
			[],
			[],
			["true","false"]
		],
		argumentDescriptions: [
			"activate/deactivate escape",
			"set minutes",
			"set seconds",
			"activate/deactivate escape theme"
		]
	}
}

#endregion

#region Play Sound
function sh_sound_play(args) 
{
	var arg0 = asset_get_index(args[1])
	var arg1 = args[2]
	var arg2 = args[3]
	
	if asset_get_type(args[1]) != asset_sound { return "Can't find sound " + string(args[1]); }

	if asset_get_type(args[1]) == asset_sound
	{
		if arg1 = true
			audio_sound_pitch(scr_sound(arg0), arg2)
		else
			audio_sound_pitch(scr_soundeffect(arg0), arg2)
	}
}
function meta_sound_play() 
{
	return {
		description: "plays a sound",
		arguments: ["<sound>","<loop>","<pitch>"],
		suggestions: [
			global.soundlist,
			["true","false"]
		],
		argumentDescriptions: [
			"sound you want to play",
			"sound loops forever",
			"sets sound/music speed"
		]
	}
}

#endregion

#region Stop Sound
function sh_sound_stop(args) 
{
	var arg0 = asset_get_index(args[1])
	
	if asset_get_type(args[1]) != asset_sound { return "Can't find sound " + string(args[1]); }

	if asset_get_type(args[1]) == asset_sound
		audio_stop_sound(arg0)
}
function meta_sound_stop() 
{
	return {
		description: "stops a sound",
		arguments: ["<sound>"],
		suggestions: [
			global.soundlist
		],
		argumentDescriptions: [
			"sound you want to play"
		]
	}
}

#endregion

#region Debug Mode
function sh_toggle_debugmode(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !global.debugmode
		break;		
	}
	global.debugmode = arg1 
}
function meta_toggle_debugmode() 
{
	return {
		description: "toggles debugmode",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles debugmode"
		]
	}
}
#endregion

	#region Room Goto
	///commands[arrayi++] = "room_goto [roomname] [targetdoor]"
	function sh_room_goto(args) 
	{
		var arg1 = asset_get_index(args[1]), arg2 = args[2]	
		//Error Check 
		if asset_get_type(args[1]) != asset_room { return "Can't find room " + string(args[1]); } //Shamelessy took this from Ethgaming
		//Go to Room
		if asset_get_type(args[1]) = asset_room
		{
				obj_player1.targetRoom = arg1
				obj_player2.targetRoom = arg1
				obj_player1.targetDoor = arg2
				obj_player2.targetDoor = arg2
			instance_create(0, 0, obj_fadeout) 			
		}
	}
	function meta_room_goto() 
	{	
		return {
			description: "allows you to go to another room",
			arguments: ["<room>","<door>"],
			suggestions: [
				global.roomlist,
				["N/A","A","B","C","D","E"]
			],
			argumentDescriptions: [
				"sets targetRoom",
				"sets targetDoor"
			]
		}
	}	


	#endregion		
	
	#region Instance_Create
	///commands[arrayi++] = "instance_create [object] [x] [y]"
	function sh_instance_create(args) 
	{
		instance_create(args[1],args[2],asset_get_index(args[3]))
	}
	function meta_instance_create() 
	{
		return {
			description: "create an object",
			arguments: ["<x>", "<y>","<object>"],
			suggestions: [
				[],
				[],
				[]
			],
			argumentDescriptions: [
				"the X coordinate to create the object at",
				"the Y coordinate to create the object at",
				"the object to create"
			]
		}
	}

	#endregion	
	
	#region Player Set State
	function sh_player_setstate(args) 
	{
		var arg1 = string(args[1]), arg2 = args[2];
		switch arg1
		{
			case "player1": 
			case "1": 
			arg1 = obj_player1 
			break;
			case "player2": 
			case "2": 
			arg1 = obj_player2
			break;
		}	
		//Player
		with arg1
		{	
			//state
			state = arg2
		}
	}
	function meta_player_setstate() 
	{
		return {
			description: "changes state of player",
			arguments: ["<player>","<state>"],
			suggestions: [
				["player1","player2"],
				["knight"] //todo make states list or something
			],
			argumentDescriptions: [
				"changes player to change character",
				"select the character to change into"
			]
		}
	}
	#endregion		

	#region Player noclip
	function sh_noclip(args) 
	{
		var arg1 = string(args[1]);
		switch arg1
		{
			case "player1": 
			case "1": 
			arg1 = obj_player1 
			break;
			case "player2": 
			case "2": 
			arg1 = obj_player2
			break;
		}	
		//Player
		with arg1
		{	
			//noclip
			state = 111
		}
	}
	function meta_noclip() 
	{
		return {
			description: "makes player noclip",
			arguments: ["<player>"],
			suggestions: [
				["player1","player2"]
			],
			argumentDescriptions: [
				"changes player to change character",
				"select the character to change into"
			]
		}
	}
	#endregion
	
	
	#region Player collect
	function sh_player_collect(args) 
	{
		var arg1 = string(args[1]);
		global.collect = arg1
	}
	function meta_player_collect() 
	{
		return {
			description: "sets player collectibles",
			arguments: ["<player>"],
			suggestions: [
			],
			argumentDescriptions: [
				"sets the player collectibles",
			]
		}
	}
	#endregion
