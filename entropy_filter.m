function [ef, v, u, e_th] = entropy_filter(ef, e)

BUF_SIZE = 64;

curr_len = length(ef);

u = mean(ef);

e_th = u-6*std(ef);
v=0;

if (e >= e_th)
	if curr_len >= 8
		ef = [ef(2:end) e];
	else		
		ef = [ef e];		
	end
	
	v = 1;
end

