#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blue=0;
active=0;
channelid = 0;
channelid2 = 0;
channelid3 = 0;
channelid4 = 0;
type=0;
timerval = 0;
counterval = 0;
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blockbounce()
if (goinup) upwardthrust()
wait=max(0,wait-1)

if (global.channel[channelid]) || (global.channel[channelid2]) || (global.channel[channelid3]) || (global.channel[channelid4]) {
    if !(override) active = 1
    else
    active = 0
}
else
{
    if !(override) active = 0
    else
    active = 1
}

if type==0 && !(wait)
{
    if timerval > 1
    {
        timerval -= 1
    }else{
        event_user(4)
    }
    counterval = round(timerval/60)
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
    override = !override //Override allows the screen to be turned on even if theres nothing powering it's signal, powering it will turn the override off.
    wait=13
    tpos=1
    event_user(4)
}
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type == 0 {
    sound("itemonoffswitch")
    instance_activate_object(onblock) instance_activate_object(offblock) instance_activate_object(onspike) instance_activate_object(offspike)
    with (onblock) alarm[0]=1
    with (offblock) {alarm[0]=1 owner=global.coll}
    with (offspike) alarm[0]=1
    with (onspike) {alarm[0]=1 owner=global.coll}
    timerval = 9*60
    gamemanager.onblockstate=!gamemanager.onblockstate
    if type == 0 tile_set_region(myFavouriteTile,360+(16*(!gamemanager.onblockstate+1)),264,16,16)
}
if type == 1 {
    sound("itemonoffswitch")
    if (counterval < 9) counterval +=1 else counterval = 0
}
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type=unreal(type,0);
channelid=unreal(channelid,0);
channelid2=unreal(channelid2,0);
channelid3=unreal(channelid3,0);
channelid4=unreal(channelid4,0);

if type == 0 tile_bake(global.master[biome],360+(16*(!gamemanager.onblockstate+1)),264,16,16,x,y,depth+1)
else tile_bake(global.master[biome],360,264,16,16,x,y,depth+1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if !inview() exit;

if type!=2 {
    _dx = 392 - (((counterval + 2) mod 3) * 16)
    _dy = 248 - (((counterval + 2) div 3) * 16)

    draw_background_part_ext(global.master[biome],_dx,_dy,16,16,x,y+dy,1,1,c_white,image_alpha)
} else {
    draw_background_part_ext(global.master[biome],376+(16*active),248,16,16,x,y+dy,image_xscale,image_yscale,c_white,image_alpha);
}
