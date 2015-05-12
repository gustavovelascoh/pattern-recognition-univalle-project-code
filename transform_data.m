function data_out =transform_data(th_in, data_in, thd, xd, yd)

th_out = th_in + thd;

data_out = pol2cart(th_out, data_in) + [xd, yd];

