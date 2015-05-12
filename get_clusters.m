function clusters = get_clusters(x,y,labels)

clusters={};

n_clus = max(labels);

for i=0:n_clus
	cluster.id = i;
	cluster.x = x(labels==i);
	cluster.y = y(labels==i);
	clusters{i+1} = cluster;
end

