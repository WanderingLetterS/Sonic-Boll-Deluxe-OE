#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
checkfor="";
index = 0;
active = false;
released = true;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (variable_instance_get(gamemanager.players[index],checkfor)) {
    if (onpress && released) || !(onpress){
        event_user(1);
        released=false;
    } else if (onpress && !released) {
        event_user(2);
    }
} else {
    event_user(2);
    released=true;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
outputid = unreal(outputid, 0);
index = unreal(index, 0);
onpress = unreal(onpress, 0);
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
