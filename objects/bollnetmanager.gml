#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.onlinebuffer=buffer_create();
stcp=-1
connected=false
chatlog=ds_list_create();
playerlist=ds_list_create();
player_id=-1;
connected_ip=get_string("What IP are you connecting to?","127.0.0.1");
name = get_string("What is your name?","")
tcp=socket_create()
socket_connect(tcp,connected_ip,4126)

chat=sureface("chat",160,64)

messagetyped="";
cmd = "";
typing=false;
disconnecting=false;
prevlevel="";
maxplayerid=0;
pingtimer=0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var s, a, cmd, text, i;

if (global.kill) {
    buffer_clear(global.onlinebuffer);
    buffer_write_i8(global.onlinebuffer, 9);
    socket_write_message(tcp, global.onlinebuffer);
    socket_close(tcp);
    instance_destroy();
}
