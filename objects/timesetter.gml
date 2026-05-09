#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !(settings("nolemonsound")) sound("lemoncontext")
opt=show_contextmenu("Day|Evening|Night",-1)
if !(settings("nolemonsound")) sound("lemonselectitem")

if (opt = 0) lemongrab.typetime[drawregion.region]="day"
else if (opt = 1) lemongrab.typetime[drawregion.region]="evening"
else if (opt = 2) lemongrab.typetime[drawregion.region]="night"
else exit;

with (drawregion) event_user(7)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if lemongrab.typetime[drawregion.region]="evening" draw_sprite(spr_times,1,x,y)
else if lemongrab.typetime[drawregion.region]="night" draw_sprite(spr_times,2,x,y)
else draw_sprite(spr_times,0,x,y)


if (over) {
    drawtooltip((bbox_left+bbox_right)/2,97,"Time of day",1)
}
