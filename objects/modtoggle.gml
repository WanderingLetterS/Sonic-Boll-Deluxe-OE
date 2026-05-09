#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

over=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) {

    modtype = ds_list_find_value(global.modtype,modctrl.cur);

    switch(modtype) {
        case "charm":
            var char,setname;
            char = ds_list_find_value(global.modlist, modctrl.cur);
            if (!settings(global.charname[char]+" broken")) {
                setname=global.charname[char]+" disabled"

                settings(setname,!settings(setname))
                if settings(setname) execute_string(global.unlockdata[char])
                sound("systemselect")
            }
        break;
        case "extension":
            var ext,setname;
            ext = ds_list_find_value(global.extensionlist, modctrl.cur);
            setname=ext+" extension disabled"

            settings(setname,!settings(setname))
            sound("systemselect")
        break;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) {
    modtype = ds_list_find_value(global.modtype,modctrl.cur);

    switch(modtype) {
        case "charm":
            var char;
            char = ds_list_find_value(global.modlist, modctrl.cur);
            image_index=!settings(global.charname[char]+" disabled")*2+!!over
        break;
        case "extension":
            var ext;
            ext = ds_list_find_value(global.extensionlist, modctrl.cur);

            settings(setname,!settings(setname))
            image_index=!settings(ext+" extension disabled")*2+!!over
        break;
    }
    draw_self()
    over=0
    global.valign=1
    draw_systext(x+24,y,lang("mod enable"))
    global.valign=0
}
