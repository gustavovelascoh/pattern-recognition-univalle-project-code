%feature_associating.m

objects={};

l = size(features_data,2);

for i=1:l
	objects=features_association(features_data{i}, objects);
end

