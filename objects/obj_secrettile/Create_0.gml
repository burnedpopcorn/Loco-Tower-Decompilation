alpha = 1
depth = -8
tiles[0] = array_create(0)
tiles[1] = array_create(0)
tiles[2] = array_create(0)
for (var i = 0; i < 3; i++)
{
    var lay_id = layer_get_id(concat("Tiles_Secret", (i + 1)))
    tilemap_sprite[i] = -4
    if (lay_id != -1)
    {
        var map_id = layer_tilemap_get_id(lay_id)
        var ts = tilemap_get_tileset(map_id)
        var t = -4
        switch ts
        {
            case 3:
                t = spr_halltile
                break
            case 59:
                t = tile_tutorialmii
                break
            case 55:
                t = tile_hub
                break
            case 58:
                t = tile_hubtower
                break
        }

        tilemap_sprite[i] = t
        var _w32 = (sprite_get_width(t) / 32)
        for (var yy = 0; yy < image_yscale; yy++)
        {
            for (var xx = 0; xx < image_xscale; xx++)
            {
                var _x = (x + (xx * 32))
                var _y = (y + (yy * 32))
                var data = tilemap_get_at_pixel(map_id, _x, _y)
                var _id = tile_get_index(data)
                var xi = 0
                var yi = 0
                for (var j = 0; j < _id; j++)
                {
                    xi++
                    if (xi >= _w32)
                    {
                        xi = 0
                        yi++
                    }
                }
                array_push(tiles[i], [_x, _y, (xi * 32), (yi * 32)])
                data = tile_set_empty(data)
                tilemap_set_at_pixel(map_id, data, _x, _y)
            }
        }
    }
}
trace(tilemap_sprite)
if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
    instance_destroy()
