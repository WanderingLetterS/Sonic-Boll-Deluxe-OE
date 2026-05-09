#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0;
active=0;
channelid=0;
getregion(x)

mycoll=instance_create(x,y,collider)
mycoll.mask_index=spr_16
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[channelid])
{
    if !(inverted)
        active = 1;
    else
        active = 0;
}
else
{
active = inverted;
}

if (active) {
    mycoll.y=-verybignumber
} else {
    instance_activate_object(mycoll)
    mycoll.y=y
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
inverted=unreal(inverted,0);
channelid=unreal(channelid,0);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("signalblock")
