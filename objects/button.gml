#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
active=0;
channelid=0;
perma=0;
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if channelid != 0
{
    switch filter
    {
    case 0:
        coll=instance_place(x,y,cork)
        if place_meeting(x,y,player) || (coll && !coll.carry) ||  place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) //Player & Object Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    case 1:
        if place_meeting(x,y,player) //Player Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    case 2:
        coll=instance_place(x,y,cork)
        if (coll && !coll.carry) || place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) //Object Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    case 3:
        if place_meeting(x,y,enemy) //Enemy Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    case 4:
        coll=instance_place(x,y,cork)
        if place_meeting(x,y,player) || (coll && !coll.carry) || place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) ||  place_meeting(x,y,enemy) //All Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
if !invis sound("itembutton")
active = 1
if channelid != 0 global.channel[channelid] += 1
activateTechnicals();

if !(invis)
{
    switch(filter)
    {
        case 0: tile_set_region(myFavouriteTile,216+16,240,16,8) break;
        case 1: tile_set_region(myFavouriteTile,248+16,240,16,8) break;
        case 2: tile_set_region(myFavouriteTile,280+16,240,16,8) break;
        case 3: tile_set_region(myFavouriteTile,216+16,248,16,8) break;
        case 4: tile_set_region(myFavouriteTile,248+16,248,16,8) break;
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
if (perma) exit;
active = 0
global.channel[channelid] = max(0,global.channel[channelid]-1)
activateTechnicals();

if !(invis)
{
    switch(filter)
    {
        case 0: tile_set_region(myFavouriteTile,216,240,16,8) break;
        case 1: tile_set_region(myFavouriteTile,248,240,16,8) break;
        case 2: tile_set_region(myFavouriteTile,280,240,16,8) break;
        case 3: tile_set_region(myFavouriteTile,216,248,16,8) break;
        case 4: tile_set_region(myFavouriteTile,248,248,16,8) break;
    }
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid=unreal(channelid,0);
filter=unreal(filter,0);
perma=unreal(perma,0);
invis=unreal(invis,0);

if !(invis)
{
    switch(filter)
    {
        case 0: tile_bake(global.masterobjects[biome],216,240,16,8,x,y+8,depth) break;
        case 1: tile_bake(global.masterobjects[biome],248,240,16,8,x,y+8,depth) break;
        case 2: tile_bake(global.masterobjects[biome],280,240,16,8,x,y+8,depth) break;
        case 3: tile_bake(global.masterobjects[biome],216,248,16,8,x,y+8,depth) break;
        case 4: tile_bake(global.masterobjects[biome],248,248,16,8,x,y+8,depth) break;
    }
}
