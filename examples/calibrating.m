%calibrating/space alignment

l = size(no_bg_data,2);

calib_data = [0 0 0]

calibrated_data = {}

for i=1:l
	curr_data = {};
	curr_data.time = no_bg_data{i}.time;
	th_in = no_bg_data{i}.theta;
	data_in = no_bg_data{i}.data;
	curr_data.points = transform_data(th_in, data_in, calib_data(1),
		calib_data(2), calib_data(3));

	calibrated_data{i}=curr_data;
end