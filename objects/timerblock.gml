#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
active = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blockbounce()
if (goinup) upwardthrust()
wait=max(0,wait-1)

if !(wait) && active
{
    if timeleft > 0{
        frm = 0;
        timeleft -= 1
        event_user(5)
    }

    if timeleft < 1
    {
        frm = 1
        if !(halt3)
        {
            if channelid2 != 0 global.channel[channelid2] += 1
            if channelid3 != 0 global.channel[channelid3] += 1
            activateTechnicals();
            halt3 = true;
        }
        event_user(4)
    }
}


if (global.channel[channelid]) {
    if !halt2 {
        image_index = 0;
        timeleft = settime
        active = true;
        halt = false;
        halt2 = true;
    }
} else {
    timeleft = settime
    image_index = 0;
    halt = false;
    halt2 = false;
}
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
if(!wait) {
    override = 1 //Override allows the screen to be turned on even if theres nothing powering it's signal, powering it will turn the override off.
    wait=13
    tpos=1
    image_index = 0;
    sound("itemonoffswitch")
    timeleft = real(settime)
    active = true;
    halt = false;
}
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if active exit;
image_index = 0;
active = true;
halt = false;
timeleft = settime
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if halt exit;
global.channel[channelid2] = max(0,global.channel[channelid2]-1)
global.channel[channelid3] = max(0,global.channel[channelid3]-1)
halt3 = false;
halt = true;
activateTechnicals();
#define Other_16
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid=unreal(channelid,0);
channelid2=unreal(channelid2,0);
channelid3=unreal(channelid3,0);
settime=unreal(settime,0);
timeleft=settime
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit;
draw_background_part_ext(global.masterobjects[biome],184+(16*frm),272,16,16,x,y+dy,image_xscale,image_yscale,c_white,image_alpha)
draw_omitext(x+5,y+6+dy,timeleft,c_white,1)
