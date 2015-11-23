%plot raw data, bg model and foreground

function plot_bg_process(th, laser_frame, bg_data)

[f_th, f_data] = remove_bg(th, laser_frame, bg_data);

subplot(2,3,1:3),h=polar(th, laser_frame, ' .b');
set(h,'markersize',2);
axis([-8000 8000 0 8000], "equal", "manual");
grid on;
title("Raw laser data")
%legend("Raw data",'location', 'northeastoutside');
%legend boxoff;
subplot(2,2,3:4),h = polar(th, bg_data, ' .r');
set(h,'markersize',2);
axis([-8000 8000 0 8000], "equal", "manual"), hold on;
grid on;
title("Background model and extracted foreground");
subplot(2,2,3:4),h = polar(f_th, f_data, ' .k');
set(h,'markersize',2);
axis([-8000 8000 0 8000], "equal", "manual");
%legend("Background", "Foreground",'location', 'northeastoutside');
%legend boxoff;

% print bg_process.eps -color "-S600,400"
% print bg_process.tex -color "-S300,200"
% print bg_process.tex -color "-S225,300" "-F:4" % this prints tex file
% 	using fontsize 8
