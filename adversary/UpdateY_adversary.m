function estimatedY=UpdateY_adversary(yposition,law,u,c1,c2,c3,c4,c5)
   if law==1
       c=c1;
   elseif law==2
       c=c2    ;
   elseif law==3
       c=c3;
   elseif law==4
       c=c4   ;
   else 
      c=c5;
   end

Y=c*yposition+u;
%H=[1 1];
estimatedY=Y;
end
