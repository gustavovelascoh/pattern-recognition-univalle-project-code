%generate_objects

n_meas = length(clusters_gr);

objects_2={}
for i=1:7278
%for i=1:n_meas
%		i
		objects_2 = update_objects(clusters_gr{i}, objects_2);	
end
