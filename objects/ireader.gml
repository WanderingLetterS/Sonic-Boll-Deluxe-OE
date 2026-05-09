#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid = 0
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if
((reader) && reader.active == value) || //Read other I-Reader's active state
((onscreen) && onscreen.counterval == value) || //Read On/off Timer & Counter displayed value.
((onscreen) && onscreen.active == value && onscreen.type!=1) || //Read Lantern's active state (binary)
((timer) && timer.timeleft == value) || //Read timer's displayed time.
((varblock) && varblock.counterval == value) || //Read Variable Block's value
((display) && display.activeamount == value) // Read Display Screen's amount of active panels
    event_user(0)
else if active
    event_user(1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
active = 1
if channelid != 0 global.channel[channelid] += 1
if channelid2 != 0 global.channel[channelid2] += 1
if channelid3 != 0 global.channel[channelid3] += 1
if channelid4 != 0 global.channel[channelid4] += 1
activateTechnicals();

tile_set_region(myFavouriteTile,184+16,256,16,16)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
global.channel[channelid] = max(0,global.channel[channelid]-1)
global.channel[channelid2] = max(0,global.channel[channelid2]-1)
global.channel[channelid3] = max(0,global.channel[channelid3]-1)
global.channel[channelid4] = max(0,global.channel[channelid4]-1)
activateTechnicals();

tile_set_region(myFavouriteTile,184,256,16,16)
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid=unreal(channelid,0);
channelid2=unreal(channelid2,0);
channelid3=unreal(channelid3,0);
channelid4=unreal(channelid4,0);

value=unreal(value,0);

p=string_pos(",",src)
srcx=unreal(string_copy(src,1,p-1),0)*16
srcy=unreal(string_delete(src,1,p),0)*16

reader=instance_position(x+srcx+8,y+srcy+8,ireader)
onscreen=instance_position(x+srcx+8,y+srcy+8,onoffscreen)
timer=instance_position(x+srcx+8,y+srcy+8,timerblock)
varblock=instance_position(x+srcx+8,y+srcy+8,variableblock)
display=instance_position(x+srcx+8,y+srcy+8,displayscreen)

tile_bake(global.masterobjects[biome],184,256,16,16,x,y,depth)
