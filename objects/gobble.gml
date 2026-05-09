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
if (reader)
val1=reader.active
else if onscreen {
    if onscreen.type!=2
    val1=onscreen.counterval
    else
    val1=onscreen.active
}
else if (timer)
val1=timer.timeleft
else if (varblock)
val1=varblock.counterval
else if (display)
val1=display.activeamount

if (reader2)
val2=reader2.active
else if onscreen2 {
    if onscreen2.type!=2
    val2=onscreen2.counterval
    else
    val2=onscreen2.active
}
else if (timer2)
val2=timer2.timeleft
else if (varblock2)
val2=varblock2.counterval
else if (display2)
val2=display2.activeamount

switch (type) {
    case 0:
    if val1 == val2
        event_user(0)
    else
        event_user(1)
    break;
    case 1:
    if val1 > val2
        event_user(0)
    else
        event_user(1)
    break;
    case 2:
    if val1 < val2
        event_user(0)
    else
        event_user(1)
    break;

}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
active = 1
if real(channelid) != 0 global.channel[real(channelid)] += 1
activateTechnicals();

tile_set_region(myFavouriteTile,168-16,288+16*type,16,16);
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
global.channel[real(channelid)] = max(0,global.channel[real(channelid)]-1)
activateTechnicals();

tile_set_region(myFavouriteTile,168,288+16*type,16,16);
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Read States
p=string_pos(",",src)
srcx=unreal(string_copy(src,1,p-1),0)*16
srcy=unreal(string_delete(src,1,p),0)*16

//i hate this damn code
reader=instance_position(x+srcx+8,y+srcy+8,ireader)
onscreen=instance_position(x+srcx+8,y+srcy+8,onoffscreen)
timer=instance_position(x+srcx+8,y+srcy+8,timerblock)
varblock=instance_position(x+srcx+8,y+srcy+8,variableblock)
display=instance_position(x+srcx+8,y+srcy+8,displayscreen)

p=string_pos(",",src2)
srcx2=unreal(string_copy(src2,1,p-1),0)*16
srcy2=unreal(string_delete(src2,1,p),0)*16

reader2=instance_position(x+srcx2+8,y+srcy2+8,ireader)
onscreen2=instance_position(x+srcx2+8,y+srcy2+8,onoffscreen)
timer2=instance_position(x+srcx2+8,y+srcy2+8,timerblock)
varblock2=instance_position(x+srcx2+8,y+srcy2+8,variableblock)
display2=instance_position(x+srcx2+8,y+srcy2+8,displayscreen)

type=unreal(type,0);
tile_bake(global.masterobjects[biome],168,288+16*type,16,16,x,y,depth);
