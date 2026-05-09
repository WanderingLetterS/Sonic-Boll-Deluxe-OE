#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xoff=0
yoff=0
spr=0
off2x=0
off2y=0
mask_index=spr_mask1x1
image_speed=0
memx=x
new=1

for (i=0;i<8;i+=1) data[i]=""
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y+1,object_index)) {
    var i;
    i=instance_place(x,y+1,object_index);
    if ((obj == groundblock || obj == slopel1 || obj == sloper1 || obj == sloper2 || obj == slopel2) && i.obj == groundblock) {
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
    with (coll) instance_destroy()
} until (!coll)
y+=99

if (x<0 || y<0 || x>lemongrab.w[drawregion.region]-1 || y>lemongrab.h[drawregion.region]-1) instance_destroy()
