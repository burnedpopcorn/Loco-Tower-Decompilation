global.collect += 100
create_collect(x, y, sprite_index)
with (instance_create(x, y, obj_smallnumber))
    number = string(100)
global.combotime = 60
scr_soundeffect(sfx_collectpizza)
create_collect(x, y, sprite_index)
instance_destroy()
if (obj_tv.state != 8)
    tv_do_expression(1746)
