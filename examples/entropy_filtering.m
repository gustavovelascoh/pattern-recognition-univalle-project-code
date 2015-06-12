% entropy_filtering

le = length(e0);

ef = 0;
df = [];

for i=1:le

	[ef, v] =  entropy_filter(ef, e0(i));

	if (~v)
		df = [df i];
	end
end
