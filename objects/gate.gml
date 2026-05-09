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

    if !(inverted)
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
    y = approach_val(y,openy, speedam)
} else {
    y = approach_val(y,initialy, speedam)
}

openy = initialy-(height*16)

image_yscale = height
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speedam=unreal(speedam,1);
channelid=unreal(channelid,0);
inverted=unreal(inverted,0);
height=unreal(height,1);
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
    for (dy = 0; dy < image_yscale/0.5; dy += 1) {
        draw_background_part_ext(global.masterobjects[biome],352,280,16,8,x,y+(dy*grid_size),1,1,c_white,1); //Middle Laser
    }
    draw_background_part_ext(global.masterobjects[biome],352,272,16,8,x,y-8,1,1,c_white,1);
    draw_background_part_ext(global.masterobjects[biome],352,288,16,8,x,y+(image_yscale*16),1,1,c_white,1);
    draw_background_part_ext(global.masterobjects[biome],352,264,16,8,x,initialy,1,1,c_white,1);
}
