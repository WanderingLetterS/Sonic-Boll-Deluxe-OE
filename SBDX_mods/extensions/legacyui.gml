/*
*****************************************************************************
* Sonic Boll Classic / v1.8 / v1.9 b12 UI                                   *
*****************************************************************************

Extension by Christian32307 

Big thank you to the former Boll Team members, and those at Cherry Treehouse!

*/

#define data
name="Legacy UI"
desc="Changes the Main Menu and certain system graphics to look like Classic, 1.8, and early 1.9."

#define create
extdir=global.workdir+"SBDX_mods\extensions\"

//first boot
if !settings('ext_legacyui_firstboot') {
	settings('ext_legacyui_watermarktype',"2.1.6")
	//settings('ext_legacyui_useloadgraphic',1)
	settings('ext_legacyui_loadgraphic',"timer")
	settings('ext_legacyui_border',"shaded")
	settings('ext_legacyui_firstboot',1)
}

if string(settings('ext_legacyui_useloadgraphic'))=="1" {settings('ext_legacyui_useloadgraphic',0) settings('ext_legacyui_loadgraphic',"timer")}
if string(settings('ext_legacyui_loadgraphic'))=="" settings('ext_legacyui_loadgraphic',"timer")
if string(settings('ext_legacyui_border'))=="" settings('ext_legacyui_border',"shaded")

if (settings('ext_legacyui_watermarktype')=="216" || settings('ext_legacyui_watermarktype')=="180") {
	ping("Legacy UI: Thexx settings values have changed. #Please visit the Mod Loader.")
	message.depth=captain.depth-1
}

//if !settings('ext_legacyui_customwatermark') settings('ext_legacyui_customwatermark',"SONIC BOLL DELUXE")

global.sprite150=sprite_add(extdir+"legacyui\sprite150.png",0,0,0,15,3)
global.sprite216=sprite_add(extdir+"legacyui\sprite150-216.png",0,0,0,15,3)
global.spr_borderlegacy=sprite_add(extdir+"legacyui\bg_story.png",0,0,0,0,0)
global.spr_borderclassic=sprite_add(extdir+"legacyui\bg_story_classic.png",0,0,0,0,0)
global.spr_load=sprite_add(extdir+"legacyui\spr_load.png",0,0,0,4,10)
global.spr_firebarloader=sprite_add(extdir+"legacyui\spr_firebar.png",4,1,0,8,8)
global.spr_menuback=sprite_add(extdir+"legacyui\spr_menuback.png",0,0,0,15,3)
global.spr_rostergo=sprite_add(extdir+"legacyui\spr_rostergo_strip2.png",0,0,0,64,8)
global.spr_rostergo_over=sprite_add(extdir+"legacyui\spr_rostergo_strip2_over.png",0,0,0,64,8)
global.ext_configicon=sprite_add(extdir+"legacyui\config-icon.png",0,0,0,6,6)

//too lazy to do this in a good way
global.spr_gamemode_classic=sprite_add(extdir+"legacyui\spr_gamemode_classic.png",0,0,0,52,4)
global.spr_gamemode_classic_over=sprite_add(extdir+"legacyui\spr_gamemode_classic_over.png",0,0,0,52,4)
global.spr_gamemode_battle=sprite_add(extdir+"legacyui\spr_gamemode_battle.png",0,0,0,52,4)
global.spr_gamemode_battle_over=sprite_add(extdir+"legacyui\spr_gamemode_battle_over.png",0,0,0,52,4)
global.spr_gamemode_timeattack=sprite_add(extdir+"legacyui\spr_gamemode_timeattack.png",0,0,0,52,4)
global.spr_gamemode_timeattack_over=sprite_add(extdir+"legacyui\spr_gamemode_timeattack_over.png",0,0,0,52,4)
global.spr_gamemode_coop=sprite_add(extdir+"legacyui\spr_gamemode_coop.png",0,0,0,52,4)
global.spr_gamemode_coop_over=sprite_add(extdir+"legacyui\spr_gamemode_coop_over.png",0,0,0,52,4)


