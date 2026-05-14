//give other a red coin

if (/*!hit &&*/ active && !argument[0].diggity) {

    gamemanager.redcount+=1
    active=0
    global.scor[argument[0].p2]+=scoresequence(gamemanager.redcount)
    with (instance_create(x,y-16,redcoinping)) redvalue=gamemanager.redcount
    if (argument[0].name!="kid") {give_item(argument[0],"coin")} //coin is my favourite type of shell
    if (argument[0].name="robo") argument[0].energy+=2

    stats("red coins collected",stats("red coins collected")+1)
    if (gamemanager.redcount=8) {
        gamemanager.redcount=0
        with (redcoin) {
            instance_create(x,y,smoke)
            y=-verybignumber
            active=0
        }
        stats("red coins completed",stats("red coins completed")+1)
        sound("itemcoinredall")
        pee2=p2 p2=-1
        with (argument[0]) { //reward moved to com_item
            give_item(id,"redcoinreward")
            if global.gamemode="coop" with (player) {if (id!=other.id) give_item(id,"redcoinreward")}
        }

        p2=pee2
    } else {
        sound("itemcoinred",0,power(root12of2,gamemanager.redcount-1))
    }
    if argument[1] instance_destroy()
    return 1
}
return 0
