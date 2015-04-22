function e = get_entropy(data)

e = zeros(1, length(data(1,:)));
for i=1:length(data)
	e(i) = entropy(data(:,i));
end