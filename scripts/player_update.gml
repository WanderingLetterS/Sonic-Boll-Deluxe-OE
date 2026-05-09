//update all player objects in order, in parts.
//this prevents port priority from being such a huge problem.
if global.gamemode="battle" || global.gamemode="coop" {
var i;
i=0
repeat (global.mplay) {
    with (players[i]) {
        mask_reset()
        charm_run("controls")
        charm_run("movement")
        charm_run("actions")
        if (global.gamemode="coop") { //make absolutely damn sure that coop ignores collisions from pvp
            pvp_ignore=1
            pvp_avoid=1
        }
        with (mydamager) event_user(p2)
        player_camera(0)
        spriteswitch(1)
    }
    i+=1
}
/*for (i=0;i<global.mplay;i+=1) with (players[i]) {
    mask_reset()
    charm_run("controls")
}
for (i=0;i<global.mplay;i+=1) with (players[i]) {
    charm_run("movement")
}
for (i=0;i<global.mplay;i+=1) with (players[i]) {
    charm_run("actions")
    if (global.gamemode="coop") { //make absolutely damn sure that coop ignores collisions from pvp
        pvp_ignore=1
        pvp_avoid=1
    }
    with (mydamager) event_user(p2)
    //charm_run("enemycoll")
}
for (i=0;i<global.mplay;i+=1) with (players[i]) {
    player_camera(0)
    spriteswitch(1)
}*/
} else{
    var i;
    i=0
    repeat (global.mplay) {
        with(players[i]) {
            mask_reset()
            charm_run("controls")
            charm_run("movement")
            charm_run("actions")
            //Movement is for now all handled inside controls for testing purposes
            with (mydamager) event_user(p2)
            player_camera(0)
            spriteswitch(1)
        }
        i+=1
    }
}
