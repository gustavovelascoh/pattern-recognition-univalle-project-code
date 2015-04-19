l = length(t);

for i=13090:l

h1 = polar(th,bg_data,'.r');
hold on;
polar(th,laser_data(:,i)','.b'), axis([-5000 5000 -100 10000]);
text(0,10000,{['frame # ' num2str(i)]},'VerticalAlignment','bottom', 'HorizontalAlignment','center');

set(h1,'linewidth',2);

    if (i ~= l)
        delta = t(i+1) - t(i);
    else
        break;
    end

pause(delta/10000);

hold off;

end

