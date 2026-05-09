#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
f=0.55
l=1
instance_create(x,y,slopeground)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c2=position_meeting(x+8,y+24,groundblock)||guaranteedc2
if c2 superc2=(position_meeting(x+8,y+24+16,groundblock))

norender = unreal(norender, 0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global.useterrainpng exit
if (norender) exit;

if inview() && !position_meeting(x+8,y+24,collider)&&!position_meeting(x+8,y+24,groundblock) && inview() && !guaranteedc2 c2=0 //this should only ever happen with cracked ground

if c2 && superc2 draw_background_part_ext(global.masterterrain[biome],256,48,16,16,x,y+16,1,1,$FFFFFF,1)
else if c2 && !superc2 draw_background_part_ext(global.masterterrain[biome],368,56,16,24,x,y+16,1,1,$FFFFFF,1)

draw_background_part_ext(global.masterterrain[biome],256,16,16,32,x,y-16,1,1,$FFFFFF,1)
