#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid = 0;
channelid2 = 0;
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

if (global.channel[channelid] || global.channel[channelid2]) {
    event_user(5)
}
else
{
    event_user(6)
}

if (global.channel[channelid3]) {
    counterval=minvalue
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
sound("itemblockbump")
switch mode {
    case 0:
    case 1:
    counterval += 1 break;
    case 2: counterval = irandom_range(minvalue,maxvalue) break;
}

if !(mode)
    counterval=wrap_val(counterval,minvalue,maxvalue)
else
    counterval=clamp(counterval,minvalue,maxvalue)
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
    active = 1
if (global.channel[channelid]) && !(global.channel[channelid2])
    counterval += 1
else if (global.channel[channelid2])
    counterval -= 1

if mode==2
counterval = irandom_range(minvalue,maxvalue)

if !(mode)
    counterval=wrap_val(counterval,minvalue,maxvalue)
else
    counterval=clamp(counterval,minvalue,maxvalue)
#define Other_16
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
#define Other_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mode=unreal(mode,0);
minvalue=unreal(minvalue,0);
maxvalue=unreal(maxvalue,99);
channelid=unreal(channelid,0);
channelid2=unreal(channelid2,0);
channelid3=unreal(channelid3,0);

if mode!=2
    tile_bake(global.masterobjects[biome],280,256,16,16,x,y,depth+1)
else
    tile_bake(global.masterobjects[biome],296,256,16,16,x,y,depth+1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if !inview() exit;

var _str,_len;
_str = string(counterval);
_len = string_length(_str);

for(i=1; i<_len+1; i+=1;) {
    var _chr,_dx,_dy;
    _chr = real(string_char_at(_str,i)) //its a number now!
    //0
    _dx = 312;
    _dy = 256;

    if _len == 1
    draw_background_part_ext(global.masterobjects[biome],_dx,_dy,6,12,x+1,y+dy+2,1,1,c_white,image_alpha)

    _dx = 312 + ((_chr mod 5) * 6)
    _dy = 256 + ((_chr div 5) * 12)

    draw_background_part_ext(global.masterobjects[biome],_dx,_dy,6,12,x+9+(8*i)-(8*_len),y+dy+2,1,1,c_white,image_alpha)
}
