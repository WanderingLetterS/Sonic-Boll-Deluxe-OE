#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
inst=noone;
triggered=false;
xoff = 0;
yoff = 0;
obj = "";
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[channelid]) {
    if !(triggered) || (constant) {
        if (inst!=noone) {
            instance_create(x+xoff,y+yoff,inst);
        }
        triggered = true;
    }
} else {
    triggered = false;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var p,i;

p=string_pos(",",objalign)

if (p) {
    xoff=unreal(string_copy(objalign,1,p-1),0)
    yoff=unreal(string_delete(objalign,1,p),0)
} else {
    xoff=unreal(objalign,0)
    yoff=0
}

channelid=unreal(channelid,0);
constant=unreal(constant,0);

if (string_length(string_lettersdigits(obj)) != 0) {
    execute_string("if (object_exists("+obj+")) inst="+obj)
}

visible=global.lemontest
