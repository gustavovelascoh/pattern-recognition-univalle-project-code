function plot_frames(th, laser_data, idx)

if (idx == 1)

subplot(1,2,1);polar(th,laser_data(:,1)','.b'); axis([-5000 5000 -100 10000]);
subplot(1,2,2);polar(th,laser_data(:,2)','.b'); axis([-5000 5000 -100 10000]);

elseif (idx == length(laser_data(1,:)))

subplot(1,2,1);polar(th,laser_data(:,idx-1)','.b'); axis([-5000 5000 -100 10000]);
subplot(1,2,2);polar(th,laser_data(:,idx)','.b'); axis([-5000 5000 -100 10000]);

else
	subplot(1,3,1);polar(th,laser_data(:,idx-1)','.b'); axis([-5000 5000 -100 10000]);title({'Frame# ' num2str(idx-1)});
	subplot(1,3,2);polar(th,laser_data(:,idx)','.b'); axis([-5000 5000 -100 10000]);title({'Frame# ' num2str(idx)});
	subplot(1,3,3);polar(th,laser_data(:,idx+1)','.b'); axis([-5000 5000 -100 10000]);title({'Frame# ' num2str(idx+1)});
end