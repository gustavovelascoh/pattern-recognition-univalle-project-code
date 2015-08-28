%time_trigger_capturing example

T = 0.033; % Period of data capture

init_time = 1000*T*floor(t(1)/(1000*T));

buffer_idx = 1;
valid_idx = 0;

global_timer = tic;

for i=1:20
	while((elapsed_time = toc(global_timer)) < i*T)
		read_frame = 1;

		

		while (read_frame)
		
			if ((t(buffer_idx) >= init_time+1000*((i-1)*T)) && (t(buffer_idx) < init_time+1000*(i)*T))
				printf("frame waiting;\n");
				read_frame = 1;			
				valid_idx = buffer_idx;
				buffer_idx++;

				%valid_idx = buffer_idx;
				
				%buffer_idx++;
				%read_frame = 0;
			elseif (t(buffer_idx) >= init_time+1000*((i-1)*T))

				%printf("frame hold;\n");
				read_frame = 0;
				%buffer_idx++;
				
			else
				
				printf("No frame available\n");
				%valid_idx = 0;
				read_frame = 0;
				%buffer_idx++;
			end
		end	
	end;

	printf("Time slot limits: [%d,%d), ", init_time+1000*((i-0)*T), init_time+1000*(i+1)*T);		

	if (valid_idx)
		printf("valid_idx: %d, time: %d\n",valid_idx, t(valid_idx));	
	else
		printf("valid_idx: NO VALID IDX\n");
	end

	elapsed_time

	valid_idx = 0;

end