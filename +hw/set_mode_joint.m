%% bioloid access functions% by Adam Lukomski, 2013%
function set_mode_joint( id )
calllib('libdxl', 'dxl_write_word', id, 8, 1023); 