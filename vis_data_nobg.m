l = length(no_bg_data);

%start_frame = 13597;
start_frame = 1;


for i=start_frame:l

%h1 = polar(th,bg_data,'.r');
%hold on;

	%[th_nobg, r] = remove_bg(th, laser_data(:,i), bg_data);

	h1=polar(no_bg_data{i}.theta, no_bg_data{i}.data' ,'.b'); axis([-5000 5000 -100 10000]);
	text(0,10000,{['frame # ' num2str(i)], [num2str((no_bg_data{i}.time-no_bg_data{start_frame}.time)/1000) ' s']},'VerticalAlignment','bottom', 'HorizontalAlignment','center');

	set(h1,'linewidth',2);

    if (i ~= l)
        delta = t(i+1) - t(i);
    else
        break;
    end

	pause(delta/10000000);

	hold off;

end

