clear all

geom1 = ... % geom1.node: N x 3 matrix
geom2 = ... % geom2.node: M x 3 matrix
data = ...  % L x 3 matrix. This is the data to be transferred from geom1 to geom2

A=zeros(size(geom2.node,1),size(geom1.node,1));


for i=1:size(geom2.node,1)
    dis=zeros(size(geom1.node,1),1);
    for j=1:size(geom1.node,1)
        dis(j,1)=norm(geom1.node(j,:)-geom2.node(i,:));   
    end
    
    for k=1:50
    [a(k),m(k)]=min(dis);
    dis(m(k),:)=NaN;
    end
    
    a_inv=1./a;
    s=sum(a_inv);
    
    for k=1:50
    A(i,m(k))=a_inv(k)/s;
    end 
end


transfered_val=A*val.data;
transfered_val(isnan(transfered_val))=0;



