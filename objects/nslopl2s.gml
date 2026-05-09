#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
f=0.3
s=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c2=position_meeting(x,y+24,groundsemi)||guaranteedc2
if c2 superc2=(position_meeting(x,y+24+16,groundsemi))

norender = unreal(norender, 0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (norender) exit;

if c2 && superc2 draw_background_part_ext(global.masterterrain[biome],304,224,32,16,x,y+16,1,1,$FFFFFF,1)
else if c2 && !superc2 draw_background_part_ext(global.masterterrain[biome],432,232,32,24,x,y+16,1,1,$FFFFFF,1)

draw_background_part_ext(global.masterterrain[biome],320,208,16,16,x+16,y,1,1,$FFFFFF,1)
draw_background_part_ext(global.masterterrain[biome],304,192,16,32,x,y-16,1,1,$FFFFFF,1)
