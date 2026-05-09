#define Step_2
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
            if (settings(global.charname[char]+" broken"))
                desc=lang("mod broken")
            else
                desc=global.chardata[char]
        break;
        case "extension":
            codename = ds_list_find_value(global.modlist,modctrl.cur)
            ext = ds_list_find_value(global.extensionlist, modctrl.cur);
            if (codename!=noone) && (codename!=0) {
                code_execute(codename)
            }
        break;
    }


    str=wordwrap(desc,15)
    if (string_count("#",str)>7) {
        cut=str
        str=""
        repeat (7) {
            p=string_pos("#",cut)
            str+=string_copy(cut,1,p)
            cut=string_delete(cut,1,p)
        }
        str+="...(Read more)"
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) ping(desc)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) {
    draw_sprite(sprite_index,!!over,x,y)
    draw_systext(x+4,y+4,str)
}
over=0
