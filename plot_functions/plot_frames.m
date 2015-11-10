function plot_frames(th, laser_data, idx, e)

laser_data = laser_data/100;

if (idx == 1)

subplot(1,2,1);polar(th,laser_data(:,1)','.b'); axis([-50 50 -1 100]);
subplot(1,2,2);polar(th,laser_data(:,2)','.b'); axis([-50 50 -1 100]);

elseif (idx == length(laser_data(1,:)))

subplot(1,2,1);polar(th,laser_data(:,idx-1)','.b'); axis([-50 50 -1 100]);
subplot(1,2,2);polar(th,laser_data(:,idx)','.b'); axis([-50 50 -1 100]);

else

	subplot(2,2,1);polar(th,laser_data(:,idx-1)'); axis([-50 50 -1 100]);title({['Frame ' num2str(idx-1)]}); xlabel('x [m]'), ylabel('y [m]'), grid('on');
	subplot(2,2,2);polar(th,laser_data(:,idx)'); axis([-50 50 -1 100]);title({['Frame ' num2str(idx)]}); xlabel('x [m]'), ylabel('y [m]'), grid('on');
	subplot(2,2,3);polar(th,laser_data(:,idx+1)'); axis([-50 50 -1 100]);title({['Frame ' num2str(idx+1)]}); xlabel('x [m]'), ylabel('y [m]'), grid('on');
	subplot(2,2,4),plot(idx-3:idx+3,e(idx-3:idx+3)); title({['Entropy']}), xlabel('Frame'), grid('on');
end