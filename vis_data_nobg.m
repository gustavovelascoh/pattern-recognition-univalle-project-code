l = length(t);

start_frame = 13597;


for i=start_frame:l

%h1 = polar(th,bg_data,'.r');
%hold on;

[th_nobg, r] = remove_bg(th, laser_data(:,i), bg_data);

h1=polar(th_nobg,r','.b'); axis([-5000 5000 -100 10000]);
text(0,10000,{['frame # ' num2str(i)], [num2str((t(i)-t(start_frame))/1000) ' s']},'VerticalAlignment','bottom', 'HorizontalAlignment','center');

set(h1,'linewidth',2);

    if (i ~= l)
        delta = t(i+1) - t(i);
    else
        break;
    end

pause(delta/10000000);

hold off;

end

