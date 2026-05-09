#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(1)
cur=-1

with (instance_create(200,112,genericcursor)) {
    image_blend=playercol(0,0)
    special=1
}

//load all the default skins for the mods.
for (i=(global.characters-global.charmstart+1);i<global.characters;i+=1){
    applyplayerskin(global.pbase,0,"less",i)
}

if (global.discordoverride<2) {discord_update_presence("","In Menu","boll-icon","mod-icon")}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ocur=cur
with (genericcursor) if (abut) if (within(x,y,other.x,other.y,140,136)) {
    other.cur=floor((y-(other.y+2))/28)+other.page
    if (other.cur>=other.l) other.cur=-1
    else {
        sound("systemselect")
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dead=1
segafadeto(mainmenu,"systemreturn")
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
l=ds_list_size(global.modlist)

//for (i=0;i<l;i+=1) applyplayerskin(global.pbase,0,"all",i+global.charmstart)

dead=0

cur=-1
page=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var modtype,char,ext,codename;
name="Unnamed";
desc="No Data.";
for (i=0;i<min(5,l-page);i+=1) {
    yy=y+4+28*(i)

    draw_sprite(spr_replaybox,(cur==i+page),x,yy)

    c=i+page

    modtype = ds_list_find_value(global.modtype,c);

    switch(modtype) {
        case "charm":
            char = ds_list_find_value(global.modlist,c);
            d=settings(global.charname[char]+" disabled")
            if (settings(global.charname[char]+" broken")) d=2

            rect(x+3,yy+3,26,18,$ffffff,1)
            draw_sprite_part(global.charicon[char,0],0,0,4,24,16,x+4,yy+4)
            res=playerskindat(0,global.charname[char]+" name")
            if (is_string(res)) {
                draw_systext(x+32,yy+4,string_copy(playerskinstr(0,global.charname[char]+" name"),1,13))
            }
            if (d) {
                if (d=2) draw_systext(x+32,yy+12,lang("mod bk"),$ff)
                else draw_systext(x+32,yy+12,lang("mod no"),$ffff)
                rect(x+4,yy+4,24,16,0,0.5)
            } else draw_systext(x+32,yy+12,lang("mod ok"),$ff00)

            draw_sprite(spr_modicons,0,x+140-12,yy+12)
        break;
        case "extension":
            codename = ds_list_find_value(global.modlist,c);
            ext = ds_list_find_value(global.extensionlist, c);
            if (codename!=noone) && (codename!=0) {
                code_execute(codename)
            } else {
                name = ext;
            }
            draw_systext(x+3,yy+4,string_copy(name,1,17))
            d=settings(ext+" extension disabled")
            if (d) {
                if (d=2) draw_systext(x+3,yy+12,lang("mod bk"),$ff)
                else draw_systext(x+3,yy+12,lang("mod no"),$ffff)
            } else draw_systext(x+3,yy+12,lang("mod ok"),$ff00)

            draw_sprite(spr_modicons,1,x+140-12,yy+12)
        break;
    }
}

global.halign=1
draw_systext(200,32,lang("mods"))
global.halign=0

draw_sprite(spr_border,0,0,0)
#define KeyPress_27
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) event_user(0)
#define KeyPress_116
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//emptyreplaycache()
event_user(1)
