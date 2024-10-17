var _score = global.collect
if (_score >= global.srank)
{
    if (global.lap && global.secretfound >= 3 && global.treasure && (!global.combodrop))
        ranking = "L"
    else
        ranking = "S"
}
else if (_score >= global.arank)
    ranking = "A"
else if (_score >= global.brank)
    ranking = "B"
else if (_score >= global.crank)
    ranking = "C"
else
    ranking = "D"
if (stateroom != "Undefined" && stateroom != "Tutorii Aprindus" && stateroom != "On the hub...")
    np_setpresence(((("Points: " + string(global.collect)) + " / Rank: ") + string(ranking)), stateroom, "loco-discord", "")
else
    np_setpresence("", stateroom, "loco-discord", "")
np_update()