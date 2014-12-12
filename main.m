% Miscellaneous variables
c_styles = {'xk','.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g'};

%plot_flag = true;
plot_flag = false;


n_meas = size(laser_data,2);


%samples per measurment
spm = size(laser_data,1);

if (exist("n_clus", "var") == 1)
    printf("variables exist");
else
   n_clus = zeros(1, n_meas);
	t_ex = zeros(1, n_meas);
	labels = {};

	no_bgs = {};
	axes_m = {};
	objects = {};
endif



%for m = 1223
%for m=1200:n_meas
for m=1251:10250
	laser_meas = laser_data(:,m);

	t_id = tic;	
	
	if mean(laser_meas) ~= 0


		[th_1, r] = remove_bg(th, laser_meas, bg_data);

		[xr,yr]= pol2cart(th',laser_meas);
		[x,y]=pol2cart(th_1,r);

		no_bgs{m} = [x,y];

		labels{m} = dbscan(x,y,100,3);

		n_clus(m) = max(labels{m});

		axes_p = zeros(n_clus(m),2);
		for i=1:n_clus(m)
			clus.id = i;
			clus.pts = [x(labels{m}==i), y(labels{m}==i)];
			clus.mean = mean(clus.pts);
			[e1, e2] = klt(x(labels{m}==i),y(labels{m}==i));
			axes_p(i,:) = sum(e2/sum(sum(e2)));
			clus.egval = sum(e2/sum(sum(e2)));
	
			if (clus.egval(2) > 0.99)
				clus.n_axes = 1;
			else
				clus.n_axes = 2;
			end
	
			clusters{m}{i} = clus;
		end	
	
		axes_m{m} = axes_p;

	else
		labels{m} = labels{m-1};
		axes_m{m} = axes_m{m-1};
		clusters{m} = clusters{m-1};
	end
	
	objects = update_objects(clusters{m},objects);
	
	t_ex(m) = toc(t_id);

	printf("Iter: %d, Num clusters: %d\n", m, n_clus(m));

	if plot_flag
		subplot(2,2,1), plot(xr,yr,'b.', 'markersize',5);
		subplot(2,2,2), plot(x,y,'b.', 'markersize',5);


		for i=0:n_clus(m)
			hold on;
			if i<length(c_styles)
				subplot(2,2,3), plot(x(labels{m}==i),y(labels{m}==i),c_styles(i+1));
%				pause;
			else
				subplot(2,2,3), plot(x(labels{m}==i),y(labels{m}==i),c_styles(length(c_styles)));
			end
			
			text( x(labels{m}==i)(1), y(labels{m}==i)(1), {num2str(i)} ,'VerticalAlignment','top', 'HorizontalAlignment','right');
		end
	end
end
