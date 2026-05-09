#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid = 0;
channelid2 = 0;
channelid3 = 0;
masterchannel = 1;
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[real(channelid3)]) {
    event_user(0)
} else if (active) {
    event_user(1)
}

if (global.channel[real(channelid)] || global.channel[real(channelid2)]) {
    event_user(2)
} else if (active2) {
    event_user(3)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
active = 1

global.channel[masterchannel] += 1
activateTechnicals();

tile_set_region(myFavouriteTile,312+16,240,16,16)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0

global.channel[masterchannel] = max(0,global.channel[masterchannel]-1)
activateTechnicals();

tile_set_region(myFavouriteTile,312,240,16,16)
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active2) exit;
active2=1

if (global.channel[channelid2]) && !(global.channel[channelid])
    masterchannel += 1
else if (global.channel[channelid])
    masterchannel -= 1

masterchannel=clamp(masterchannel,1,500)
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !(active2) exit;
active2 = 0
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid=unreal(channelid,0);
channelid2=unreal(channelid2,0);
channelid3=unreal(channelid3,0);

tile_bake(global.masterobjects[biome],312,240,16,16,x,y,depth+1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if !inview() exit;

draw_omitext(x+4,y+5,masterchannel)
