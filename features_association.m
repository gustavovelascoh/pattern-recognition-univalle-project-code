%features_association

function objects=features_association(features, objects)

%objects={}

n_feats=length(features.features);
n_objs=length(objects);
obj_ids = n_objs;

if (n_objs == 0)
	for i=1:n_feats
		feats = features.features{i}.features;
		obj = {};
		obj.id = ++obj_ids;
		obj.n_axes = feats(1);
		obj.box = [feats(4) feats(6) feats(5) feats(7)];
		obj.center = [feats(2) feats(3)];
		obj.time = features.time;
		obj.linked = 0;
		obj.links = [];

		objects{obj.id} = obj;
	end
else
	for i=1:n_feats
		feats = features.features{i}.features;
		obj = {};
		obj.id = ++obj_ids;
		obj.n_axes = feats(1);
		obj.box = [feats(4) feats(6) feats(5) feats(7)];
		obj.center = [feats(2) feats(3)];
		obj.time = features.time;
		obj.linked = 0;
		obj.links = [];

		match = 0;

		for j=1:n_objs
			target_obj = objects{j};
			if target_obj.linked == 0
				
				in_box = inpolygon(obj.center(1),
								obj.center(2),
								[target_obj.box(1:2) fliplr(target_obj.box(1:2))], 
								[target_obj.box(3) target_obj.box(3:4) target_obj.box(4)]);
				%printf("%d, %d, [%d %d], [%d %d]\n",obj.center(1),
				%				obj.center(2),
				%				target_obj.box(1),target_obj.box(2), 
				%				target_obj.box(3),target_obj.box(4));
				
				if in_box==1
					%printf("new_obj %d is related with old_obj %d\n", obj.id, target_obj.id);
					target_obj.linked = 1;
					target_obj.links = [obj.links obj.id];
					objects{target_obj.id} = target_obj;
					%obj.links = [obj.links target_obj.id];
					objects{obj.id} = obj;
					
					match = 1;

				else
					%printf("new_obj %d is not related with old_obj %d\n", obj.id, target_obj.id);

				end
			end
		end

		if (match == 0)
			objects{obj.id} = obj;
		end
		%objects{obj.id} = obj;
	end
end