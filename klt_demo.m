%x = [0 2 3 4 5 6 7 8 9 10]';
%y = [4 3.5 3 4 4 5 6 6 7 7]';

x = [3 4 5 6 7 8 9 10]';
y = [3 4 4 5 6 6 7 7]';

xm = mean(x);
ym = mean(y);

plot(x,y,'bo','linewidth',2);

N = length(x);

p = [x,y];

S = cov([x y]);
[evec, eval] = eig(S);
drawArrow([zeros(2,2)+[xm ym] (evec' * eval)+[xm ym] ],0.1,0.1,1)




