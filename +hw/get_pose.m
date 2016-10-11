%% bioloid access functions% by Adam Lukomski, 2013%
function q = get_pose( u )

id_list = [ 17 15 13 11 9 7 8 10 12 14 16 18 ];
id_plus = [ 0  0  0  0  0 pi/4 pi/4 0 0 0 0 0 ];
id_mul  = [ -1  1  1  -1  1 1 -1 -1 -1  1  1 1 ];

	q = [];
	% grab position from bioloid
	for j=1:length(id_list)
		q(j) = hw.get_position( id_list(j) );
	end
	q = q.*id_mul + id_plus;
	q = q';
