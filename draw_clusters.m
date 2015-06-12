function draw_clusters(clusters)

n_clus = size(clusters,2);
c_styles = {'.b', '.r', '.g', '.m', '.k', '.c', '.y', '.b', '.r', '.g', '.m', '.k', '.c','.b', '.r'};

ax = gca;

cla(ax);

hold(ax, 'on');

for i=2:n_clus
	plot(clusters{i}.x, clusters{i}.y,c_styles{mod(i-1, length(c_styles))+1});
end

hold(ax, 'off');