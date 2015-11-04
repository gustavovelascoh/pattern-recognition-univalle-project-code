%clustering

l = size(calibrated_data,2);

clusters_data = {}

for i=1:l

	curr_data = {};
	curr_data.time = calibrated_data{i}.time;

	x = calibrated_data{i}.points(:,1);
	y = calibrated_data{i}.points(:,2);
	labels = dbscan(x,y, 100,3);

	clusters = get_clusters(x,y,labels);
	curr_data.clusters = clusters;

	clusters_data{i} = curr_data;
end