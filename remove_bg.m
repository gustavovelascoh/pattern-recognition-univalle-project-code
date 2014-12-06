function [th, r] = remove_bg(theta, laser_data, bg_data)

delta = bg_data - laser_data;
fg = (delta > 20);

r = laser_data(fg == 1);
th = theta(fg == 1)';

