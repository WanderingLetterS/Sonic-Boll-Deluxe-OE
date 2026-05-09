#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
width = unreal(width, 1);
height = unreal(height, 1);
image_xscale=width
image_yscale=height
x-=width*8
y-=height*8
channelid=unreal(channelid,0);
image_speed=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.debug) draw_self();
