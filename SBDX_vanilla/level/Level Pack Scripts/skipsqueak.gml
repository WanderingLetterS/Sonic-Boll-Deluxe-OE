#define create
child = instance_create(x,y,enemydummy)
did_jump = false;
do_delay = false;
delay = 10;

#define step
var p;
p = nearestplayer();
if (p) {
    if (p.jump) && (p.vsp < 0) && (child.grounded) && !(do_delay) {
        delay = 10;
        do_delay = true;
        did_jump = false;
        going_down = false;
    }
    
    if (did_jump) && !(p.akey) && (child.vspeed < -2.6) {
        child.vspeed = -2.6;
    }
}

if (do_delay) {
    delay = max(delay-1, 0);
    if !(delay) && !(did_jump) {
        delay = 5;
        did_jump = true;
        do_delay = false;
        child.vspeed = -6;
        child.grounded = false;
    }
}

if !(child.grounded) && !(p.jump) {
    did_jump = false;
    do_delay = false;
    going_down = false;
    delay = 10;
}

x = child.x;
y = child.y;