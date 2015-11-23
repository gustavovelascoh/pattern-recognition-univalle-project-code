%test.m

%objects={}; objects.active = {}; objects.history = {}; objects.last_id = 0;

MAX_FRAMES_WO_MATCH=5;

n_obj_act = length(objects.active);
n_feats = length(features);

for i=1:n_feats
	if (n_obj_act > 0)
		for j=1:n_obj_act
		end
		%pass
	else
		obj = {};
		obj.id = ++objects.last_id;
		obj.frames_wo_match = 0;
		obj.features = features{i};

		objects.active{end+1} = obj;
	end
end
