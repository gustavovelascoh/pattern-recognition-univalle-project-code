% test filtering
% 
% This script test different configurations of entropy
% filter over a previously calculated entropy vector e0.
% It uses combination of two parameters of the filter:
% Buffer_size and K,
%
% A matrix with the following columns is generated:
%
% BUFFER_SIZE
% K
% TP: True Positive
% FN: False Negative 
% FP: False Positive
% TN: True Negative
% ACC: Accuracy
% TPR: True Positive Rate, Recall, Sensitivity
% PPV: Positive Predictive Value, Precision
% TNR: True Negative Rate, Specificity
% FPR: False Predictive Rate, Fall-out
% AVG: mean(ACC + TPR + TNR + FPR)
%

bss = [8, 16, 32, 64];
ks = [1,2,3,4, 5, 6, 7, 8, 9, 10,11,12];
tl = length(bss)*length(ks);
tn = 1;

test_out=zeros(tl, 12);

for bj=bss
	for kj=ks
		le = length(e0);

		ef = 0;
		df = [];

		for i=1:le

			[ef, v] =  entropy_filter(ef, e0(i), bj, kj);

			if (~v)
				df = [df i];
			end
		end

		[c, m] = filter_performance(df_gt, df, e0);

		test_out(tn, :) = [bj, kj, c, m, mean(m(1:4))];
		tn++;
	end
end

test_out