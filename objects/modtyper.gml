#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) {
    modtype = ds_list_find_value(global.modtype,modctrl.cur);

    name="Unnamed";
    desc="No Data.";
    switch(modtype) {
        case "charm":
            var char;
            char = ds_list_find_value(global.modlist, modctrl.cur);
            n=string_copy(playerskinstr(0,global.charname[char]+" name"),1,8)
            p=string_pos(" ",n)
            if (p) n=string_copy(n,1,p-1)
        break;
        case "extension":
            codename = ds_list_find_value(global.modlist,modctrl.cur)
            ext = ds_list_find_value(global.extensionlist, modctrl.cur);
            if (codename!=noone) && (codename!=0) {
                code_execute(codename);
            } else {
                name=ext;
            }
            code_execute(ds_list_find_value(global.modlist,modctrl.cur))
            n=string_copy(name,1,8)
            p=string_pos(" ",n)
            if (p) n=string_copy(n,1,p-1)
        break;
    }

    global.tscale=2
    draw_systext(x,y,n)
    global.tscale=1
}
