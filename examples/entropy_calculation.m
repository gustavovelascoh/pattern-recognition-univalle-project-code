l = size(laser_data, 2);

e0 = zeros(l,1);
e1 = zeros(l,1);
e2 = zeros(l,1);

for i=1:l
	e0(i) = entropy(laser_data(:,i));
	e1(i) = get_entropy(laser_data(:,i));
	e2(i) = entropy2(laser_data(:,i));
end