clear all

geom.vertices=...; % N x 3 matrix
geom.faces=...; % M x 3 matrix
geom.contains_base=0;
beats.voltages=rand(1,size(geom.vertices,1));
fieldnames_input{1,1}= 'voltages';
fieldnames_disp{1,1}= 'Voltage (uV)';
reference=0;

[geom,Vq,hearts_exp]=UNISYS_Main(geom,beats,fieldnames_input,fieldnames_disp,reference);

% geom_transrot is the translated and rotated geometry

geom_transrot.vertices=hearts_exp{1, 1}.geom.vertices_transrot;
geom_transrot.faces=hearts_exp{1, 1}.geom.vertices_transrot
 