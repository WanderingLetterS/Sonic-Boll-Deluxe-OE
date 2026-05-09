///init_changechar()
//player walk for change screen

x=other.x-20
y=other.y

charm_init()
sprite=""
oldspr=""
sid=0
initted=1

xsc=1

name=global.charname[global.option[p2]]

size=global.size[p2]
shielded=global.shielded[p2]
alpha=1
frspd=0.5
ysc=1

charm_run("sprmanager")
sprite="walk"

if (sid=0) { //edited from a section of adiwah
    var p,list,c,tokens;

    list=string(global.spritelist[global.option[p2]])
    c=0
    do {
        p=string_pos(",",list)
        if (p=0) {if (list!="") tokens[c]=list c+=1}
        else {
            tokens[c]=string_copy(list,1,p-1) c+=1
            list=string_delete(list,1,p)
        }
    } until (p=0)

    for (i=0;i<c;i+=1) {
        if tokens[i]==sprite sid=i
    }
}
