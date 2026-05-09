#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid=0;
outputid=0;
outputid2=0;
outputid3=0;
outputid4=0;
active=false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[channelid]) {
    event_user(1);
} else {
    event_user(2);
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid=unreal(channelid,0);
outputid=unreal(outputid,0);
outputid2=unreal(outputid2,0);
outputid3=unreal(outputid3,0);
outputid4=unreal(outputid4,0);

visible=global.lemontest
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
active = 1
if outputid != 0 global.channel[outputid] += 1
if outputid2 != 0 global.channel[outputid2] += 1
if outputid3 != 0 global.channel[outputid3] += 1
if outputid4 != 0 global.channel[outputid4] += 1
activateTechnicals();
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = false;
global.channel[outputid] = max(0,global.channel[outputid]-1)
global.channel[outputid2] = max(0,global.channel[outputid2]-1)
global.channel[outputid3] = max(0,global.channel[outputid3]-1)
global.channel[outputid4] = max(0,global.channel[outputid4]-1)
activateTechnicals();
