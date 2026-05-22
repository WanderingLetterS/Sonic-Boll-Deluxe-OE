#define create
if global.spr_itspizzatime=0 {
	thefile=filename_path(global.lemonfilename)+"tower_assets\itspizzatime.png"
	if !file_exists(thefile) instance_destroy()
	else global.spr_itspizzatime=sprite_add(filename_path(global.lemonfilename)+"tower_assets\itspizzatime.png",2,1,0,75,62)
}

image_speed=0.1
draw_y=224+32

#define step
draw_x=floor(view_xview+view_wview/2)

draw_y-=2
if draw_y<-32 instance_destroy()

#define draw
depth=-9999
draw_sprite(global.spr_itspizzatime,image_index,draw_x,view_yview+draw_y)