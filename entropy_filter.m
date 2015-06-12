function [ef, v] = entropy_filter(ef, e)

BUF_SIZE = 20;

curr_len = length(ef);

e_th = mean(ef)-5*std(ef);
v=0;

if (e >= e_th)
	if curr_len >= 8
		ef = [ef(2:end) e];
	else		
		ef = [ef e];		
	end
	v = 1;
end