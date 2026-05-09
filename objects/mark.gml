#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type=""
t=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=0.25
y=ystart+round(sin(x+t/2)*2-3)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,glitter)
sound("itemcoinredall")
with (other) doscore_p(8000,1)
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//minus world
if (type="miner") instance_create(x,y,miner)
//castle flags
if (type="flag") instance_create(x,y,flaggy)
//castle door marker for players to walk in
if (type="castledoor") instance_create(x,y,castledoor)
//a standalone secret camera block that isnt aligned to the grid
if (type="camspace") instance_create(x-8,y-8,camspace)
//a wall barrier that shows up in multiplayer modes (used in kid unlock)
if (type="2pwall" && global.mplay>1) instance_create(x-8,0,finalwall)
//minus world broken bowser object
if (type="minusbowser") instance_create(x,y,minusbowser)
//resets the players token counter
if (type="tokenreset") instance_create(x,y,tokenreset)
if (type="MISSING") && settings("__foundman") instance_create(x,y,MISSING)
//wind test thing, you can delete it if you want
//if (type="wind") instance_create(x-8,y-8,wind)
//p switch item
//if (type="pswitch") instance_create(x-8,y-8,pswitch)
//cutscene automator
if (string_pos("auto",type)) with (instance_create(x,y,automator)) {args=other.type event_user(0)}
//guile easter egg positions
if (type="guile") instance_create(x,y+8,guile)
if (type="tran") {image_speed=0 image_index=2 visible=1 exit}
//if (type="b") instance_create(x,y,clawbase)
//if (type="belt") instance_create(x,y,conveyorbelt)

instance_destroy()
