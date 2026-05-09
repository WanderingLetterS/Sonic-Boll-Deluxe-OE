var vx,bw,p,t,name,water,horizon,dy,curr,i;

curr=argument[1]


horizon=gamemanager.horizon[curr]
dy=view_yview[curr]
if horizon<0 horizon=0
if (horizon-224<view_yview[curr] && !(instance_exists(moranboll))){//dont draw below if it isnt necessary

    bgname=gamemanager.players[curr].region.typebg+"below"

    maxslot=skindat("ms_"+bgname)
    for (i=0;i<=maxslot;i+=1) {
        name=bgname+string(i)
        spr=skindat("tex_"+name)
        if (spr) if (skindat("fg_"+name)=argument[0]) {
            bw=skindat("texw_"+name)
            bh=skindat("texh_"+name)
            ani=skindat("af_"+name)
            of=skindat("of_"+name)
            px=skindat("px_"+name)
            sc=skindat("sc_"+name)
            py=skindat("py_"+name)
            vsc=skindat("vsc_"+name)
            vloop=skindat("vloop_"+name)
            attach=skindat("attach_"+name)


            fh=bh/ani
            hpan=skindat("minshpan_"+name)
            xvm=max(gamemanager.origin[curr],view_xview[curr])
            if hpan==0
            vx=floor(
                xvm-max(0,((xvm-offmoran-gamemanager.origin[curr])*((global.fuzzy * sign(px)) + px)+global.bgscroll*sc) mod bw )
            ) else{
                kx=abs((gamemanager.origin[curr])-(gamemanager.righthand[curr]))
                diff_kx=max(hpan*400-(kx),0)
                vx=1-( (xvm+diff_kx)/max(0.01, max(kx,hpan*400)-400) )*max(0,bw-400)
                vx+=floor(view_xview[curr])
                vx-=1
            }
            p=0

            if (instance_exists(moranboll)) {
                ky=240
            } else {
                ky=gamemanager.ky[curr]
            }
            //We want the below bg's vertical parallax point to be horizon-224, so all variables relative to 0 have to change to represent this.
            min_scroll_screen=skindat("minsvpan_"+name)
            force_min_scroll=skindat("forceminvscreen_"+name)
            anim_frame=((animbob mod max(1,ani)+1)*fh)
            //Hey all, -S- here, if hte backgroud nsystem is giving you grief just remember this: I made it and it's now your problem HAHAHAH
            yvm=max(horizon,view_yview[curr] )-horizon
            if force_min_scroll {yvm=min(yvm,min_scroll_screen*224-horizon) ky=min_scroll_screen*224+horizon } //YAHOO

            vertf=224
            if vloop!=0
                {
                    vertf-=(yvm-max(0, (yvm*py+global.bgscroll*vsc) mod fh)) mod fh
                }
            else{
                if ky<=240 vertf+=max(0,fh-224) //Single screen is an edgecase the formula can't handle.
                else vertf+=(1-(yvm)/max(0.01, (max(ky-horizon,min_scroll_screen*224)-224)))*max(0,fh-224) 
            }
            vertf=floor(vertf)
            
            bm=skindat("bm_"+name)
            if (bm=1) draw_set_blend_mode(bm_add)
            if (bm=2) draw_set_blend_mode(bm_subtract)
            if attach==2 && abs(view_yview[curr]-horizon)<224 && view_yview[curr]<=horizon {of+=(abs(view_yview[curr]-horizon))}
            else if attach && abs(view_yview[curr]-horizon)<224 && view_yview[curr]<=horizon
            of+=(abs(view_yview[curr]-horizon))*0.75+((abs(view_yview[curr]-horizon))/224)*0.25/(max(0.01,fh-224)*2)
            if !(lowdetail && bm){
                if vloop
                    vrepeats=(ceil(224/fh)+1) //it has to be at least 1 or else nothing is drawn!
                else vrepeats=1
                repeats= max((ceil(400/bw)+!(px==0 && sc==0)) *(hpan=0),1) //did this because I could swear the repeat function probably does this calculation per repeat. (i'm probably wrong)
                repeat (vrepeats){
                    repeat (repeats*vrepeats) {
                        t=max(0,horizon-(view_yview[curr]+vertf+of-fh))
                        if (t<fh) draw_sprite_part(spr,0,0,t+(anim_frame-fh),bw,fh-t,vx+p,view_yview[curr]+vertf+t+of-fh)
                        p+=bw
                    }
                    p=0
                    of+=fh
                }
            }
            if (bm) draw_set_blend_mode(0)
        }
    }
}

    if (instance_exists(moranboll)) {bgname="specialsky" dy=0}
    else bgname=gamemanager.players[curr].region.typebg + gamemanager.players[curr].region.typetime + "trans"

    if !skindat("bg_"+bgname) bgname=gamemanager.players[curr].region.typebg + "trans"
        maxslot=skindat("ms_"+bgname)
    for (i=0;i<=maxslot;i+=1) {
        name=bgname+string(i)
        spr=skindat("tex_"+name)
        if (spr) if (skindat("fg_"+name)=argument[0]) {
            bw=skindat("texw_"+name)
            bh=skindat("texh_"+name)
            ani=skindat("af_"+name)
            a3d=skindat("3d_"+name)
            of=skindat("of_"+name)
            if settings("removeassets") && i>2 i=maxslot
            fh=bh/ani
            xvm=max(gamemanager.origin[curr],view_xview[curr])
            vx=floor(
                xvm-modulo(
                    (xvm-offmoran-gamemanager.origin[curr])*skindat("px_"+name)+global.bgscroll*skindat("sc_"+name),
                    0,
                    bw
                )
            )
            p=-bw

            if (instance_exists(moranboll)) {
                ky=240
            } else {
                ky=gamemanager.ky[curr]
            }
            vertf=224-((animbob mod max(1,ani)+1)*fh)+(1-(dy+224)/(horizon+16))*max(0,fh-224)-of
            bm=skindat("bm_"+name)
            if (bm=1) draw_set_blend_mode(bm_add)
            if (bm=2) draw_set_blend_mode(bm_subtract)
            if !(lowdetail && bm)
            repeat (ceil(400/bw)+3) {
                if (a3d!=0) {
                    d3d_transform_add_rotation_x(a3d)
                    d3d_transform_add_translation(0,view_yview[curr]+224/*-(1-(view_yview[curr]+224)/ky)*max(0,fh-224)*/-of,0)
                    texture_set_interpolation(1)
                    draw_sprite(spr,0,vx+p,-((animbob mod max(1,ani)+1)*fh))
                    texture_set_interpolation(0)
                    d3d_transform_set_identity()
                } else draw_sprite(spr,0,vx+p,horizon-of)
                p+=bw
            }
            if (bm) draw_set_blend_mode(0)
        }
    }
