%% bioloid access functions% by Adam Lukomski, 2013%
function theta = get_position( id )
th = int32(calllib('libdxl','dxl_read_word',id,36));
theta = ((double(th)/1023)*300-150)/360*2*pi;