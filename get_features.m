%get_features
function f = get_features(cluster)

	[e1, e2] = klt(cluster.points(:,1), cluster.points(:,2));
	[c] = mean(cluster.points);
	[maxs] = max(cluster.points);
	[mins] = min(cluster.points);

	e2_p = sum(e2/sum(sum(e2)));
	if (e2_p(2) > 0.99)
		n_axes = 1;
	else
		n_axes = 2;
	end


f = [n_axes, c, mins, maxs];