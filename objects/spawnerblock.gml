#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0;
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (channelid && global.channel[channelid]) {
    event_user(2)
} else {
    event_user(4)
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if active exit;
active = 1
var i;
if object == 0 {i=instance_create(x+8,y+8,staticdummy)}
else if object == 1 {i=instance_create(x,y+8,objectdummy)}
else if object == 2 {i=instance_create(x+8,y+8,enemydummy)}
else if object == 3 {i=instance_create(x,y,colliderdummy)}
else if object == 4 {i=instance_create(x,y,hazarddummy)}
else if object == 5 {i=instance_create(x+8,y+8,cork)}
else if object == 6 {i=instance_create(x,y,stone)}
with(i) {
    createcode=other.ccode
    if object_index!=cork
    event_user(0);
    else event_user(2);
}
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
object=unreal(object,0);
channelid=unreal(channelid,0);
invis=unreal(invis,0);

if !(invis) {
    tile_bake(global.masterobjects[biome],368,256,16,16,x,y,depth);
}
