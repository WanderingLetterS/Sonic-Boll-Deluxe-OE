var i, size, key, _code;
size = ds_map_size(global.levelscripts);
key = ds_map_find_first(global.levelscripts);
i=0;
repeat(size) {
    _code = ds_map_find_value(global.levelscripts, key);
    if (code_exists(_code)) && (_code != 0) {
        code_destroy(_code);
    }
    key = ds_map_find_next(global.levelscripts, key);
    i+=1;
}
ds_map_clear(global.levelscripts);
