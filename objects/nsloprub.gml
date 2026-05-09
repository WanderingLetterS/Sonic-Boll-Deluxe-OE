#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
f=0.5
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c8=position_meeting(x,y-8,groundback)||guaranteedc8
if c8 superc8=(position_meeting(x,y-24,groundback))
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if c8 && superc8 draw_background_part_ext(global.masterterrain[biome],240,416,16,16,x,y-16,1,1,$FFFFFF,1)
else if c8 && !superc8 draw_background_part_ext(global.masterterrain[biome],352,368,16,24,x,y-24,1,1,$FFFFFF,1)

draw_background_part_ext(global.masterterrain[biome],240,432,16,32,x,y,1,1,$FFFFFF,1)
