#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
friction=0.1
getregion(x)
growsize=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fr=fr+0.2

if growsize!=0{
    image_xscale*=1+(growsize*0.1*0.25)
    image_yscale*=1+(growsize*0.1*0.25)
}
if drag{
speed*=0.99*drag

}
frame=floor(fr)

if (frame>=4) {instance_destroy() visible=0}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_effects("poof")
