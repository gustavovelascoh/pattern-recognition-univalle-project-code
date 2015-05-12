function e_fil = filter_entropy(e)

bs = 20;
le = length(e)

e_fil = zeros(1, le);
e_buf = zeros(1,bs);

for i=1:length(e)
	%if i < bs
		%e_lim = mean(e(1:i))-4*std(e(1:i));
		%if e(i) >= e_lim
			%e_buf(i) = e(i);			
		%end
%
		%e_fil(i) = e_buf(i);
	%else
		e_lim = mean(e_buf)-5*std(e_buf);
		if e(i) >= e_lim
			e_buf = [e_buf(2:end) e(i)];
		end

		e_fil(i) = e_buf(end);
	%end

	

end
