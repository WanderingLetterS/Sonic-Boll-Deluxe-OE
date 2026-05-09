#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=0
u=1
instance_create(x,y,uslopeground)
instance_create(x+16,y,uslopeground)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c8=position_meeting(x+8,y-8,groundblock)||guaranteedc8
if c8 superc8=(position_meeting(x+8,y-24,groundblock))

norender = unreal(norender, 0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !global.useterrainpng exit
if (norender) exit;

if inview() && !position_meeting(x+8,y-24,collider)&&!position_meeting(x+8,y-24,groundblock) && inview() && !guaranteedc8 c8=0 //this should only ever happen with cracked ground

if c8 && superc8 draw_background_part_ext(global.masterterrain[biome],272,64,32,16,x,y-16,1,1,$FFFFFF,1)
else if c8 && !superc8 draw_background_part_ext(global.masterterrain[biome],400,16,32,24,x,y-24,1,1,$FFFFFF,1)

draw_background_part_ext(global.masterterrain[biome],288,80,16,32,x+16,y,1,1,$FFFFFF,1)
draw_background_part_ext(global.masterterrain[biome],272,80,16,16,x,y,1,1,$FFFFFF,1)
