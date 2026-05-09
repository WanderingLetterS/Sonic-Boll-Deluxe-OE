///unreal(str,default)
//safe real() for use in reading skins

var res,l,c,i,valid,dot,str;
str=string(argument[0])
res="" valid=0 dot=0 l=string_length(str)
i=1
repeat(l) {
    c=string_char_at(str,i)
    if (c="," || c=".") {res+="." if (dot) {valid=0 break} dot=1}
    else if (string_pos(c,"0123456789")) {res+=c valid=1}
    else if (res="" && c="-") res="-"
    i+=1
}
if (valid) return real(res)
return argument[1]
