#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c9=position_meeting(x+24,y-8,groundback)  || position_meeting(x+24,y-8,slopel1b) || position_meeting(x+24,y-8,slopel2b) || position_meeting(x+24,y-8,nsloplb) || position_meeting(x+24,y-8,nslopl2b) || position_meeting(x+24,y-8,nsloplub) || position_meeting(x+24,y-8,nslopl2ub) || x=region.x-16
c6=position_meeting(x+24,y+8,groundback)  || position_meeting(x+24,y+8,slopel1b) || position_meeting(x+24,y+8,slopel2b) || position_meeting(x+24,y+8,uslopel2b) || position_meeting(x+24,y+8,uslopel1b) || position_meeting(x+24,y+8,nsloplb) || position_meeting(x+24,y+8,nslopl2b) || x=region.x-16
c7=position_meeting(x-8,y-8,groundback)  || position_meeting(x-8,y-8,sloper1b) || position_meeting(x-8,y-8,sloper2b) || position_meeting(x-8,y-8,usloper2b) || position_meeting(x-8,y-8,usloper1b) || position_meeting(x-8,y-8,nsloprb) || position_meeting(x-8,y-8,nslopr2b) || position_meeting(x-8,y-8,nsloprub) || position_meeting(x-8,y-8,nslopr2ub)  || x=region.lefthand
c4=position_meeting(x-8,y+8,groundback)  || position_meeting(x-8,y+8,sloper1b) || position_meeting(x-8,y+8,sloper2b) || position_meeting(x-8,y+8,usloper1b) || position_meeting(x-8,y+8,usloper2b) || position_meeting(x-8,y+8,nsloprub) || position_meeting(x-8,y+8,nslopr2ub) || x=region.lefthand
c1=position_meeting(x-8,y+24,groundback) || position_meeting(x-8,y+24,nsloprub) || position_meeting(x-8,y+24,nslopr2ub) || position_meeting(x-8,y+24,usloper2b) || position_meeting(x-8,y+24,usloper1b) || x=region.lefthand || y=region.ky-16
c3=position_meeting(x+24,y+24,groundback) || position_meeting(x+24,y+24,nsloplub) || position_meeting(x+24,y+24,nslopl2ub) || position_meeting(x-8,y+24,uslopel2b) || position_meeting(x-8,y+24,uslopel1b) || x=region.x-16 || y=region.ky-16
c8=position_meeting(x+8,y-8,groundback)
c2=position_meeting(x+8,y+24,groundback) || y=region.ky-16
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bx=x mod 32
by=y mod 32
depth1 = 1000006

