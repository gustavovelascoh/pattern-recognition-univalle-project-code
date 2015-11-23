%get_object_trajectory(objs,i)

n_links = length(objs{o_id}.links);
links = o_id;
centers = [objs{o_id}.center'];
while n_links == 1
	link = objs{o_id}.links;
	centers = [centers objs{link}.center'];
	o_id=link;
	links = [links link];
	n_links = length(objs{o_id}.links);
end

printf("object %d has %d links\n", links(1), length(links));

if n_links == 2
	printf("Object have 2 links\n");
elseif n_links == 0
	printf("Object have no links\n");
end