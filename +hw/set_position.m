%% bioloid access functions% by Adam Lukomski, 2013%
function set_position( id, theta )

if theta>6
	calllib('libdxl', 'dxl_write_word', id, 30, theta);
else
	th = int32(((theta/pi/2*360)+150)/300*1023);
	if th>0 & th<1023
		calllib('libdxl', 'dxl_write_word', id, 30, th);
	else
		disp('error!')
		[theta th]
	end
end
