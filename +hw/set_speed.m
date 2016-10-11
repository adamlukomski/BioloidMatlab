%% bioloid access functions% by Adam Lukomski, 2013%
function set_speed( id, speed )
% speed in -1..1
sp = speed*1023;
if speed<0
	sp = -sp + 1024;
end
calllib('libdxl', 'dxl_write_word', id, 32, ceil(sp));