%% bioloid access functions% by Adam Lukomski, 2013%
function set_mode_joint_all()

id_list = [ 17 15 13 11 9 7 8 10 12 14 16 18 ];
id_plus = [ 0  0  0  0  0 pi/4 pi/4 0 0 0 0 0 ];
id_mul  = [ -1  1  1  -1  1 1 -1 -1 -1  1  1 1 ];


for j=1:length(id_list)
	hw.set_mode_joint( id_list(j) );
	hw.set_speed( id_list(j), 0.1 );
end
	