function y = get_entropy(frame)

tot = 0.0;
ent = 0.0;
for i=1:length(frame)
	tot = tot + frame(i)^2;
end

if (tot == 0)
	tot = eps;
end

for i=1:length(frame)
	quo = frame(i)^2 / tot;
	ent = ent + (quo * log10(quo));
end
y = -ent;