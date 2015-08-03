% entropy_filtering

le = length(e0);

u = zeros(1, le);
e_th = zeros(1, le);
t_ex0 = zeros(1, le);

ef = 0;
df = [];

for i=1:le

	tic;
	[ef, v, u(i), e_th(i)] =  entropy_filter(ef, e0(i));
	t_ex0(i) = toc;

	if (~v)
		df = [df i];
	end
end
