#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
length = "0"
hsp=0
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//these 2 lines move the player along the platform.
coll=instance_place(x,y-2,player)
if (coll) {if (!coll.jump) hsp=1}

if (place_meeting(x+hsp,y,collider)) {
    while !(place_meeting(x+sign(hsp),y,collider)) {
        x+=sign(hsp)
    }
    hsp=0;
}

x+=hsp
if (x=xstart) hsp=0

if (coll) {
    if (!coll.jump) {
        coll.x += hsp
    }
}

if (x>region.x+48) x=region.lefthand-48
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterobjects[biome],144,592,80,24,x-32,y-16,image_xscale,image_yscale,c_white,image_alpha)
