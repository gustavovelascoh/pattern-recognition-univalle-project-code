%feature_extracting

l = size(clusters_data,2);

init_idx = 1;
%init_idx = 16000;

if init_idx == 1
	features_data = {};
end

for i=init_idx:l

	curr_data = {};
	curr_data.time = clusters_data{i}.time;

	n_clus = length(clusters_data{i}.clusters);
	
	curr_feat_data = {};

	for j=1:n_clus		
		features = get_features(clusters_data{i}.clusters{j});
		curr_feat_data{j} = {};
		curr_feat_data{j}.id = clusters_data{i}.clusters{j}.id;
		curr_feat_data{j}.features =features;
	end

	curr_data.features = curr_feat_data;

	features_data{i} = curr_data;
end