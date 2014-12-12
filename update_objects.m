function objects = update_objects(clusters, objects)

n_obj = length(objects);

n_clus = length(clusters)

if n_obj == 0
	
	obj_id = 1;
	
	for i=1:n_clus
		obj.id = obj_id;
		obj.mean = clusters{i}.mean';
		obj.n_axes = clusters{i}.n_axes;
		
		objects{obj_id} = obj;
		obj_id++;
	end
else
	obj_id = n_obj+1;
	
	act_objs = [];
	means = [];
	for i=1:n_obj
	
		act_objs(end+1) = objects{i}.id;
		means(:,end+1) = objects{i}.mean(:,end);
	
	end
	
	for i=1:n_clus
		ds = distancePoints(clusters{i}.mean,means');
		
		closest_idx = max(find(ds < 40));
		
		% Si hay alguno cercano
		if length(closest_idx) == 0
			obj.id = obj_id;
			obj.mean = clusters{i}.mean';
			obj.n_axes = clusters{i}.n_axes;
		
			objects{obj_id} = obj;
			obj_id++;
		else
			objects{closest_idx}.mean(:,end+1) = clusters{i}.mean';
			objects{closest_idx}.n_axes(end+1) = clusters{i}.n_axes;
		end
	end
	
end
