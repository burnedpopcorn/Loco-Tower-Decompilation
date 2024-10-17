ini_open_from_string(obj_savesystem.ini_str)
rank = ini_read_string("Ranks", string(level), 0)
highscore = ini_read_real("Highscore", string(level), 0)
laps = ini_read_string("Laps", string(level), 0)
secret_count = ini_read_string("Secret", string(level), 0)
toppin[0] = ini_read_real("Toppin", (string(level) + "1"), 0)
toppin[1] = ini_read_real("Toppin", (string(level) + "2"), 0)
toppin[2] = ini_read_real("Toppin", (string(level) + "3"), 0)
toppin[3] = ini_read_real("Toppin", (string(level) + "4"), 0)
toppin[4] = ini_read_real("Toppin", (string(level) + "5"), 0)
if (level != "tutorial")
    global.pointstotal += ini_read_real("Highscore", string(level), 0)
ini_close()
eggsprite[0] = (secret_count >= 1 ? 348 : 939)
eggsprite[1] = (secret_count >= 2 ? 348 : 939)
eggsprite[2] = (secret_count >= 3 ? 348 : 939)
if (level != "tutorial")
{
    for (var n = 0; n < array_length(durationspeed); n++)
    {
        with (instance_create(x, y, obj_eggate))
        {
            gateid = other.id
            depthplus = other.depthegg[n]
            durationspeed = other.durationspeed[n]
            durationspeedy = other.durationspeedy[n]
            eggsprite = other.eggsprite[n]
        }
    }
}
