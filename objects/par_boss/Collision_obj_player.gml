var _player = other.id
if ds_map_empty(player_hurtstates)
{
}
if (!attacking)
{
    if (!invincible)
    {
        var s = ds_map_find_value(player_hurtstates, _player.state)
        if (!is_undefined(s))
        {
            lastplayerid = _player
            invincible = 1
            inv_timer = inv_max
            s.s.boss_hurt(_player, self)
        }
    }
}
else
{
    var sb = ds_map_find_value(boss_hurtstates, state)
    if ((!is_undefined(sb)) && state != 33 && state != 138)
    {
        sb.sb.player_hurt(_player, self)
        lastplayerid = _player
    }
}
