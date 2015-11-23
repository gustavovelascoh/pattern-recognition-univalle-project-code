%bg_removing

% input: frame (t[], theta[], data[])
% output: frame {{time, theta, data},...}


len = size(ld,2);
no_bg_data = {};

for i=1:len
	curr_data = {};
	[th_nobg, r] = remove_bg(th, ld(:,i), bg_data);
	
	curr_data.time = t(i);
	curr_data.theta = th_nobg;
	curr_data.data = r;

	no_bg_data{i}=curr_data;

end