#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index = spr_detectormask
image_speed = 0;
initialy = y
initialx = x
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[channelid])
{
    if active = -(inverted) {
        if inview() sound("itemgateopen",0,speedam/2)
    }

    if !(real(inverted))
        active = 1;
    else
        active = 0;
}
else
{
    if active != (inverted) {
        if inview() sound("itemgateclose",0,speedam/2)
    }

    active = inverted;
}

if (active) {
    x = approach_val(x,openx, speedam)
} else {
    x = approach_val(x,initialx, speedam)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[channelid])
{
    if active = -(inverted) {
        if inview() sound("itemgateopen",0,speedam/2)
    }

    if !(real(inverted))
        active = 1;
    else
        active = 0;
}
else
{
    if active != (inverted) {
        if inview() sound("itemgateclose",0,speedam/2)
    }

    active = inverted;
}

if (active) {
    x = approach_val(x,openx, speedam)
} else {
    x = approach_val(x,initialx, speedam)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grid_size = 8;
if !(real(invis))
{
    var dy;
    //Top Base
    for (dx = 0; dx < image_xscale/0.5; dx += 1) {
        draw_background_part_ext(global.masterobjects[biome],328,288,8,16,x+(dx*grid_size),y,1,1,c_white,1); //Middle Laser
    }
    draw_background_part_ext(global.masterobjects[biome],320,288,8,16,x-8,y,1,1,c_white,1);
    draw_background_part_ext(global.masterobjects[biome],336,288,8,16,x+(image_xscale*16),y,1,1,c_white,1);
    draw_background_part_ext(global.masterobjects[biome],344,288,8,16,initialx+((image_xscale-1)*16)+8,y,1,1,c_white,1);
}
