l = length(t);

for i=1:l

h1 = polar(th,bg_data,'r');
hold on;
polar(th,laser_data(:,i)','.b'), axis([-5000 5000 -100 10000]);

set(h1,'linewidth',2);

    if (i ~= l)
        delta = t(i+1) - t(i);
    else
        break;
    end

pause(delta/1000);

hold off;

end

