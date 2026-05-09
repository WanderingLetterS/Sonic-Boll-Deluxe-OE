#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
//numbers are organized like numpad
c9=position_meeting(x+24,y-8,groundblock) || position_meeting(x+24,y-8,slopeground) || position_meeting(x+24,y-8,slopel1) || position_meeting(x+24,y-8,slopel2) || position_meeting(x+24,y-8,nslopl) || position_meeting(x+24,y-8,nslopl2)  || x=region.x-16
c6=position_meeting(x+24,y+8,groundblock) || position_meeting(x+24,y+8,slopeground) || position_meeting(x+24,y+8,slopel1) || position_meeting(x+24,y+8,slopel2) || position_meeting(x+24,y+8,nslopl) || position_meeting(x+24,y+8,nslopl2) || x=region.x-16
c7=position_meeting(x-8,y-8,groundblock) || position_meeting(x-8,y-8,slopeground) || position_meeting(x-8,y-8,sloper1) || position_meeting(x-8,y-8,sloper2) || position_meeting(x-8,y-8,nslopr) || position_meeting(x-8,y-8,nslopr2) || x=region.lefthand
c4=position_meeting(x-8,y+8,groundblock) || position_meeting(x-8,y+8,slopeground) || position_meeting(x-8,y+8,sloper1) || position_meeting(x-8,y+8,sloper2) || x=region.lefthand
c1=position_meeting(x-8,y+24,groundblock) || position_meeting(x-8,y+24,slopeground) || x=region.lefthand || y=region.ky-16
c3=position_meeting(x+24,y+24,groundblock) || position_meeting(x+24,y+21,slopeground) || x=region.x-16 || y=region.ky-16
c8=position_meeting(x+8,y-8,groundblock) || position_meeting(x+8,y-8,slopeground)
c2=position_meeting(x+8,y+24,groundblock) || y=region.ky-16
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var bx,by,sheet;

