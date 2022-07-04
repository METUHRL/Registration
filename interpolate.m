function transfered_data=interpolate(geom1,geom2,data,n)

% transfer data from geom1 to geom2
% n is the number of nodes used in interpolation



A=zeros(size(geom2.pts,1),size(geom1.pts,1));


for i=1:size(geom2.pts,1)
    dis=zeros(size(geom1.pts,1),1);
    for j=1:size(geom1.pts,1)
        dis(j,1)=norm(geom1.pts(j,:)-geom2.pts(i,:));   
    end
    
    for k=1:n
    [a(k),m(k)]=min(dis);
    dis(m(k),:)=NaN;
    end
    
    a_inv=1./a;
    s=sum(a_inv);
    
    for k=1:n
    A(i,m(k))=a_inv(k)/s;
    end 
end

transfered_data=A*data;
transfered_data(isnan(transfered_data))=0;


