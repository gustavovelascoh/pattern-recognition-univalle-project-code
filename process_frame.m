function output = process_frame(th, frame, bg_model, t, calib_data, final_stage)

%calib=[-4.174827 13.120000 26.700000];

% Remove background
[th1,frame1] = remove_bg(th, frame, bg_model);

% Transform from laser coordinate system to global coordinate system
% using provided calibration data
frame2 = transform_data(th1, frame1, calib_data(1), calib_data(2), calib_data(3));

% Calculing arrow points for drawing laser origin ()
%oa=[calib(2) calib(3) calib(2)+cos(calib(1)+pi/2) calib(3)+sin(calib(1)+pi/2)];

% plot foreground points
%scatter(frame2(:,1), frame2(:,2)),hold, drawArrow(oa,200,200,0.5)

% Get cluster labels using DBSCAN
labels = dbscan(frame2(:,1), frame2(:,2),100,3);

% Group clusters in a cell structure
clusters = get_clusters(frame2(:,1), frame2(:,2),labels);

output = clusters;