function labels = dbscan(x,y,eps,minPts)

L = length(x);

%plot(x,y,'rx','linewidth',2);


d_x = x - x';
%d_x = bsxfun(@minus, x, x);
%d_y = bsxfun(@minus, y, y);
d_y = y - y';

% Matriz de distancias
d = sqrt(d_x.^2 + d_y.^2);

% Parametros DBSCAN

%eps = 1.7;
%minPts = 3;

d_th = (d <= eps).*not(eye(L));

np = sum(d_th);

labels = -1*ones(L,1);
visited = zeros(L,1);

c_id = 0;

for i=1:L
	if (visited(i) == 0)
		visited(i) = 1;
		
		eps_neigs = find(d_th(:,i));

		if(np(i) < minPts)
			labels(i) = 0;
		else
			c_id++;
			labels(i) = c_id;
			
			j = 1;
			while j<=length(eps_neigs)
				if (visited(eps_neigs(j)) == 0)
					visited(eps_neigs(j)) = 1;
%					printf("j: %d\n",eps_neigs(j) );
					eps_neigs_2 = find(d_th(:,eps_neigs(j)));
					
					if(np(eps_neigs(j)) >= minPts)
						%eps_neigs
						eps_neigs = unique([eps_neigs;eps_neigs_2]);
					end

				end
				if (labels(eps_neigs(j)) == -1 || labels(eps_neigs(j)) == 0)
					labels(eps_neigs(j)) = c_id;
					j = 1;	
				
				% Para identificar puntosmulti cluster			
				%elseif (labels(eps_neigs(j)) ~= c_id)
					% Puntos inter cluster
					%printf("Trying %d <- %d ",labels(eps_neigs(j)),c_id)
					%labels(eps_neigs(j)) = 99;
					%j = 1;
				end
				j++;
			end
%			eps_neigs'
%			visited'
%			labels'
			eps_neigs = [];
		end
	end
end

%figure, hold on;

%for i = 1:L
	%if (labels(i)==0)
%		plot(x(i),y(i),' rx', 'linewidth',3);
	%elseif (labels(i)==1)
%		plot(x(i),y(i),' bo', 'linewidth',3);
	%elseif (labels(i)==2)
%		plot(x(i),y(i),' ms', 'linewidth',3);
	%elseif (labels(i)==3)
%		plot(x(i),y(i),' cp', 'linewidth',3);
	%elseif (labels(i)==4)
%		plot(x(i),y(i),' rp', 'linewidth',3);
	%elseif (labels(i)==5)
%		plot(x(i),y(i),' bs', 'linewidth',3);
%	%elseif (labels(i)==6)
		%plot(x(i),y(i),' mo', 'linewidth',3);
%	elseif (labels(i)==7)
		%plot(x(i),y(i),' cx', 'linewidth',3);
%	elseif (labels(i)==99)
%		%plot(x(i),y(i),' k^', 'linewidth',3);
	%else
%		plot(x(i),y(i),' g+', 'linewidth',3);
	%end
%		%text(x(i),y(i),{num2str(i), [' neighs: ' num2str(np(i))] });%'VerticalAlignment','bottom', 'HorizontalAlignment','right'))
%end
%
%hold off;


