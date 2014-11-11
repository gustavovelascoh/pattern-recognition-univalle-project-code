l = length(t);

th = 0:0.5:180;

th = th * pi / 180;

for i=1:l

h1 = polar(th,bg_data,'r');
hold on;
polar(th,laser_data(:,i)','xb'), axis([-5000 5000 -100 5000]);

set(h1,'linewidth',2);

    if (i ~= l)
        delta = t(i+1) - t(i);
    else
        break;
    end

pause(delta/1000);

hold off;

end

