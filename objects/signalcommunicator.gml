#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
active=0;
channelid=0;
logicTile=-1;
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

var check;

switch(logic) {
    case 0: //OR
        check = (channelid && global.channel[channelid]) || (channelid2 && global.channel[channelid2])
    break;
    case 1: //AND
        check = (channelid && global.channel[channelid]) && (channelid2 && global.channel[channelid2])
    break;
    case 2: //NOR
        check = (channelid && !global.channel[channelid]) && (channelid2 && !global.channel[channelid2])
    break;
    case 3: //NAND
        check = ((channelid && global.channel[channelid]) ^^ (channelid2 && global.channel[channelid2]))
            || ((channelid && !global.channel[channelid]) && (channelid2 && !global.channel[channelid2]))
    break;
    case 4: //XOR
        check = (channelid && global.channel[channelid]) ^^ (channelid2 && global.channel[channelid2])
    break;
    case 5: //XNOR
        check = (channelid && global.channel[channelid]) ^^ (channelid2 && global.channel[channelid2])
    break;
}

if (check) {
    if override event_user(2)
    else
    event_user(4)
} else {
    if override event_user(4)
    else
    event_user(2)
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
if!(wait) {
    wait=13
    tpos=1
    override = !override
    if !(active)
    {
        event_user(4)
    }else{
        event_user(2)
    }
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
global.channel[real(channelid3)] = max(0,global.channel[real(channelid3)]-1)// Prevent a negative value.
global.channel[real(channelid4)] = max(0,global.channel[real(channelid4)]-1)
global.channel[real(channelid5)] = max(0,global.channel[real(channelid5)]-1)
global.channel[real(channelid6)] = max(0,global.channel[real(channelid6)]-1)
activateTechnicals();

if (logic == 0) {
    tile_set_region(myFavouriteTile,184,240,16,16)
} else {
    tile_set_region(myFavouriteTile,184,288,16,16)
}
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if active exit;
active = 1
if channelid3 {global.channel[channelid3] += 1}
if channelid4 {global.channel[channelid4] += 1}
if channelid5 {global.channel[channelid5] += 1}
if channelid6 {global.channel[channelid6] += 1}
activateTechnicals();

if (logic == 0) {
    tile_set_region(myFavouriteTile,184+16,240,16,16)
} else {
    tile_set_region(myFavouriteTile,184+16,288,16,16)
}
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
logic=unreal(logic,0);
channelid=unreal(channelid,0);
channelid2=unreal(channelid2,0);
channelid3=unreal(channelid3,0);
channelid4=unreal(channelid4,0);
channelid5=unreal(channelid5,0);
channelid6=unreal(channelid6,0);
if (logic == 0) {
    tile_bake(global.masterobjects[biome],184,240,16,16,x,y,depth)
} else {
    tile_bake(global.masterobjects[biome],184,288,16,16,x,y,depth)
    logicTile=tile_add(global.masterobjects[biome],200+(16*logic),288,16,16,x,y,depth)
}
