function y=entropy2(x);
ent = 0.0;
m = mean(x);
for i=1:length(x)
quo = abs(x(i) - m);
ent = ent + (quo * log10(quo));
end
y = -ent;