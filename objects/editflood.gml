#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
drawregion.alarm[0]=2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lemonhappy()) {

    j=hotbar.obj[hotbar.cur]
    if (lemongrab.objlist[j,0]=groundsemi||
    lemongrab.objlist[j,0]=slopel1s||
    lemongrab.objlist[j,0]=slopel2s||
    lemongrab.objlist[j,0]=sloper1s||
    lemongrab.objlist[j,0]=sloper2s||
    lemongrab.objlist[j,0]=uslopel1s||
    lemongrab.objlist[j,0]=uslopel2s||
    lemongrab.objlist[j,0]=usloper1s||
    lemongrab.objlist[j,0]=usloper2s){
        if (x>0) if (!place_meeting(x-1,y,semicontainer) && !place_meeting(x-1,y,editflood)) instance_create(x-1,y,editflood)
        if (x<lemongrab.w[drawregion.region]-1) if (!place_meeting(x+1,y,semicontainer) && !place_meeting(x+1,y,editflood)) instance_create(x+1,y,editflood)
        if (y>0) if (!place_meeting(x,y-1,semicontainer) && !place_meeting(x,y-1,editflood)) instance_create(x,y-1,editflood)
        if (y<lemongrab.h[drawregion.region]-1) if (!place_meeting(x,y+1,semicontainer) && !place_meeting(x,y+1,editflood)) instance_create(x,y+1,editflood)

        i=instance_create(x,y,lemongrab.semis[drawregion.region])
        i.obj=lemongrab.objlist[j,0]
        i.spr=lemongrab.objlist[j,1]
        lemongrasschecker(i);
    } else if (lemongrab.objlist[j,0]=groundback||
    lemongrab.objlist[j,0]=slopel1b||
    lemongrab.objlist[j,0]=slopel2b||
    lemongrab.objlist[j,0]=sloper1b||
    lemongrab.objlist[j,0]=sloper2b||
    lemongrab.objlist[j,0]=uslopel1b||
    lemongrab.objlist[j,0]=uslopel2b||
    lemongrab.objlist[j,0]=usloper1b||
    lemongrab.objlist[j,0]=usloper2b){
        //back-ground painting
        if (x>0) if (!place_meeting(x-1,y,backcontainer) && !place_meeting(x-1,y,editflood)) instance_create(x-1,y,editflood)
        if (x<lemongrab.w[drawregion.region]-1) if (!place_meeting(x+1,y,backcontainer) && !place_meeting(x+1,y,editflood)) instance_create(x+1,y,editflood)
        if (y>0) if (!place_meeting(x,y-1,backcontainer) && !place_meeting(x,y-1,editflood)) instance_create(x,y-1,editflood)
        if (y<lemongrab.h[drawregion.region]-1) if (!place_meeting(x,y+1,backcontainer) && !place_meeting(x,y+1,editflood)) instance_create(x,y+1,editflood)

        i=instance_create(x,y,lemongrab.backs[drawregion.region])
        i.obj=lemongrab.objlist[j,0]
        i.spr=lemongrab.objlist[j,1]
    } else if (lemongrab.objlist[j,0]=waterblock) {
        //water painting
        if (x>0) if (!place_meeting(x-1,y,watercontainer) && !place_meeting(x-1,y,editflood)) instance_create(x-1,y,editflood)
        if (x<lemongrab.w[drawregion.region]-1) if (!place_meeting(x+1,y,watercontainer) && !place_meeting(x+1,y,editflood)) instance_create(x+1,y,editflood)
        if (y>0) if (!place_meeting(x,y-1,watercontainer) && !place_meeting(x,y-1,editflood)) instance_create(x,y-1,editflood)
        if (y<lemongrab.h[drawregion.region]-1) if (!place_meeting(x,y+1,watercontainer) && !place_meeting(x,y+1,editflood)) instance_create(x,y+1,editflood)

        i=instance_create(x,y,lemongrab.waters[drawregion.region])
        i.obj=lemongrab.objlist[j,0]
        i.spr=lemongrab.objlist[j,1]
    } else {
        if (x>0) if (!place_meeting(x-1,y,objcontainer) && !place_meeting(x-1,y,editflood)) instance_create(x-1,y,editflood)
        if (x<lemongrab.w[drawregion.region]-1) if (!place_meeting(x+1,y,objcontainer) && !place_meeting(x+1,y,editflood)) instance_create(x+1,y,editflood)
        if (y>0) if (!place_meeting(x,y-1,objcontainer) && !place_meeting(x,y-1,editflood)) instance_create(x,y-1,editflood)
        if (y<lemongrab.h[drawregion.region]-1) if (!place_meeting(x,y+1,objcontainer) && !place_meeting(x,y+1,editflood)) instance_create(x,y+1,editflood)

        i=instance_create(x,y,drawregion.deity)
        i.obj=lemongrab.objlist[j,0]
        i.spr=lemongrab.objlist[j,1]
        i.off=lemongrab.objlist[j,2]
        lemongrasschecker(i);
        if (hotbar.picked[hotbar.cur]) for (k=0;k<8;k+=1) i.data[k]=hotbar.data[hotbar.cur,k]
        else for (k=0;k<8;k+=1) i.data[k]=lemongrab.objlist[j,k+101]
        if (lemongrab.objlist[j,5]="align") unpack_align(i)
    }
    instance_destroy()
}
