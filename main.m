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



%for m = 5909
for m=1:n_meas
%for m=1200:n_meas
%for m=1251:10250
	laser_meas = laser_data(:,m);

	t_id = tic;	
	
	% If laser measurment is all different than 0
	if mean(laser_meas) ~= 0

      % Apply background removal
		[th_nobg, r] = remove_bg(th, laser_meas, bg_data);
		% Transform points to cartesian coordinates
		[xr,yr]= pol2cart(th',laser_meas);
		[x,y]=pol2cart(th_nobg,r);
		
		% Cell structure for storing foreground points
		no_bgs{m} = [x,y];
		
		% Apply DBSCAN on foreground points to identify clusters
		labels{m} = dbscan(x,y,100,3);
		% Get number of cluster in current measurment
		n_clus(m) = max(labels{m});
		
		% Intialise array for storing KLT transform
		axes_p = zeros(n_clus(m),2);
		
		% Apply KLT (PCA) for each cluster to identify components and classify it
		% into 1-axis or 2-axis object
		for i=1:n_clus(m)
			
			% Adding some info to clus object
			clus.id = i;
			clus.pts = [x(labels{m}==i), y(labels{m}==i)];
			clus.mean = mean(clus.pts);
			
			%Apply KLT transform and normalize components
			[e1, e2] = klt(x(labels{m}==i),y(labels{m}==i));
			axes_p(i,:) = sum(e2/sum(sum(e2)));
			clus.egval = sum(e2/sum(sum(e2)));
			
			% If one component have more than 99%, is considered as 1-axis object
			% else, is considered as 2-axis object
			if (clus.egval(2) > 0.99)
				clus.n_axes = 1;
			else
				clus.n_axes = 2;
			end
			
			% Save cluster info to cell
			clusters{m}{i} = clus;
		end	
		
		% Array for storing axes information
		axes_m{m} = axes_p;

	else
		labels{m} = labels{m-1};
		axes_m{m} = axes_m{m-1};
		clusters{m} = clusters{m-1};
	end
	
	% Identify objects within current clusters and previous clusters
%	objects = update_objects(clusters{m},objects);
	
	t_ex(m) = toc(t_id);

	printf("Iter: %d, Num clusters: %d\n", m, n_clus(m));

	if plot_flag
		subplot(2,2,1), plot(xr,yr,'b.', 'markersize',5), axis([-3000 3000 -100 5900]); hold on;
		subplot(2,2,2), plot(x,y,'m.', 'markersize',5), axis([-3000 3000 -100 5900]); hold on;


		for i=1:n_clus(m)
			hold on;
			if i<length(c_styles)
				subplot(2,2,3), plot(x(labels{m}==i),y(labels{m}==i),c_styles(i+1)), axis([-3000 3000 -100 5900]); hold on;
				subplot(2,2,4), plot(x(labels{m}==i),y(labels{m}==i),c_styles(i+1)), axis([-3000 3000 -100 5900]); hold on;
%				pause;
			else
				subplot(2,2,3), plot(x(labels{m}==i),y(labels{m}==i),c_styles(length(c_styles))), axis([-3000 3000 -100 5900]); hold on;
				subplot(2,2,4), plot(x(labels{m}==i),y(labels{m}==i),c_styles(length(c_styles))), axis([-3000 3000 -100 5900]); hold on;
			end
			
			subplot(2,2,3),text( x(labels{m}==i)(1), y(labels{m}==i)(1), {num2str(i)} ,'VerticalAlignment','top', 'HorizontalAlignment','right');
			subplot(2,2,4),text( x(labels{m}==i)(1), y(labels{m}==i)(1), {['# of Axes: ' num2str(clusters{m}{i}.n_axes)]} ,'VerticalAlignment','top', 'HorizontalAlignment','right');
		end
	end
end
