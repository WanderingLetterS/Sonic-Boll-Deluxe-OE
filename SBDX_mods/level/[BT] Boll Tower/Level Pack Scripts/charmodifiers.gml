#define create

#define step
with player if p2=0 other.myplayer=id

with myplayer {
	if (name="super") {
		codeblock_stopsprmanager=0
		
		if (topping_get) {
			energy+=0.3
			topping_get-=1
		}
		
		if (bigtopping_get) {
			energy+=1
			bigtopping_get-=1
		}
	
		if (super) {
			if global.pizzatime=1 energy+=0.00125
			if global.pizzatime>1 energy+=0.03
			
			//mania flight
			if fall=10 fall=13
			if (fall=13) {
				if abut { 
					if !insted {
					 //Super Dash
						insta=0
						insted=1
						fall=0
						braking=0
						sprung=0
						d=point_direction(0,0,right-left,down-up)
						if (!right && !left && !down && !up) d=90
						var yeoldehsp;
						yeoldehsp=hsp
						hsp+=lengthdir_x(4,d)
						if abs(hsp)>4.5 {
							hsp=4.5*sign(hsp)
							if abs(yeoldehsp)>4.5 {
								hsp=yeoldehsp
							}
						}

						vsp+=lengthdir_y(4,d)-1
						vsp=median(-7,vsp,7)
						throwsparks(x,y)
						screenshake(x,2)
						playsfx(name+"release")
					} else fall=0
				}
			
				codeblock_stopsprmanager=1
				set_sprite("dash") frspd=1
				luijump=1
				spin=1
				vsp-=0.15
				hsp+=(right-left)*0.25
				vsp+=(down-up)*0.3+0.05+0.1*max(0,2-abs(hsp))*(vsp<2)
				l=median(0,point_distance(0,0,hsp,vsp)-0.05,min(maxspd,5))
				d=point_direction(0,0,hsp,vsp)
				hsp=lengthdir_x(l,d)
				vsp=lengthdir_y(l,d)
				xsc=esign(hsp,xsc)
			}
			
			
		}
		
		
	}
}

#define draw