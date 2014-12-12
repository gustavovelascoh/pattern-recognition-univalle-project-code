function plot_clusters(clusters, idx, n_plots)

c_styles = {'.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g', '.m', '.k', '.c','.b', '.r', '.g'};

if n_plots == 3
for i=1:3
		n_clus = length(clusters{i})
		subplot(1,3,i);
		for j=1:n_clus
			plot(clusters{idx+i-1}{j}.pts(:,1),clusters{idx+i-1}{j}.pts(:,2),c_styles{j}); hold on; 
		end
	end
end

if n_plots == 6
for i=1:6
		n_clus = length(clusters{i})
		subplot(2,3,i);
		for j=1:n_clus
			plot(clusters{idx+i-1}{j}.pts(:,1),clusters{idx+i-1}{j}.pts(:,2),c_styles{j}); hold on; 
		end
	end
end
