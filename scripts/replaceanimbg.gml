///replaceanimbg(name,directory,filename)
//replaces a stage background from files, updating properties from filename data
var f,str,p,t,s,fg,add,slot,par,blend,scroll,maxslot,cleanup,i,spr,name,but_they_got_him;

name=argument[0]+argument[2]

cleanup=1
f=file_find_first(argument[1]+argument[0]+"\"+argument[2]+"*.png",0)
while (f!="") {
    but_they_got_him=1
    if (cleanup) {
        //cleanup old layers
        for (i=0;i<=7;i+=1) {
            spr=skindat("tex_"+name+string(i))
            if (spr) sprite_delete(spr)
            skindat("tex_"+name+string(i),0)
            skindat("tex_"+name+string(i)+"_filename","")
        }
        skindat("bg_"+name,0)
        cleanup=0
        maxslot=0
    }

    slot="0"
    fg=0
    par=0.5
    scroll=0
    add=0
    ani=1
    blend=0
    a3d=0
    of=0
    hor=0
    vspd=0
    vscroll=0
    vloop=0
    pary=0.5
    vpan=0
    attach=0
    hpan=0
    forcevpan=0

    str=filename_change_ext(string_replace(filename_fixname(f),argument[0],""),"-")
    do {
        p=string_pos("-",str)
        s=string_copy(str,1,p-1)
        str=string_delete(str,1,p)

        c=string_char_at(s,1)
        if (c="d") {slot=unreal(s) maxslot=max(maxslot,slot) slot=string(slot)}
        if (c="p") par=median(0,unreal(s)/100,1)
        if (c="s") {sig=1 if (string_char_at(s,2)=="m") sig=-1 scroll=sig*unreal(s)/10}
        if (s="forceminvscreen") {forcevpan=1}
        else if (c="f") {fg=1 t=1}
        if (c="t") t=1
        if (c="v") {
            c2=string_char_at(s,2)
            if (string_copy(s,1,4)="vpan") {vpan=unreal(string_delete(s,1,4),0)}
            else if (c2="p" )pary= unreal(s) //else is there cuz otherwise the game assumes vpan means something it doesnt
            if (c2="s") {sig=1 if (string_char_at(s,3)="m") sig=-1 vscroll=sig*unreal(s)/10}
            if (c2="l") vloop=1
        }
        if (s="attachstrong") {attach=2}
        else if (s="attach") {attach=1}
        else if (c="a") ani=floor(unreal(s)) //else is there cuz otherwise the game assumes attach means something it doesnt
        if (string_copy(s,1,2)="3d") {a3d=unreal(string_delete(s,1,2),0)}

        if (c="o") {sig=1 if (string_char_at(s,2)="m") sig=-1 of=sig*unreal(s,0)}
        if (s="bm_add") {blend=1}
        if (s="bm_sub") {blend=2}
        if (string_copy(s,1,4)="hpan") {hpan=unreal(string_delete(s,1,4),0)}



    } until str=""

    if (maxslot>7) {maxslot=7 slot="0"}
    if (slot="0") t=0
    if !vloop {pary=0 vscroll=0}
    if ani==0 ani=1

    spr=replacesheet(slot,name,argument[1]+argument[0]+"\"+f,0,0,t)
    skindat("ms_"+name,maxslot)
    skindat("px_"+name+slot,par)
    skindat("fg_"+name+slot,fg)
    skindat("af_"+name+slot,ani)
    skindat("sc_"+name+slot,scroll)
    skindat("bm_"+name+slot,blend)
    skindat("at_"+name+slot,t)
    skindat("3d_"+name+slot,a3d)
    skindat("of_"+name+slot,of)
    skindat("py_"+name+slot,pary)
    skindat("vsc_"+name+slot,vscroll)
    skindat("vloop_"+name+slot,vloop)
    skindat("minsvpan_"+name+slot,vpan)
    skindat("attach_"+name+slot,attach)
    skindat("minshpan_"+name+slot,hpan)
    skindat("forceminvscreen_"+name+slot,forcevpan)
    skindat("texw_"+name+slot,sprite_get_width(spr))
    skindat("texh_"+name+slot,sprite_get_height(spr)-8*t)
    f=file_find_next()
}
file_find_close()

if but_they_got_him
    skindat("bg_"+name,1)
