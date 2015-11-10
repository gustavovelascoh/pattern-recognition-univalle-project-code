%clustering

l = size(clusters_data,2);

init_idx = 1;
%init_idx = 16000;

if init_idx == 1
	feature_data = {}
end

for i=init_idx:l

	curr_data = {};

	for j=1:size(clusters_data{i},2);
		curr_clus_data = {};
		curr_clus_data.mean = clusters_data{i}.
	end

	curr_data.time = calibrated_data{i}.time;

	x = calibrated_data{i}.points(:,1);
	y = calibrated_data{i}.points(:,2);
	%points = calibrated_data{i}.points;
	labels = dbscan(x,y, 100,3);

	clusters = get_clusters(x,y,labels);
	curr_data.clusters = clusters;

	clusters_data{i} = curr_data;
end