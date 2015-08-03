function [m, n] = compare(a,b)

la = length(a);
lb = length(b);

m = [];
n = [];

ao = 0;
bo = 0;

for i=1:la+lb
%i	
	if (a(i-ao)~=b(i-bo))
		if (a(i-ao) < b(i-bo))
			m = [m a(i-ao)];
			%i--;
			bo++;
		else
			n = [n b(i-bo)];
			%i--;
			ao++;
		end
	end

	if (i-ao >= la)
		n = [n b(i-bo+1:end)];
		break;
	end
	if (i-bo >= lb)
		m = [m a(i-ao+1:end)];
		break;
	end
end
%ao
%bo
