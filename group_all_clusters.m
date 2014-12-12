n_meas = length(clusters);

clusters_gr = {};

for i=1:n_meas
	i
	clusters_gr{i} = group_clusters(clusters{i});
end
