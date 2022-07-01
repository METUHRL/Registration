clear all
load('auck_transrot')
load('brat_transrot')

cg1=mean(geom1);
geom1=geom1-cg1;

cg2=mean(geom2);
geom2=geom2-cg2;

for i=1:size(geom1,1)
    dis1(i)=norm(geom1(i,:));
end

meandis1=mean(dis1)

for i=1:size(geom2,1)
    dis2(i)=norm(geom2(i,:));
end

meandis2=mean(dis2);

geom1=meandis2/meandis1*geom1;