if !dontrender{
sheet=global.masterterrain[biome]
terraintile=1
//---------------------------------------------------------------V Man Shut the Fuck up...
//---------------------------------------------------------V   MID MID MID MID
//It's like calculators/numpad 1 is bottomleft 2 is bottommid 3 is bottomright....

if (c1 && c2 && c3 && c4 && c6 && c7 && c8 && c9) {/*middle fill*/ tile_bake(sheet,32+bx,32+by+176*2,16,16,x,y,depth1)}
else if (!c8 && !c4 && !c6 && !c2) {/*lone tile*/ tile_bake(sheet,88,88+176*2,32,32,x-8,y-8,depth1)}
else if (!c8 && !c2) {
    if (!c4) {/*platform left*/ tile_bake(sheet,8,88+176*2,24,32,x-8,y-8,depth1)}
    else if (!c6) {/*platform right*/ tile_bake(sheet,64,88+176*2,24,32,x,y-8,depth1)}
    else {/*platform middle*/ tile_bake(sheet,32+bx,88+176*2,16,32,x,y-8,depth1)}
} else if (!c4 && !c6) {
    if (!c8) {/*pole top*/ tile_bake(sheet,88,8+176*2,32,24,x-8,y-8,depth1)}
    else if (!c2) {/*pole bottom*/ tile_bake(sheet,88,64+176*2,32,24,x-8,y,depth1)}
    else {/*pole middle*/ tile_bake(sheet,88,32+by+176*2,32,16,x-8,y,depth1)}
} else {
    if (!c4) {
        if (!c8) {
            if (!c3) {
                /*slim corner top left*/tile_bake(sheet,72,120+176*2,24,24,x-8,y-8,depth1)
            } else 
            {/*corner top left*/ tile_bake(sheet,8,8+176*2,24,24,x-8,y-8,depth1)}
        } else if (!c2) {
            if (!c9) {/*slim corner bottom left*/tile_bake(sheet,72,144+176*2,24,24,x-8,y,depth1)} 
            else {/*corner bottom left*/ tile_bake(sheet,8,64+176*2,24,24,x-8,y,depth1)}
        } else {//!4 & 8 & 2 & 6
            if (!c9 && c3 ) {tile_bake(sheet,120,80+176*2,24,16,x-8,y,depth1)}
            else if (!c3 && c9) {tile_bake(sheet,120,64+176*2,24,16,x-8,y,depth1)}
            else if (!c3 && !c9) {tile_bake(sheet,184,144+176*2,24,16,x-8,y,depth1)}
             else {/*left wall*/ tile_bake(sheet,8,32+by+176*2,24,16,x-8,y,depth1)}
        }
    } else if (!c6) {
        if (!c8) {
            if (!c1) {/*slimcorner top right*/ tile_bake(sheet,96,120+176*2,24,24,x,y-8,depth1)}
             else {/*corner top right*/ tile_bake(sheet,64,8+176*2,24,24,x,y-8,depth1)}
        } else if (!c2) {
            if (!c7) {/*slimcorner bottom right*/ tile_bake(sheet,96,144+176*2,24,24,x,y,depth1)}
             else {/*corner bottom right*/ tile_bake(sheet,64,64+176*2,24,24,x,y,depth1)}
        } else {
            if (!c1 && c7 ) {tile_bake(sheet,144,64+176*2,24,16,x,y,depth1)}
            else if (!c7 && c1) {tile_bake(sheet,144,80+176*2,24,16,x,y,depth1)}
            else if (!c7 && !c1) {tile_bake(sheet,208,144+176*2,24,16,x,y,depth1)}
            else {/*right wall*/ tile_bake(sheet,64,32+by+176*2,24,16,x,y,depth1)}
        }
    } else { // 6 && 4 
        if (!c8) {// !8 && 6 && 4 
            if (c1 && !c3) {tile_bake(sheet,128,8+176*2,16,24,x,y-8,depth1)}
            else if (c3 && !c1 ){tile_bake(sheet,144,8+176*2,16,24,x,y-8,depth1) } 
            else if(!c3 && !c1) {tile_bake(sheet,192,104+176*2,16,24,x,y-8,depth1)} 
            else {/*floor*/ tile_bake(sheet,32+bx,8+176*2,16,24,x,y-8,depth1)}
        } else if (!c2) { //8
            if (c7 && !c9) {tile_bake(sheet,128,32+176*2,16,24,x,y,depth1)}
            else if (c7 && !c9 ){tile_bake(sheet,144,32+176*2,16,24,x,y,depth1) } 
            else if(!c7 && !c9) {tile_bake(sheet,208,112+176*2,16,24,x,y,depth1)}  
            else {/*ceiling*/ tile_bake(sheet,32+bx,64+176*2,16,24,x,y,depth1)}
        } else { // 8 & 2 & 6 & 4
            if (c7+c9+c1+c3!=3) {
                if (c7+c9+c1+c3!=2){
                    if (c7+c9+c1+c3!=1){
                        tile_bake(sheet,144,128+176*2,16,16,x,y,depth1)
                    }
                    else if (!c7 && !c9 && !c1){tile_bake(sheet,176,64+176*2,16,16,x,y,depth1)}
                    else if (!c7 && !c3 && !c1){tile_bake(sheet,176,80+176*2,16,16,x,y,depth1)}
                    else if (!c7 && !c9 && !c3){tile_bake(sheet,192,64+176*2,16,16,x,y,depth1)}
                    else if (!c9 && !c3 && !c1){tile_bake(sheet,192,80+176*2,16,16,x,y,depth1)}
                }
                else if (!c7 && !c9)/*everyone except these two*/{tile_bake(sheet,144,144+176*2,16,16,x,y,depth1)}
                else if (!c7 && !c1){tile_bake(sheet,160,128+176*2,16,16,x,y,depth1)}
                else if (!c7 && !c3){tile_bake(sheet,32,144+176*2,16,16,x,y,depth1)}
                else if (!c9 && !c1){tile_bake(sheet,48,144+176*2,16,16,x,y,depth1)}
                else if (!c9 && !c3){tile_bake(sheet,128,128+176*2,16,16,x,y,depth1)} 
                else if (!c1 && !c3){tile_bake(sheet,144,112+176*2,16,16,x,y,depth1)}                                           
            }
            else if (!c7) {/*inner corner top left*/ tile_bake(sheet,192,32+176*2,16,16,x,y,depth1)}
            else if (!c9) {/*inner corner top right*/ tile_bake(sheet,176,32+176*2,16,16,x,y,depth1)}
            else if (!c1) {/*inner corner bottom left*/ tile_bake(sheet,192,16+176*2,16,16,x,y,depth1)}
            else if (!c3) {/*inner corner bottom right*/ tile_bake(sheet,176,16+176*2,16,16,x,y,depth1)}
        }        
    }
}
terraintile=0
}
instance_destroy()
