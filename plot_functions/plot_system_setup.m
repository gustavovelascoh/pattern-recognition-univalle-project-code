%plot system set-up
im = imread('image_inv.bmp');
scale=4.1345;
xos = [0 23.7 13.12 12.68 -8.62 -2.2]; yos = [-21.4 15.6 26.7 -21.74 17.1 22.56];
angs = [0.150098 -3.344051 -4.174827 -0.059341 3.679154 -1.933825];
imagesc(([0 300]/scale)-30.2, ([0 225]/scale) - 24,255-flipdim(im,1));hold on;set(gca,'ydir','normal');plot(xos,yos,' bo','markersize',7,'linewidth',3);
title ("Intersection configuration")
xlabel("x [m]");
ylabel("y [m]");

text (xos(1)+1, yos(1)-1, {" LMS1"});
text (xos(4)+1, yos(4)-1, {" LMS5"});

text (xos(2)+1, yos(2)+1, {" LMS2"});
text (xos(3)+1, yos(3)+1, {" LMS3"});

text (xos(6)-4, yos(6)+2, {" LMS8"});
text (xos(5)-4, yos(5)+2, {" LMS7"});

%text (xos(1)+1, yos(1)-1, " LMS2", " LMS3", " LMS5"," LMS7", " LMS8",});
hold on;

for i=1:6
h=drawArrow([xos(i) yos(i) xos(i)+5*cos(angs(i)+pi/2) yos(i)+5*sin(angs(i)+pi/2)],1, 1,0.5,1);
%set(h.body,'linewidth',2);
end