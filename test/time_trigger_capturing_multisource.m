%time_trigger_capturing_multisource example

num_sources = length(t);

init_times = [];

for i=1:num_sources
	init_times(end+1) = t{i}(1);
end

T = 0.08; % Period of data capture

init_time = 1000*T*floor(min(init_times)/(1000*T));

buffer_idx = ones(1,num_sources);
valid_idx = zeros(1,num_sources);

global_timer = tic;

for i=1:20
	while((elapsed_time = toc(global_timer)) < i*T)
		read_frame = ones(1,num_sources);

		for j=1:num_sources
			while (read_frame(j))
				curr_time = t{j}(buffer_idx(j));

				if ((curr_time >= init_time+1000*((i-1)*T)) && (curr_time < init_time+1000*(i)*T))
					read_frame(j) = 1;			
					valid_idx(j) = buffer_idx(j);
					buffer_idx(j)++;
				elseif (curr_time >= init_time+1000*((i-1)*T))
					read_frame(j) = 0;
				else
					read_frame(j) = 0;
				end

			end
		end
	end

	printf("Time slot limits: [%d,%d), ", init_time+1000*((i-0)*T), init_time+1000*(i+1)*T);

	for j=1:num_sources
		if (valid_idx(j))
			printf("valid_idx(%d): %d, time: %d\t", j, valid_idx(j), t{j}(valid_idx(j)));	
		else
			printf("valid_idx(%d): NO VALID IDX\t", j);
		end
	end

	printf("\n");

	elapsed_time

	valid_idx = zeros(1,num_sources);
end
