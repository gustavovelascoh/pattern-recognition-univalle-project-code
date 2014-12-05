%%

%x = [1 2 3 4 5 6 7 8 9 10]'; y = [5.5 4 3 4 4 5 6 6 7 7]';

%x = [3 4 5 6 7 8 9 10]'; y = [3 4 4 5 6 6 7 7]';

x = [1 2 3 4 5 6 7 8]'; y = [1 2 3 4 5 6 5 4]';

xm = mean(x);
ym = mean(y);

x = x - xm; y = y - ym;

plot(x,y,'bo','linewidth',2);

N = length(x);

p = [x,y];

S = cov([x y]);
[evec, eval] = eig(S);

%drawArrow([zeros(2,2)+[xm ym] ((evec' * eval)+[xm ym])' ],0.1,0.1,1)
%drawArrow([zeros(2,2) (evec' * eval)' ],0.1,0.1,1);
%drawArrow([zeros(2,2) (eval * evec) ],0.1,0.1,1);
%drawArrow([zeros(2,2) evec ],0.1,0.1,1);

% Calculate projected points
ev1 = evec(:,1); pv1 = ((ev1'*([x y]'))/(ev1'*ev1))'*ev1';
ev2 = evec(:,2); pv2 = ((ev2'*([x y]'))/(ev2'*ev2))'*ev2';

hold on, plot(pv1(:,1),pv1(:,2),' >k','linewidth',2)
hold on, plot(pv2(:,1),pv2(:,2),' ^r','linewidth',2)
