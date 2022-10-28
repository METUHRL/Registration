function [geom1,geom2]=shift_scale(geom1,geom2)


cg1=mean(geom1.pts);
geom1.pts=geom1.pts-cg1;

cg2=mean(geom2.pts);
geom2.pts=geom2.pts-cg2;

for i=1:size(geom1.pts,1)
    dis1(i)=norm(geom1.pts(i,:));
end

meandis1=mean(dis1);

for i=1:size(geom2.pts,1)
    dis2(i)=norm(geom2.pts(i,:));
end

meandis2=mean(dis2);

geom1.pts=meandis2/meandis1*geom1.pts;
