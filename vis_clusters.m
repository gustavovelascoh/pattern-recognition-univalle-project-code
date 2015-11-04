%vis_clusters

l = length(clusters_data);
axis_config = [-3000 4000 0 7000];
%function vis_clusters(t, clusters, init, fin)


c_styles = {'.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g'};

for i=1:l
	
	t = clusters_data{i}.time;

	if (i ~= l)
		tn = clusters_data{i+1}.time;
		delta = tn - t;
	else
	  	delta = 0;
	end

	clusters = clusters_data{i}.clusters;
	n_clus = length(clusters);
	
	for j=1:n_clus
		plot(clusters{j}.x,clusters{j}.y,c_styles{j});
		axis(axis_config); hold on; 
	end
		
	pause(delta/100);
	hold off;
end
