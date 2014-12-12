%vis_clusters

function vis_clusters(t, clusters, init, fin)


c_styles = {'.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g'};

for i=init:fin

	if (i ~= fin)
	  delta = t(i+1) - t(i);
	else
	  delta = 0;
	end
	
	n_clus = length(clusters{i});
	
	for j=1:n_clus
		plot(clusters{i}{j}.pts(:,1),clusters{i}{j}.pts(:,2),c_styles{j});axis([-3000 3000 -100 6000]); hold on; 
	end
		
	pause(delta/100);
	hold off;
end
