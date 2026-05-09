#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lok=0
drop=0
getimer=8
p2=-1
getregion(x)
xp=x
yp=y
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!drop) {vspeed=-4 fall=1 xstart=x side=0 sidev=0}
depth=0
y=round(y/8)*8
c=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fall=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (c) calcmoving()
getimer-=1

fr+=0.075
featherfr=wrap_val(floor(fr),0,3)

if !drop && fall{//feather physics

    if vspeed<0 && !side{ vspeed+=0.2}//Rise up straight
    if side==0 && vspeed>=0 {side=1}
    if side!=0 {

        fallframe+=0.05
        hspeed=(1.5-fallframe)*side
        vspeed=((-sin(hspeed/2)+0.3)*side)
        if vspeed>=0 vspeed+=0.5 //descend down

        if hspeed<=-1.5 && side=1 {side=-1 fallframe=0}
        if hspeed>=1.5 && side=-1 {side=1 fallframe=0}
    }

}


if (pitdeath()) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!getimer || other.name="kid") {visible=0 if (give_item(other.id,"bfeather")) instance_destroy() visible=1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_items("bfeather")
