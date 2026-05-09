#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

nslop=1

f=-0.3
instance_create(x,y,slopeground)
instance_create(x+16,y,slopeground)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c2=position_meeting(x,y+24,groundblock)||guaranteedc2
if guaranteedc2 c2=1
if c2 superc2=(position_meeting(x,y+24+16,groundblock))

norender = unreal(norender, 0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global.useterrainpng exit
if (norender) exit;

if !position_meeting(x+8,y+24,collider) && inview() && !guaranteedc2 c2=0 //this should only ever happen with cracked ground

if c2 && superc2 draw_background_part_ext(global.masterterrain[biome],272,48,32,16,x,y+16,1,1,$FFFFFF,1)
else if c2 && !superc2 draw_background_part_ext(global.masterterrain[biome],400,56,32,24,x,y+16,1,1,$FFFFFF,1)

draw_background_part_ext(global.masterterrain[biome],272,32,16,16,x,y,1,1,$FFFFFF,1)
draw_background_part_ext(global.masterterrain[biome],288,16,16,32,x+16,y-16,1,1,$FFFFFF,1)

//if c2 && superc2 draw_background_part_ext(global.masterterrain[biome],400,80,16,16,x,y+16,1,1,$FFFFFF,1)
