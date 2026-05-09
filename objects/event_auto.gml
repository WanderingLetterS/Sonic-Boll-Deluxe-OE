#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
outputid=0;
outputid2=0;
outputid3=0;
outputid4=0;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
outputid=unreal(outputid,0);
outputid2=unreal(outputid2,0);
outputid3=unreal(outputid3,0);
outputid4=unreal(outputid4,0);

if outputid != 0 global.channel[outputid] += 1
if outputid2 != 0 global.channel[outputid2] += 1
if outputid3 != 0 global.channel[outputid3] += 1
if outputid4 != 0 global.channel[outputid4] += 1
activateTechnicals();

if !(global.lemontest)
instance_destroy();
else visible=true