//sprite_replace(spr_border,extdir+"legacyui\bg_story.png",0,0,0,0,0)
sprite_replace(spr_bigbuttons,extdir+"legacyui\spr_bigbuttons_strip30.png",30,0,0,24,24)
sprite_replace(spr_matchoptionsbg,extdir+"legacyui\spr_matchoptionsbg_strip3.png",0,0,0,0,0)
sprite_replace(spr_rostercard,extdir+"legacyui\spr_rostercard_strip12.png",12,0,0,17,17)
sprite_replace(spr_rosteroptions,extdir+"legacyui\spr_rostercog_strip4.png",4,0,0,12,12)

global.og_spr_border=sprite_duplicate(spr_border)
if settings('ext_legacyui_border')=='shaded' sprite_assign(spr_border,global.spr_borderlegacy)
if settings('ext_legacyui_border')=='flat' sprite_assign(spr_border,global.spr_borderclassic)

global.og_spr_loader=sprite_duplicate(spr_loader)
if settings('ext_legacyui_loadgraphic')=='timer' sprite_assign(spr_loader,global.spr_load)
if settings('ext_legacyui_loadgraphic')=='fireball' sprite_assign(spr_loader,global.spr_firebarloader) 

if mariosonicbg=0 {
	globalvar mariosonicbg;
	mariosonicbg=object_add() 
}

object_set_persistent(mariosonicbg, 0)
object_set_visible(mariosonicbg, 1)
object_set_depth(mariosonicbg, 100000)

