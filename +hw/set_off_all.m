%% bioloid access functions% by Adam Lukomski, 2013%
function set_off_all

for i=1:18
	calllib('libdxl', 'dxl_write_word', i, 24, 0);
end