%% bioloid access functions% by Adam Lukomski, 2013%
function set_off(id)
calllib('libdxl', 'dxl_write_word', id, 24, 0);  