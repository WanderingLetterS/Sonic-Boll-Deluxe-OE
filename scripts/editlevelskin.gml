//i wish it were possible to directly edit the names of variables halfway through because trying to remember what variable was what was like finding a tooth in a corn maze

var i,chk,chk2,path,l,dir,listnum,lst,str,fn,file,files;


listnum=0

str="Default|-|Custom"
for (i=1;i<=global.lskins[0,0];i+=1) {

    lst[i]="No Level Skin|-"

    dir=global.lskins[i,0]
    if dir!=global.lbase {
       dir = globalmanager.moddir + dir
    }

    for (chk=file_find_first(dir+"*",fa_directory);chk!="";chk=file_find_next()) {
        if (chk=".") continue
        if (chk="..") continue
        file[files]=chk
        files+=1
    }
    file_find_close()

    l=1
    repeat (files) {
        files-=1
        chk=dir+file[files]
        if (file_attributes(chk,fa_directory)) {lst[i]+="|"+file[files] path[i,l]=chk l+=1}
    }

    if lst[i]!="No Level Skin|-" {
        if dir==global.lbase str+="|[BASE]" else
        str+="|"+string_replace(string_delete(global.lskins[i,0],1,string_pos("\",global.lskins[i,0])),"\","")
        num[listnum]=i
        listnum+=1
    }
}

    if !(settings("nolemonsound")) sound("lemoncontext")
    i=show_contextmenu(str,-1)
    if !(settings("nolemonsound")) sound("lemonselectitem")

if i==-1 exit
if i>1 {

    i=num[i-2]

    if !(settings("nolemonsound")) sound("lemoncontext")
    chk2=show_contextmenu(lst[i],-1)
    if !(settings("nolemonsound")) sound("lemonselectitem")

    if chk2==-1 exit
}

else if (i==1) {
    fn = filename_dir(get_open_filename("", ""))
    if (fn!="") {
        if string(global.lemonlskin) != "None" {
            global.lemonlskin="None"
            global.exception=""
            applyworldskin(global.wskins[1+global.worldskin,0])
            updatemusic()
        }

        editmanager.bundled=0
        global.lemonlskin=fn
        i=applylevelskin(fn)
        if !i global.lemonlskin="None"
        drawregion.update=1
    }
    exit;
}

if string(global.lemonlskin) != "None" {
    global.lemonlskin="None"
    global.exception=""
    applyworldskin(global.wskins[1+global.worldskin,0])
    updatemusic()
}

if (i!=0 && chk2!=0) {
    dir=path[i,chk2]
    editmanager.bundled=0 //not "return of the 1.9s" enough for this
    if global.lskins[i,0]==global.lbase global.lemonlskin=string_replace(dir,global.lbase,"")
    else global.lemonlskin=dir
    i=applylevelskin(dir)
    if !i global.lemonlskin="None"
    drawregion.update=1
}
