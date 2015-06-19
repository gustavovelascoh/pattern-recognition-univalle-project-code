l = size(ld, 2);

e0 = zeros(l,1);
e1 = zeros(l,1);

for i=1:l

	e0(i) = entropy(ld(:,i));
	[th1,frame1] = remove_bg(th, ld(:,i), bg_data);

	e1(i) = entropy(frame1);
	
	%e1(i) = get_entropy(ld(:,i));
	%e2(i) = entropy2(ld(:,i));

	%[n, h] = hist(ld(:,i), 256);
	%nn = n/sum(n);
	%e3(i) = -sum(nn(nn~=0).*log10(nn(nn~=0)));
end

plot([e0,e1]''), xlabel('Frame'), ylabel('Entropy'),title('Entropy before bg removal'),legend("be","af")
%figure,plot(e1), xlabel('Frame'), ylabel('Entropy'),title('Entropy after bg removal')
