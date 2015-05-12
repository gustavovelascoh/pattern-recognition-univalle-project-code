function [th_out, data_out] = remove_bg(th, data, bg_data)

delta = bg_data - data;
fg = (delta > 20);

data_out = data(fg == 1);
th_out = th(fg == 1)';

