#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=used in charm
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=#define projectile
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event="step"
event_user(p2)

if (is_spriteswitcher)
spriteswitch(1)
#define Other_20
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=SPOILERS AHEAD!! TURN BACK NOW!!
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if (event="create") {
    image_xscale=6
    image_yscale=6

    frame=0
    seqcount=2
    getregion(x)
    timer0=3
    depth=-1;
    gravity=0.2

    playsfx(owner.name+"boom")
}
if (event="step") {
    timer0-=1 if (timer0=0) visible=1
    calcmoving()

    ignoreoncount=1
    if (!inview()) {instance_destroy() exit;} if (brickc>=3) exit;
    ignoreoncount=0

    coll=collision(hspeed,vspeed) if (!coll) {coll=collision(0,0) if (coll) {x-=hspeed y-=vspeed}}
    if (coll) {
        if (object_is_ancestor(coll.object_index,hittable)) {
            hitblock(coll,owner,1,-1,0)
        }
        if (coll.object_index=lavablock) {brickc=3}
        if coll.object_index=phaser && coll.dir!=(-sign(vspeed)+1) exit
        instance_create(x,y+2,kickpart)
        if (coll.bbox_bottom < bbox_bottom) {brickc+=1 vspeed=0.75 hspeed = (1.8* -sign(hspeed)) y+=1 sound("enemyexplode") exit}
        else {brickc+=1 vspeed=-4.6 hspeed = (1.8* -sign(hspeed)) y-=4  sound("enemyexplode") exit}
    }

    coll=instance_place(x,y,enemy)
    if (coll) {
        if (coll.object_index!=beetle && coll.object_index!=bulletbill
        && coll.object_index!=bullseyebill && coll.object_index!=banzaibill
        && coll.object_index!=cannonball && coll.object_index!=drybones
        && coll.object_index!=bombenemy && coll.object_index!=boo
        && coll.object_index!=urchin) {
            yes=1
            if (yes) {
                global.coll=owner.id
                instance_create(x,y,kickpart)
                enemydie(coll,2)
            }
        }
        brickc+=1
        sound("enemyexplode") vspeed=-4.6 y=-4 hspeed = (1.8* -sign(hspeed)) exit
    }

    coll=instance_place(x,y,bowserboss)
    if (coll) {
        if (!coll.flash) {
            coll.hp-=1
            coll.flash=64
            coll.owner=owner
            sound("enemybowserhurt")
            instance_create(x,y,kickpart)

            brickc+=1
            sound("enemyexplode") vspeed=-4.6 y=-4 hspeed = (1.8* -sign(hspeed)) exit
        }
    }

    coll=instance_place(x,y,player)
    if (coll) {
        if (coll.id!=owner) if (!invincible(coll)) {
            if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) {
                if (coll.name="knux" && coll.glide && sign(hspeed)=-sign(coll.hsp)) {hspeed=abs(coll.hsp+1)*esign(coll.hsp,1) owner=coll.id with (owner) playsfx("knuxreflect") exit}
                if (coll.name="robo" && coll.lookup && coll.xsc=sign(hspeed)) {instance_create(x,y,kickpart) instance_destroy() exit}
                with(coll) fragplayer(other.owner)
            }
            instance_create(x,y,kickpart) brickc+=1
            sound("enemyexplode") vspeed=-4.6 y=-4 hspeed = (1.8* -sign(hspeed)) exit
        }
    }
}

if (event="draw") {
    ssw_items("btroot")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event="draw"
event_user(p2)
if (is_spriteswitcher)
spriteswitch(0)


if global.debug draw_self()
