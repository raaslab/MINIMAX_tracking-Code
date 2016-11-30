function estimatedY=UpdateY(xposition,yposition,cov)

tureY=[0;0];
%H=[1 1];
H=eye(2);
cov=cov;


V=diag([norm(xposition-yposition)+1,norm(xposition-yposition)+1]);
R=H*cov*transpose(H)+V;
Kk=cov*transpose(H)*R^-1;
P=(eye(2)-Kk*H)*cov;

estimatedY=tureY+Kk*(yposition- H*tureY);

end
