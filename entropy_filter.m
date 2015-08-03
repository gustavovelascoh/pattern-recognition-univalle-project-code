function [ef, v, u, e_th] = entropy_filter(ef, e, BUF_SIZE = 64, K=6)

curr_len = length(ef);

u = mean(ef);

e_th = u-K*std(ef);
v=0;

if (e >= e_th)
	if curr_len >= BUF_SIZE
		ef = [ef(2:end) e];
	else		
		ef = [ef e];		
	end	
	v = 1;
end
