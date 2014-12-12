function plot_clusters(clusters, idx, n_plots)

c_styles = {'.b', '.r', '.g', '.m', '.k', '.c', '.y', '.b', '.r', '.g', '.m', '.k', '.c','.b', '.r'};

if n_plots == 3
for i=1:3
		n_clus = length(clusters{idx+i-1})
		subplot(1,3,i);
		for j=1:n_clus
			plot(clusters{idx+i-1}{j}.pts(:,1),clusters{idx+i-1}{j}.pts(:,2),c_styles{j}); hold on; 
		end
	end
end

if n_plots == 6
for i=1:6
		n_clus = length(clusters{idx+i-1})
		subplot(2,3,i);
		for j=1:n_clus
			plot(clusters{idx+i-1}{j}.pts(:,1),clusters{idx+i-1}{j}.pts(:,2),c_styles{j}); hold on; 
		end
	end
end
