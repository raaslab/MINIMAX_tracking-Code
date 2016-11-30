function y=kalmanRiccatiCov(xposition,yposition,cov)


w=norm(xposition-yposition);
% R=cov*transpose(H)+V;
% Kk=cov*transpose(H)*R^-1;
% P=(eye(2)-Kk*H)*cov;
cov = cov-cov*(cov+diag([w,w]))^-1*cov;
y=cov;
end
