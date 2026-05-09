#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
s=1
f=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c8=position_meeting(x+8,y-8,groundsemi)||guaranteedc8
if c8 superc8=(position_meeting(x+8,y-24,groundsemi))

if (c8 && !superc8) {
    instance_create(x,y-16,phaser);
}

norender = unreal(norender, 0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (norender) exit;

if c8 && superc8 draw_background_part_ext(global.masterterrain[biome],256,240,16,16,x,y-16,1,1,$FFFFFF,1)
else if c8 && !superc8 draw_background_part_ext(global.masterterrain[biome],368,192,16,24,x,y-24,1,1,$FFFFFF,1)

draw_background_part_ext(global.masterterrain[biome],256,256,16,32,x,y,1,1,$FFFFFF,1)