object_setevent(mariosonicbg, ev_other, ev_user0, "
	xx=0 yy=(room=roster)*224
	repeat (8) {
		repeat (9) {
			draw_sprite_part_ext(global.spr_menuback,0,floor(global.mariosonic)*48,0,48,32,xx,yy,1,1,$ffffff,other.v)
			xx+=48 
		}
		xx=0
		yy+=32
	}
")

object_setevent(mariosonicbg, ev_other, ev_user1, "
	xx=0 yy=(room=roster)*224
	repeat (8) {
		repeat (9) {
			draw_sprite_part_ext(global.spr_menuback,0,floor(global.mariosonic)*48,0,48,32,xx,yy,1,1,$ffffff,1-other.v)
			xx+=48 
		}
		xx=0
		yy+=32
	}
")

object_setevent(mariosonicbg, ev_draw, 0, "
	xx=0 yy=(room=roster)*224
	repeat (8) {
		repeat (9) {
			draw_sprite_part(global.spr_menuback,0,floor(global.mariosonic)*48,0,48,32,xx,yy)
			xx+=48 
		}
		xx=0
		yy+=32
	}
")


if ext_legacyuicog=0 {
	globalvar ext_legacyuicog;
	ext_legacyuicog=object_add() 
}

object_set_persistent(ext_legacyuicog, 0)
object_set_visible(ext_legacyuicog, 0)
object_set_depth(ext_legacyuicog, 0)
object_set_sprite(ext_legacyuicog,global.ext_configicon)
object_setevent(ext_legacyuicog, ev_step, 0, "
	if (room=modloader && modtyper.visible) {
		if (string(modtyper.name)=='Legacy UI' && instance_exists(modtoggle)) {
			drawconfigbutton=1
			modtoggle.x=modtoggle.xstart-12 
			x=modtoggle.x+92 y=modtoggle.y-1
			visible=1
		} else {modtoggle.x=modtoggle.xstart x=-32 y=-32 visible=0 drawconfigbutton=0 imconfigure=0}
	}
	
	input_get(-1) 
	input_keystates()
	
	with genericcursor {
		depth=-1
		ext_legacyuiover=instance_position(x,y,ext_legacyuicog)
		if (ext_legacyuiover && akey) {ext_legacyuicog.imconfigure=1}
		
		if (ext_legacyuicog.imconfigure) {x=xprevious y=yprevious}
	}
	
	if imconfigure {
		extdir=global.workdir+'mods\extensions\'
		genericcursor.visible=0
		a=approach_val(a,1,0.05) 
		
		if (bkey || input_esc()) imconfigure=0
		
		if (xbut) {
			if settings('ext_legacyui_watermarktype')=='2.1.6' settings('ext_legacyui_watermarktype','1.8 DEMO')
			else if settings('ext_legacyui_watermarktype')=='1.8 DEMO' settings('ext_legacyui_watermarktype','custom') 
			else if settings('ext_legacyui_watermarktype')=='custom' settings('ext_legacyui_watermarktype','none') 
			else if settings('ext_legacyui_watermarktype')=='none' settings('ext_legacyui_watermarktype','2.1.6') 
			else settings('ext_legacyui_watermarktype','none')
		}
		
		if (sbut && settings('ext_legacyui_watermarktype')='custom') {
			settings('ext_legacyui_customwatermark',get_string('Enter text:','SONIC BOLL DELUXE'))
		}
		
		if (ybut) {
			//settings('ext_legacyui_useloadgraphic',!settings('ext_legacyui_useloadgraphic'))
			//if settings('ext_legacyui_useloadgraphic') sprite_replace(spr_loader,extdir+'legacyui\spr_load.png',0,0,0,4,10)
			//if !settings('ext_legacyui_useloadgraphic') sprite_assign(spr_loader,global.og_spr_loader) 
			
			if settings('ext_legacyui_loadgraphic')=='timer' settings('ext_legacyui_loadgraphic','fireball')
			else if settings('ext_legacyui_loadgraphic')=='fireball' settings('ext_legacyui_loadgraphic','modern')
			else settings('ext_legacyui_loadgraphic','timer')
			
			if settings('ext_legacyui_loadgraphic')=='timer' sprite_assign(spr_loader,global.spr_load) 
			if settings('ext_legacyui_loadgraphic')=='fireball' sprite_assign(spr_loader,global.spr_firebarloader) 
			if settings('ext_legacyui_loadgraphic')=='modern' sprite_assign(spr_loader,global.og_spr_loader) 
		}
		
		if (zbut) {
			if settings('ext_legacyui_border')=='shaded' settings('ext_legacyui_border','flat')
			else settings('ext_legacyui_border','shaded')
			
			if settings('ext_legacyui_border')=='shaded' sprite_assign(spr_border,global.spr_borderlegacy) 
			else if settings('ext_legacyui_border')=='flat' sprite_assign(spr_border,global.spr_borderclassic) 
			else sprite_assign(spr_border,global.og_spr_border) 
		}
		
	} else {a=approach_val(a,0,0.05) genericcursor.visible=1}  
")

object_setevent(ext_legacyuicog, ev_draw, 0, '
	if (room=modloader && drawconfigbutton) {
		draw_self()
	}
	
	rect(-1,-1,401,225+8,$000000,a*0.5)  
	
	if imconfigure {
		draw_set_alpha(a) draw_rectangle(134,76,135+130,77+85,1) draw_set_alpha(1) 
		rect(135,77,130,85,$008000,a) 
		draw_systext(135+32,77+3," Config #--------",$ffffff,a) 
		
		draw_omitext(135+18+2,77+25,"watermark:",$ffffff,a) draw_omitext(135+18+70,77+25,string(settings("ext_legacyui_watermarktype")),$ffffff,a) 
		if settings("ext_legacyui_watermarktype")="custom" draw_systext(135+18+70+28,77+23,replacebuttonnames("[s]"),$ffffff,a) 
		
		draw_omitext(135+18+2,77+25+10,"loader graphic:",$ffffff,a) draw_omitext(135+18+70,77+25+10,string(settings("ext_legacyui_loadgraphic")),$ffffff,a) 
		
		draw_omitext(135+18+2,77+25+20,"border style:",$ffffff,a) draw_omitext(135+18+70,77+25+20,string(settings("ext_legacyui_border")),$ffffff,a) 
		
		draw_systext(135+4,77+23,replacebuttonnames("[x]"),$ffffff,a) 
		draw_systext(135+4,77+23+10,replacebuttonnames("[y]"),$ffffff,a) 
		draw_systext(135+4,77+23+20,replacebuttonnames("[z]"),$ffffff,a)
		
		draw_systext(135+1,77+73,"Press "+replacebuttonnames("[b]")+" to close",$ffffff,a) 
	}
')

//im so funny guys
object_clearevent(runespawner, ev_create, 0)
object_setevent(runespawner, ev_create, 0, "if !instance_exists(mariosonicbg) instance_create(0,0,mariosonicbg)")

object_clearevent(rostergo, ev_step, 0)
object_setevent(rostergo, ev_step, 0, "go=0
	if (room != ta_menu) {
		with (rosterbox) if (ready) other.go=1
	} else go=1

	f=inch(f,go*(5+((1)*3)),1+(1))
	image_yscale=f/8

	if (room=ta_menu && genericcursor.xbut) {sound('systemselect') global.tasing=!global.tasing}
")

//this is so dumb
object_setevent(rostercard, ev_create, 0, "
	selflash=0
	image_speed=0
	pointed=-1
	bundle=0
	flash=0
	xsc=1
	counter=0
	is_gold=0;
	show_lock=1;

	is_mod=0
	if (room=roster || room=ta_roster) y+=8
")

object_event_add(rostercard,ev_step,0,"
	if !swappedforlegacyui {
		icon=global.chariconlegacyui[charm_get_id(name),0]
		swappedforlegacyui=1
	}
")

object_event_add(rosterctrl, ev_create, 0, "
	with rostercursor { 
		if room=roster {
			y+=8
			if p2<5 x=48+16*p2 else x=(400-128-8)+16*(p2-4)
		}
		else if room=ta_roster {
			y=224-32
			x+=62
		}
	}
	
	if room=ta_roster {
		instance_create(94,60,rostergm)
	}
")

object_event_add(rosterscroll, ev_create, 0, "
	if (room=roster || room=ta_roster) y+=8
")

object_event_add(rosterscrolldown, ev_create, 0, "
	if (room=roster || room=ta_roster) y+=8
")

object_event_add(rosterbox, ev_create, 0, "
	if (room=roster || room=ta_roster) y+=8
")

object_clearevent(rostergo, ev_create, 0)
object_setevent(rostergo, ev_create, 0, "
	event_inherited()
	mask_index=spr_optbox

	go=0 f=0
")

object_clearevent(rostergo, ev_draw, 0)
object_setevent(rostergo, ev_draw, 0, "if (f>0) {
	depth=1
	if over draw_sprite_ext(global.spr_rostergo_over,0,x,y+4-(f/2),1,0+(f/8),0,c_white,1) else draw_sprite_ext(global.spr_rostergo,0,x,y+4-(f/2),1,0+(f/8),0,c_white,1)
    if over>1 over=1
    tcol=$ffffff
    rcol=$8000
    if (room == ta_menu && global.levellist[stagepick.sel+1,2] == 1) {
        tcol=$808080
        rcol=$180060
    }
    over=0
    global.halign=1
    global.valign=1
    if (room==ta_menu && global.tasing) tcol=$f8
    draw_systext(x,y,lang('roster ready'),tcol,(f-2)/3)
    global.halign=0
    global.valign=0

}")

object_clearevent(rosterctrl, ev_draw, 0)
object_setevent(rosterctrl, ev_draw, 0, "
	if (room=ta_roster) {depth=10 draw_sprite(spr_border,0,0,0)}
	else {
		texture_set_interpolation(1)
		draw_sprite(spr_matchoptionsbg,0,-32+floor(k),0)
		draw_sprite(spr_matchoptionsbg,2,0,0)
		draw_sprite(spr_matchoptionsbg,1,0,0)
		texture_set_interpolation(0)
		depth=10 draw_sprite(spr_border,0,0,224)
		k=(k + 0.2875) mod 32
	}

	var pfx;
	if (page=0) prx=lang('roster cast')
	else prx=lang('roster charmcast')
	global.halign=1
	num1=200
	num2=248-16
	if room=ta_roster {num1=248+8 num2=28+8}
	draw_systext(num1,num2,prx+string(page+1)+'/'+string(maxpage))
	global.halign=0
")

object_setevent(rosteroptions, ev_create, 0, "
	if room=roster {x=254 y=264-8}
	rostergm.x=200-2 rostergm.y=y-4
")
object_clearevent(rosteroptions, ev_draw, 0)
object_setevent(rosteroptions, ev_draw, 0, "
	draw_sprite(sprite_index,!!over,x,y)
	over=0
")

object_clearevent(rostergm, ev_step, ev_step_end)
object_setevent(rostergm,ev_step,ev_step_end,"
	pcount=-1
	with (rosterbox) if (ready) other.pcount+=1
	
	over=0
	with rostercursor if instance_place(x,y,other) other.over=1
	if room=ta_roster global.gamemode='timeattack'
")

object_clearevent(rostergm, ev_draw, 0)
object_setevent(rostergm,ev_draw,0,"
	var i,col;
	
	if global.gamemode='classic' {
		if over draw_sprite(global.spr_gamemode_classic_over,0,x,y) 
		else draw_sprite(global.spr_gamemode_classic,0,x,y) 
	} 
	else if global.gamemode='battle' {
		if over draw_sprite(global.spr_gamemode_battle_over,0,x,y) 
		else draw_sprite(global.spr_gamemode_battle,0,x,y) 
	}
	else if global.gamemode='timeattack' {
		if over draw_sprite(global.spr_gamemode_timeattack_over,0,x,y) 
		else draw_sprite(global.spr_gamemode_timeattack,0,x,y) 
	}
	if global.gamemode='coop' {
		if over draw_sprite(global.spr_gamemode_coop_over,0,x,y) 
		else draw_sprite(global.spr_gamemode_coop,0,x,y) 
	} 

	col=$FFFFFF
	if global.gamemode=='battle' col=$4B4BFF
	else if global.gamemode=='coop' col=$4BFF4B
	else if global.gamemode=='timeattack' col=$FF3860

	global.halign=1
	if global.gamemode=='timeattack' draw_systext(x+12,y,lang('gamemode '+global.gamemode),col,1)
	else draw_systext(x,y,lang('gamemode '+global.gamemode),col,1)
	global.halign=0
")
object_clearevent(segafade,ev_draw,0)
object_setevent(segafade,ev_draw,0,'
if (fadetables("msbg",room,goto) && !forcefade) {
    with (mariosonicbg) event_user(0)
} else {
    draw_set_blend_mode(bm_subtract)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,color,0.5)  //intel graphics performing unnecessary alpha test
    draw_set_blend_mode(bm_add)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,0,1)
    draw_set_blend_mode(0)
}

if (fadetables("border",room,goto) && !forcefade) {
    draw_sprite(spr_border,0,0,view_yview[0])
    with (mmicon) if (image_index=5 || image_index=7) event_perform(ev_draw,0) 
    with (rosterrandom) event_perform(ev_draw,0)
    if (goto=change) with (mmicon) if (image_index=1) event_perform(ev_draw,0)
    draw_sprite_ext(spr_border,0,0,view_yview[0],1,1,0,$ffffff,v)
    if (goto!=change) with (mmicon) if (image_index=1) event_perform(ev_draw,0)
}
')

object_clearevent(segafadein,ev_draw,0)
object_setevent(segafadein,ev_draw,0,'
if (fadetables("msbg",global.lastroom,room)) {
    with (mariosonicbg) event_user(1)
} else {
    draw_set_blend_mode(bm_subtract)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,color,0.5) //intel graphics performing unnecessary alpha test
    draw_set_blend_mode(bm_add)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,0,1)
    draw_set_blend_mode(0)
}

if (fadetables("border",global.lastroom,room)) {
    draw_sprite(spr_border,0,0,view_yview[0])                    
    with (mmicon) if (image_index=5 || image_index=7) event_perform(ev_draw,0) 
    with (rosterrandom) event_perform(ev_draw,0)
    draw_sprite_ext(spr_border,0,0,view_yview[0],1,1,0,$ffffff,1-v)
    with (mmicon) if (image_index=1) event_perform(ev_draw,0)
}                    
')

//but what if i made you visible
object_setevent(rostergm, ev_step, 0, "visible=1 depth=rosteroptions.depth+1")

#define step

if (room!=boot && !global.ext_legacyui_loadedcards) {
	for (ext_l_ui_J=0;ext_l_ui_J<global.characters;ext_l_ui_J+=1) {
		if (!global.charmod[ext_l_ui_J] || (string(global.charname[ext_l_ui_J])="simple" || string(global.charname[ext_l_ui_J])="mighty")) { //replace base character cards (or if you're one of these two)
			if file_exists(extdir+"legacyui\playercards\"+string(global.charname[ext_l_ui_J])+"-card.png") {
				if string(global.charname[ext_l_ui_J])="mighty" global.ext_legacyui_mightyexists=ext_l_ui_J+1
				global.chariconlegacyui[ext_l_ui_J,0]=sprite_add(extdir+"legacyui\playercards\"+string(global.charname[ext_l_ui_J])+"-card.png",1,0,0,12,12)
			}
		} 
		else { //replace charm character cards, if possible
			if file_exists(globalmanager.moddir+"character\"+string(global.charname[ext_l_ui_J])+"\"+string(global.charname[ext_l_ui_J])+"-card-legacyui.png") {
				global.chariconlegacyui[ext_l_ui_J,0]=sprite_add(globalmanager.moddir+"character\"+string(global.charname[ext_l_ui_J])+"\"+string(global.charname[ext_l_ui_J])+"-card-legacyui.png",1,0,0,12,12)
			}
		}
		
	}
	global.ext_legacyui_loadedcards=1
}

if room=modloader && !instance_exists(ext_legacyuicog) {instance_create(x,y,ext_legacyuicog)}

if instance_exists(rostergo) rostergo.y=rostergo.ystart+2 rostergo.mask_index=global.spr_rostergo //hitbox fix?? why do i have to do this??

//mighty easter egg from b12
if (room=roster || room=ta_roster)

with rostercursor if global.ext_legacyui_mightyexists {
	if global.option[p2]>-1 && abut {
		if (global.charname[global.option[p2]]!="sonic" && global.charname[global.option[p2]]!="knux") might=0
			else {
				if (global.charname[global.option[p2]]="sonic" && !(might mod 2)) might+=1
				else if (global.charname[global.option[p2]]="knux" && (might mod 2) && might<7) might+=1
				else might=0
				//im evil
				if (might=7) {
					global.option[p2]=global.ext_legacyui_mightyexists-1 
					with mybox {global.playerskin[p2]=-1 event_user(1)} 
					with rostercard if name="mighty" other.mybox.card=id
					might=0
				}
				
			}
	}
}

#define draw
if view_current=0 {
	if settings('ext_legacyui_watermarktype')='2.1.6' draw_sprite(global.sprite216,0,15,3)
	else if settings('ext_legacyui_watermarktype')='1.8 DEMO' draw_sprite(global.sprite150,0,15,3)
	else if settings('ext_legacyui_watermarktype')='custom' {
		rect(0,0,4*real(string_length(settings('ext_legacyui_customwatermark')))+1,7,$000000,1) 
		draw_omitext(1,1,string(settings('ext_legacyui_customwatermark')),$ffffff,1)
	}
	
	global.mariosonicc+=1
	if (global.mariosonicc>=180) {global.mariosonicc=0 if (global.mariosonicgo) global.mariosonicgo=-1 else global.mariosonicgo=1}
	global.mariosonic=median(0,global.mariosonic+0.25*global.mariosonicgo,3)
	
} 

//im lazy
/*if room=ta_roster {
	draw_sprite(global.spr_gamemode_timeattack,0,96-20,64)
	draw_systext(96-36,64,lang('gamemode '+"timeattack"),$FF3860,1)
}*/
