%% bioloid access functions% by Adam Lukomski, 2013%
function q = set_pose( u, mode )

if ~exist('mode')
	mode = 1;
end

id_list = [ 17 15 13 11 9 7 8 10 12 14 16 18 ];
id_plus = [ 0  0  0  0  0 pi/4 pi/4 0 0 0 0 0 ];
id_mul  = [ -1  1  1  -1  1 1 -1 -1 -1  1  1 1 ];

if ~exist( 'u' )
	q = [];
	% grab position from bioloid
	for j=1:length(id_list)
		q(j) = hw.get_position( id_list(j) );
	end
	q = q.*id_mul + id_plus;
	q = q';
else
	u = reshape(u,[1 12]);
	if mode == 1
		% apply torques to bioloid
%  		uu = u;
		uu = u.*id_mul;
		for id = 1:length(id_list)
			hw.set_speed( id_list(id), uu(id) );
		end
	else
	% apply positions to bioloid
		u = (u - id_plus).*id_mul;
		for id = 1:length(id_list)
			hw.set_position( id_list(id), u(id) );
		end
	end
end
