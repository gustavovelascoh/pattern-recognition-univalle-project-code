%plot_features.m

function plot_features(clusters_data, idx, n_plots)

c_styles = {'.b', '.r', '.g', '.m', '.k', '.c', '.b', '.r', '.g', '.m', '.k', '.c','.b', '.r'};

if n_plots == 3
	for i=1:3
		n_clus = length(clusters_data{idx+i-1}.clusters);
		subplot(1,3,i);
		for j=1:n_clus
			plot(clusters_data{idx+i-1}.clusters{j}.points(:,1),
				clusters_data{idx+i-1}.clusters{j}.points(:,2),c_styles{j}), axis([-3000 3000 -100 5900]); hold on; 
			feats = get_features(clusters_data{idx+i-1}.clusters{j});
			minmaxpts = [feats(4) feats(6) feats(5) feats(7)];
			drawBox(minmaxpts,c_styles{j}(2));
			plot(feats(2),feats(3),[" x" c_styles{j}(2)] ,'markersize',5,'linewidth',3);
		end
	end
%end

else if n_plots == 6
	for i=1:6
		n_clus = length(clusters_data{idx+i-1}.clusters);
		subplot(2,3,i);
		for j=1:n_clus
			plot(clusters_data{idx+i-1}.clusters{j}.points(:,1),
				clusters_data{idx+i-1}.clusters{j}.points(:,2),c_styles{j}), axis([-3000 3000 -100 5900]); hold on; 
			feats = get_features(clusters_data{idx+i-1}.clusters{j});
			minmaxpts = [feats(4) feats(6) feats(5) feats(7)];
			drawBox(minmaxpts,c_styles{j}(2));
		end
	end
%end

else n_plots == 1
	n_clus = length(clusters_data{idx}.clusters);
	for j=1:n_clus
		plot(clusters_data{idx}.clusters{j}.points(:,1),
			clusters_data{idx}.clusters{j}.points(:,2),c_styles{j}), axis([-3000 3000 -100 5900]); hold on; 
		feats = get_features(clusters_data{idx}.clusters{j})
		minmaxpts = [feats(4) feats(6) feats(5) feats(7)];
		drawBox(minmaxpts,c_styles{j}(2));
	end
end

end

