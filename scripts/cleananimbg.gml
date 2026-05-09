//Clean a bg without finding a replacement

var name,spr,i;
name=argument[0]+argument[2]
i = argument[3]

spr=skindat("tex_"+name+string(i))
if (spr) sprite_delete(spr)
skindat("tex_"+name+string(i),0)
skindat("tex_"+name+string(i)+"_filename","")
skindat("bg_"+name,0)
