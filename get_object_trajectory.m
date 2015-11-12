%get_object_trajectory(objs,i)

n_links = length(objs{i}.links);
links = i;
centers = [objs{i}.center'];
while n_links == 1
	link = objs{i}.links;
	centers = [centers objs{link}.center'];
	i=link;
	links = [links link];
	n_links = length(objs{i}.links);
end

printf("object %d has %d links\n", links(1), length(links));

if n_links == 2
	printf("Object have 2 links\n");
elseif n_links == 0
	printf("Object have no links\n");
end