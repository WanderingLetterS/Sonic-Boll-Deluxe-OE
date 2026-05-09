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
c2=position_meeting(x,y+24,groundback)||guaranteedc2
if c2 superc2=(position_meeting(x,y+24+16,groundback))
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if c2 && superc2 draw_background_part_ext(global.masterterrain[biome],272,400,32,16,x,y+16,1,1,$FFFFFF,1)
else if c2 && !superc2 draw_background_part_ext(global.masterterrain[biome],400,408,32,24,x,y+16,1,1,$FFFFFF,1)

draw_background_part_ext(global.masterterrain[biome],272,384,16,16,x,y,1,1,$FFFFFF,1)
draw_background_part_ext(global.masterterrain[biome],288,368,16,32,x+16,y-16,1,1,$FFFFFF,1)
