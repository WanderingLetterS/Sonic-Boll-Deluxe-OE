extdir=global.workdir+"mods\extensions\"
global.extensions_step=ds_list_create();
global.extensions_draw=ds_list_create();

var _file;
_file = file_find_first(extdir+"*.gml", 0)

while(_file != "") {
    //find #defines
    var i,_code,_str,_cur,_list,_filepath;
    _filepath = extdir+_file
    if !file_exists(_filepath) {
        continue;
    }

    _code = file_text_open_read(_filepath);
    if (_code == -1) continue;

    _list = ds_list_create();

    _cur = "";
    _str = "";
    while (!file_text_eof(_code)) {
        _cur = file_text_read_string(_code);

        if string_starts_with(_cur, "#define") {
            _cur = string_delete(_cur, 1, 8)
            ds_list_add(_list,_cur)
        }

        file_text_readln(_code);
        if file_text_eof(_code) {
            break;
        }
    }
    file_text_close(_code);

    var filename,founddata;
    founddata=false;
    filename=string_copy(_file,1,string_length(_file)-4)

    i=0;
    repeat(ds_list_size(_list)) {
        var _store,_key,_compiled;
        _key = ds_list_find_value(_list,i);

        switch(_key) {
            case "data":
                _compiled = code_compile(loopThrough(_key, _filepath))
                ds_list_add(global.modlist,_compiled)
                ds_list_add(global.modtype,"extension")
                founddata=true;
            break;
            case "create":
            case "start":
                if !(settings(filename+" extension disabled")) {
                    _compiled = code_compile(loopThrough(_key, _filepath))
                    code_execute(_compiled);
                    code_destroy(_compiled);
                }
            break;
            case "step":
                if !(settings(filename+" extension disabled")) {
                    _compiled = code_compile(loopThrough(_key, _filepath))
                    ds_list_add(global.extensions_step,_compiled)
                }
            break;
            case "draw":
                if !(settings(filename+" extension disabled")) {
                    _compiled = code_compile(loopThrough(_key, _filepath))
                    ds_list_add(global.extensions_draw,_compiled)
                }
            break;
            default : show_message("Invalid define ("+_key+") in "+_file+"!") break;
        }
        i+=1;
    }

    ds_list_add(global.extensionlist,filename);

    if !(founddata) {
        ds_list_add(global.modlist,0)
        ds_list_add(global.modtype,"extension")
    }

    _file = file_find_next();
    ds_list_destroy(_list);
}
_file = file_find_close();
