%% bioloid access functions% by Adam Lukomski, 2013%
function theta = get_speed( id )
th = int32(calllib('libdxl','dxl_read_word',id,38));

if th > 1024
	th = -th+1024;
end
theta = double(th) / 1023;
