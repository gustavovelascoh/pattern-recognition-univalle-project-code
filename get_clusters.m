function clusters = get_clusters(x,y,labels)

clusters={};

n_clus = max(labels);

for i=1:n_clus
	cluster.id = i;
	c_x = x(labels==i);
	c_y = y(labels==i);
	cluster.points = [c_x c_y];
	clusters{i} = cluster;
end

