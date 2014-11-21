function [th, r] = remove_bg(theta, laser_data, bg_data)

clear figure;
hold off;
delta = bg_data - laser_data;
vdata = (delta > 20).*laser_data;

%th_f = 0:0.5:180; th_f = th_f*pi/180;

vth = (delta > 20).*theta';

[x,c, r] = find(vdata);
[x,c, th] = find(vth);


%h1 = polar(theta, laser_data,'bo'), set(h1,'linewidth',2,'markersize',5),hold on,
%h2 = polar(th, r, 'rx'), set(h2,'linewidth',2,'markersize',5)
%h3 = polar(theta, bg_data,'-- m'), set(h3,'linewidth',1.1)
%h4=  polar(0,0,'kp'), set(h4, 'markersize',10),axis([-8000 8000 -4000 12000])
