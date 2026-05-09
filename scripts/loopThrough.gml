//Function to go through and collect string from specific parts of the GML file
var _code,_str,_cur,_NLstr,_fileSTR,_filedir,_lookfor;
_filedir = argument1;
_lookfor = argument0;

_code = file_text_open_read(_filedir);
_str = "";
_cur = file_text_read_string(_code);
_NLstr = "";
_fileSTR = "";

//Looking for our section
while (_cur!="#define "+_lookfor) {
    file_text_readln(_code);
    _cur = file_text_read_string(_code);
}

if (_cur != "#define "+_lookfor) {
    return _str;
}

//Getting the code from our section
while (!file_text_eof(_code) && !string_starts_with(_NLstr,"#define")) {
    file_text_readln(_code);
    _fileSTR = file_text_read_string(_code);
    _NLstr = _fileSTR;
    if (!string_starts_with(_NLstr,"#define")) {
        if !(string_replace_all(_fileSTR," ","")=="")
        _str += string_replace_all(_fileSTR,chr(9)," ")+chr(10)
    }
    if (file_text_eof(_code)) break;
}
file_text_close(_code);

return _str;
