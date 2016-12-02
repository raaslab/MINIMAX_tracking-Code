function cov_update=kalmanRiccatiCov_adversary(xposition,yposition,cov,law,c1,c2,c3,c4,c5)

   if law+1==1
       c=c1;
   elseif law+1==2
       c=c2;     
   elseif law+1==3
       c=c3;
   elseif law+1==4
       c=c4;    
   else 
       c=c5;
   end

w=norm(xposition-yposition);
cov = c*cov*c'-c*cov*(cov+diag([w,w]))^-1*cov*c';
cov_update=cov;

end
