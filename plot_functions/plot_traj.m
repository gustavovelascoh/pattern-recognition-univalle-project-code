function plot_traj(objects)

t_styles = {'-b', '-r', '-g', '-m', '-k', '-c','-b', '-r', '-g', '-m', '-k', '-c','-b', '-r', '-g'};

n_obj = length(objects);

plot(0,0,'xr'), hold on;

for i=1:n_obj
	plot(objects{i}.mean(1,:),objects{i}.mean(2,:),t_styles{mod(i,15)+1})
end
