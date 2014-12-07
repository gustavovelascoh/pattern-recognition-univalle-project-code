%
function [evec, eval] = klt(x,y)
	N = length(x);
	S = cov([x y]);
	[evec, eval] = eig(S);
end
