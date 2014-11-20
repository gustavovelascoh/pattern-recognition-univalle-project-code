[th_1, r] = remove_bg(th, laser_data(:,1000), bg_data);

[x,y]=pol2cart(th_1,r);

labels = dbscan(x,y,100,2);


