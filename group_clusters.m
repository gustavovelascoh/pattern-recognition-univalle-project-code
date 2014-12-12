function clusters_2 = group_clusters(clusters_1)


clusters_2 = {};
n_clus = length(clusters_1);
nn_clus = 0;

merged_cs = [];

nn= 0;

for i=1:n_clus
	
	if length(find(merged_cs == i)) == 0
		pts_1 = clusters_1{i}.pts;
	
		for j=i+1:n_clus
			if length(find(merged_cs == j)) == 0
				pts_2 = clusters_1{j}.pts;
			
				d = distancePoints(pts_1, pts_2);
			
				min_d = min(min(d));
			
				if (min_d <= 150)
					clusters_1{i}.pts = [clusters_1{i}.pts; clusters_1{j}.pts];
					clusters_1{i}.mean = mean(clusters_1{i}.pts);
				
					merged_cs(end+1) = j;
					clusters_1{j} = [];
				
				end
			end
		end
		
		merged_cs(end+1) = i;
		clusters_2{end+1} = clusters_1{i};
		i = 1;
		
	end
end

