#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type = unreal(type, 0);

switch (type) {
    case 1:
        i=instance_create(x, y, nslopr) break;
    case 2:
        i=instance_create(x, y, nslopl2) break;
    case 3:
        i=instance_create(x, y, nslopr2) break;
    case 4:
        i=instance_create(x, y, nsloplu) break;
    case 5:
        i=instance_create(x, y, nslopru) break;
    case 6:
        i=instance_create(x, y, nslopl2u) break;
    case 7:
        i=instance_create(x, y, nslopr2u) break;
    case 8:
        i=instance_create(x, y, nslopls) break;
    case 9:
        i=instance_create(x, y, nsloprs) break;
    case 10:
        i=instance_create(x, y, nslopl2s) break;
    case 11:
        i=instance_create(x, y, nslopr2s) break;
    default:
        i=instance_create(x, y, nslopl) break;
}

i.norender = 1;

instance_destroy();
