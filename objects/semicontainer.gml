#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mask_index=spr_mask1x1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y+1,object_index)) {
    var i;
    i=instance_place(x,y+1,object_index);
    if ((obj == groundsemi || obj == slopel1s || obj == sloper1s || obj == sloper2s || obj == slopel2s) && i.obj == groundsemi) {
        i.frame=0;
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y-=99
do {
    coll=instance_place(x,y+99,object_index)
    if (coll) with (coll) instance_destroy()
} until (!coll)
y+=99

if (x<0 || y<0 || x>lemongrab.w[drawregion.region]-1 || y>lemongrab.h[drawregion.region]-1) instance_destroy()
