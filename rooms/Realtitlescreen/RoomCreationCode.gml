pal_swap_init_system(7)
ini_open("saveData.ini")
global.deserthighscore = 0
global.mansionhighscore = ini_read_string("Highscore", "mansion", 0)
global.factoryhighscore = ini_read_string("Highscore", "factory", 0)
global.sewerhighscore = ini_read_string("Highscore", "sewer", 0)
global.freezerhighscore = ini_read_string("Highscore", "freezer", 0)
global.entrancehighscore = ini_read_string("Highscore", "entrance", 0)
global.medievalhighscore = ini_read_string("Highscore", "medieval", 0)
global.tutorialhighscore = ini_read_string("Highscore", "tutorial", 0)
global.deserttoppin1 = ini_read_string("Toppin", "desert1", 0)
global.deserttoppin2 = ini_read_string("Toppin", "desert2", 0)
global.deserttoppin3 = ini_read_string("Toppin", "desert3", 0)
global.deserttoppin4 = ini_read_string("Toppin", "desert4", 0)
global.deserttoppin5 = ini_read_string("Toppin", "desert5", 0)
global.mansiontoppin1 = ini_read_string("Toppin", "mansion1", 0)
global.mansiontoppin2 = ini_read_string("Toppin", "mansion2", 0)
global.mansiontoppin3 = ini_read_string("Toppin", "mansion3", 0)
global.mansiontoppin4 = ini_read_string("Toppin", "mansion4", 0)
global.mansiontoppin5 = ini_read_string("Toppin", "mansion5", 0)
global.factorytoppin1 = ini_read_string("Toppin", "factory1", 0)
global.factorytoppin2 = ini_read_string("Toppin", "factory2", 0)
global.factorytoppin3 = ini_read_string("Toppin", "factory3", 0)
global.factorytoppin4 = ini_read_string("Toppin", "factory4", 0)
global.factorytoppin5 = ini_read_string("Toppin", "factory5", 0)
global.sewertoppin1 = ini_read_string("Toppin", "sewer1", 0)
global.sewertoppin2 = ini_read_string("Toppin", "sewer2", 0)
global.sewertoppin3 = ini_read_string("Toppin", "sewer3", 0)
global.sewertoppin4 = ini_read_string("Toppin", "sewer4", 0)
global.sewertoppin5 = ini_read_string("Toppin", "sewer5", 0)
global.freezertoppin1 = ini_read_string("Toppin", "freezer1", 0)
global.freezertoppin2 = ini_read_string("Toppin", "freezer2", 0)
global.freezertoppin3 = ini_read_string("Toppin", "freezer3", 0)
global.freezertoppin4 = ini_read_string("Toppin", "freezer4", 0)
global.freezertoppin5 = ini_read_string("Toppin", "freezer5", 0)
global.entrancetoppin1 = ini_read_string("Toppin", "entrance1", 0)
global.entrancetoppin2 = ini_read_string("Toppin", "entrance2", 0)
global.entrancetoppin3 = ini_read_string("Toppin", "entrance3", 0)
global.entrancetoppin4 = ini_read_string("Toppin", "entrance4", 0)
global.entrancetoppin5 = ini_read_string("Toppin", "entrance5", 0)
global.medievaltoppin1 = ini_read_string("Toppin", "medieval1", 0)
global.medievaltoppin2 = ini_read_string("Toppin", "medieval2", 0)
global.medievaltoppin3 = ini_read_string("Toppin", "medieval3", 0)
global.medievaltoppin4 = ini_read_string("Toppin", "medieval4", 0)
global.medievaltoppin5 = ini_read_string("Toppin", "medieval5", 0)
ini_close()
global.rank = "none"
global.tutorialrank = "none"
global.entrancerank = "none"
global.medievalrank = "none"
global.cheateaurank = "none"
global.ruinrank = "none"
global.dungeonrank = "none"
global.strongcoldrank = "none"
global.snickchallengerank = "none"
room_goto(Disclamer)
gamesave_async_load()
obj_player1.state = 0