if toppin_has[ii]
{
    toppin_index[ii] = 1
    scr_soundeffect(sfx_pizzacoin)
}
else
{
    topping_shake[ii] = 3
    scr_soundeffect(sfx_stompenemy)
}
if (ii < 4)
{
    ii += 1
    alarm[0] = 50
}
if (ii == 4)
    alarm[1] = 100
