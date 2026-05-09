#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
active=0;
channelid=0;
getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(2);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blockbounce()
if (goinup) upwardthrust()
wait=max(0,wait-1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
owner=global.coll
if (!insted) {
    if (owner.fly) owner.vsp=0
    else owner.vsp=1.5
}
if!(wait) {
    wait=13
    tpos=1
    event_user(4)
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
global.channel[channelid] = max(0,global.channel[channelid]-1)// Prevent a negative value.
global.channel[channelid2] = max(0,global.channel[channelid1]-1)
global.channel[channelid3] = max(0,global.channel[channelid2]-1)

tile_set_region(myFavouriteTile,344,240,16,16)
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if active exit;
active = 1
if channelid {global.channel[channelid] += 1}
if channelid2 {global.channel[channelid2] += 1}
if channelid3 {global.channel[channelid3] += 1}
alarm[0]=2

tile_set_region(myFavouriteTile,344+16,240,16,16)
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid=unreal(channelid,0);
channelid2=unreal(channelid2,0);
channelid3=unreal(channelid3,0);

tile_bake(global.masterobjects[biome],344,240,16,16,x,y,depth)
