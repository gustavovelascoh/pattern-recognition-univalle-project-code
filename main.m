% Miscellaneous variables
c_styles = {'xk','.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g'};
plot_flag = true;


n_meas = size(laser_data,2);

nclus = zeros(1, n_meas);

for m=7155
%for m=1:n_meas

	laser_meas = laser_data(:,m);

	[th_1, r] = remove_bg(th, laser_meas, bg_data);

	[xr,yr]= pol2cart(th',laser_meas);
	[x,y]=pol2cart(th_1,r);

	labels = dbscan(x,y,100,3);


	n_clus(m) = max(labels);

	if plot_flag
		subplot(2,3,1), plot(xr,yr,'b.', 'markersize',5);
		subplot(2,3,2), plot(x,y,'b.', 'markersize',5);


		for i=0:n_clus(m)
			hold on;
			if i<length(c_styles)
				subplot(2,3,3), plot(x(labels==i),y(labels==i),c_styles(i+1));
%				pause;
			else
				subplot(2,3,3), plot(x(labels==i),y(labels==i),c_styles(length(c_styles)));
			end
		end
	end
end