bx=x mod 32
by=y mod 32
if !dontrender
{
sheet=global.masterterrain[biome]
terraintile=1

//It's like calculators/numpad 1 is bottomleft 2 is bottommid 3 is bottomright....

if (c1 && c2 && c3 && c4 && c6 && c7 && c8 && c9) {/*middle fill*/ tile=tile_dyn(sheet,360+bx,104+by,16,16,x,y,999998)}
else if (!c8 && !c4 && !c6 && !c2) {/*lone tile*/ tile=tile_dyn(sheet,416,160,32,32,x-8,y-8,999998)}
else if (!c8 && !c2) {
    if (!c4) {/*platform left*/ tile=tile_dyn(sheet,336,160,24,32,x-8,y-8,999998)}
    else if (!c6) {/*platform right*/ tile=tile_dyn(sheet,360,160,24,32,x,y-8,999998)}
    else {/*platform middle*/ tile=tile_dyn(sheet,360+bx,160,16,32,x,y-8,999998)}
} else if (!c4 && !c6) {
    if (!c8) {/*pole top*/ tile=tile_dyn(sheet,416,80,32,24,x-8,y-8,999998)}
    else if (!c2) {/*pole bottom*/ tile=tile_dyn(sheet,416,136,32,24,x-8,y,999998)}
    else {/*pole middle*/ tile=tile_dyn(sheet,416,104+by,32,16,x-8,y,999998)}
} else {
    if (!c4) {
        if (!c8) {
            if (!c3) {
                /*slim corner top left*/tile=tile_dyn(sheet,336,80,24,24,x-8,y-8,999998)
            } else 
            {/*corner top left*/ tile=tile_dyn(sheet,336,80,24,24,x-8,y-8,999998)}
        } else if (!c2) {
            if (!c9) {/*slim corner bottom left*/tile=tile_dyn(sheet,72,144,24,24,x-8,y,999998)} 
            else {/*corner bottom left*/ tile=tile_dyn(sheet,336,136,24,24,x-8,y,999998)}
        } else {//!4 & 8 & 2 & 6
            if (!c9 && c3 ) {tile=tile_dyn(sheet,120,80,24,16,x-8,y,999998)}
            else if (!c3 && c9) {tile=tile_dyn(sheet,120,64,24,16,x-8,y,999998)}
            else if (!c3 && !c9) {tile=tile_dyn(sheet,184,144,24,16,x-8,y,999998)}
             else {/*left wall*/ tile=tile_dyn(sheet,336,104+by,24,16,x-8,y,999998)}
        }
    } else if (!c6) {
        if (!c8) {
            if (!c1) {/*slimcorner top right*/ tile=tile_dyn(sheet,96,120,24,24,x,y-8,999998)}
             else {/*corner top right*/ tile=tile_dyn(sheet,392,80,24,24,x,y-8,999998)}
        } else if (!c2) {
            if (!c7) {/*slimcorner bottom right*/ tile=tile_dyn(sheet,96,144,24,24,x,y,999998)}
             else {/*corner bottom right*/ tile=tile_dyn(sheet,392,136,24,24,x,y,999998)}
        } else {
            if (!c1 && c7 ) {tile=tile_dyn(sheet,144,64,24,16,x,y,999998)}
            else if (!c7 && c1) {tile=tile_dyn(sheet,144,80,24,16,x,y,999998)}
            else if (!c7 && !c1) {tile=tile_dyn(sheet,208,144,24,16,x,y,999998)}
            else {/*right wall*/ tile=tile_dyn(sheet,392,104+by,24,16,x,y,999998)}
        }
    } else { // 6 && 4 
        if (!c8) {// !8 && 6 && 4 
            if (c1 && !c3) {tile=tile_dyn(sheet,128,8,16,24,x,y-8,999998)}
            else if (c3 && !c1 ){tile=tile_dyn(sheet,144,8,16,24,x,y-8,999998) } 
            else if(!c3 && !c1) {tile=tile_dyn(sheet,192,104,16,24,x,y-8,999998)} 
            else {/*floor*/ tile=tile_dyn(sheet,360+bx,80,16,24,x,y-8,999998)}
        } else if (!c2) { //8
            if (c7 && !c9) {tile=tile_dyn(sheet,128,32,16,24,x,y,999998)}
            else if (c7 && !c9 ){tile=tile_dyn(sheet,144,32,16,24,x,y,999998) } 
            else if(!c7 && !c9) {tile=tile_dyn(sheet,208,112,16,24,x,y,999998)}  
            else {/*ceiling*/ tile=tile_dyn(sheet,360+bx,136,16,24,x,y,999998)}
        } else { // 8 & 2 & 6 & 4
            if (c7+c9+c1+c3!=3) {
                if (c7+c9+c1+c3!=2){
                    if (c7+c9+c1+c3!=1){
                        tile=tile_dyn(sheet,144,128,16,16,x,y,999998)
                    }
                    else if (!c7 && !c9 && !c1){tile=tile_dyn(sheet,176,64,16,16,x,y,999998)}
                    else if (!c7 && !c3 && !c1){tile=tile_dyn(sheet,176,80,16,16,x,y,999998)}
                    else if (!c7 && !c9 && !c3){tile=tile_dyn(sheet,192,64,16,16,x,y,999998)}
                    else if (!c9 && !c3 && !c1){tile=tile_dyn(sheet,192,80,16,16,x,y,999998)}
                }
                else if (!c7 && !c9)/*everyone except these two*/{tile=tile_dyn(sheet,144,144,16,16,x,y,999998)}
                else if (!c7 && !c1){tile=tile_dyn(sheet,160,128,16,16,x,y,999998)}
                else if (!c7 && !c3){tile=tile_dyn(sheet,32,144,16,16,x,y,999998)}
                else if (!c9 && !c1){tile=tile_dyn(sheet,48,144,16,16,x,y,999998)}
                else if (!c9 && !c3){tile=tile_dyn(sheet,128,128,16,16,x,y,999998)} 
                else if (!c1 && !c3){tile=tile_dyn(sheet,144,112,16,16,x,y,999998)}                                           
            }
            else if (!c7) {/*inner corner top left*/ tile=tile_dyn(sheet,192,32,16,16,x,y,999998)}
            else if (!c9) {/*inner corner top right*/ tile=tile_dyn(sheet,176,32,16,16,x,y,999998)}
            else if (!c1) {/*inner corner bottom left*/ tile=tile_dyn(sheet,192,16,16,16,x,y,999998)}
            else if (!c3) {/*inner corner bottom right*/ tile=tile_dyn(sheet,176,16,16,16,x,y,999998)}
        }
        
        
        
        
    }

}
terraintile=0

}
i=instance_create(x,y,crackedground)
i.tile=tile
instance_destroy()
