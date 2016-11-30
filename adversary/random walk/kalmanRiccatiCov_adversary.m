function cov_update=kalmanRiccatiCov_adversary(xposition,yposition,cov,law,c1,c2,c3,c4,c5)


w=norm(xposition-yposition);
cov = cov-cov*(cov+diag([w,w]))^-1*cov;
cov_update=cov;

end
