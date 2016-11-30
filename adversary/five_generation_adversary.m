clear
c1=eye(2);
c2=-eye(2);
c3=[0.75 0.25;0.5 0.25];
% c3=[1.05 -0.25;-0.5 1.05];
c4=[0.25 -0.75;0.75 0.25];
% c4=[-1.25 -0.05;0.05 -1.25];
c5=[0.25 1;-1 0.25]; %coveraged
% c5=[1 0;0 -1];
u=[0.1;0.0];

%初始化节点1
DF=digraph([1],[]);
DF.Nodes.Generation=1;
DF.Nodes.Finish=0;
DF.Nodes.Children=0;
DF.Nodes.Parent=1;
DF.Nodes.Law=0;
DF.Nodes.rid=0;

DF.Nodes.alpha=-100;
DF.Nodes.beta = 100;
DF.Nodes.BestValue=90;

DF.Nodes.Position={[-5;-5] };
DF.Nodes.Y={[1;1] };

DF.Nodes.Cov={diag([1 1]);};
DF.Nodes.trace = trace(diag([1 1]));
End_Generation=7;
Count=1;
Max_Children=5;
Min_Children=4;
done=0;
 bb=1;
l1=1; l2 =25; l3 = 7; l4=1; l5=1; l6=1;
             X(1) = 50;
             Y(1) = 6;
while done==0

[Count,DF,AAA,done]=alphaBeta_generate_adversary(Count,DF,End_Generation,Max_Children, Min_Children,c1,c2,c3,c4,c5,u);





    if DF.Nodes.Generation(Count) == 5
                  X(Count) = l5;
                  Y(Count) = 2.5;
                  l5=l5+1.5;
    elseif DF.Nodes.Generation(Count) == 4
                  X(Count) = l4;
                  Y(Count) = 3;
                  l4=l4+3.5;
            
    elseif DF.Nodes.Generation(Count) == 3
                  X(Count) = l3;
                  Y(Count) = 4;
                  l3=l3+14;
                  
    elseif DF.Nodes.Generation(Count) == 2
                  X(Count) = l2;
                  Y(Count) = 5;
                  l2=l2+23;
                  
%     elseif  DF.Nodes.Generation(Count) == 1
%              X(Count) = 50;
%              Y(Count) = 5;
    
    end
% 
% H=plot(DF,'XData',X,'YData',Y);
% 
% 
% for i=1:Count
%     if DF.Nodes.rid(i)==1
%         highlight(H,i,'NodeColor','r');
%     end
% 
% end


bb=bb+1
end


DF = rmnode(DF,nnz(X));
X(nnz(X))=[];
Y(nnz(Y))=[];




trace=DF.Nodes.trace';

for K=1:Count-1
    if DF.Nodes.Generation(K) == 4
        trace(K)=0;
        for i=1:nnz(successors(DF,K))
            kk=successors(DF,K);
            trace(K)= max(trace(K),trace(kk(i)));
        
        end
%     else trace(K)=100;
    end
end


for K=1:Count-1
    if DF.Nodes.Generation(K) == 3 
        trace(K)=110;
        for i=1:nnz(successors(DF,K))
            kk=successors(DF,K);
            trace(K)= min(trace(K),trace(kk(i)));
        
        end
%     else trace(K)=100;
    end
end

for K=1:Count-1
    if DF.Nodes.Generation(K) == 2
        trace(K)=0;
        for i=1:nnz(successors(DF,K))
            kk=successors(DF,K);
            trace(K)= max(trace(K),trace(kk(i)));
        
         end
    end
end  

for K=1:Count-1
    if DF.Nodes.Generation(K) == 1
        trace(K)=110;
        for i=1:nnz(successors(DF,K))
            kk=successors(DF,K);
            trace(K)= min(trace(K),trace(kk(i)));
        
         end
    end
end  

H=plot(DF,'XData',X,'YData',Y);
H.NodeLabel=trace;



for i=1:Count-1
    if DF.Nodes.rid(i)==1
        highlight(H,i,'NodeColor','r');
        highlight(H,i,'MarkerSize',4.2)
    end

end

[bestValue, ridnode] = alphaBeta_adversary(1, -100, 100, DF, [],End_Generation) ;
for j=1:Count
    if DF.Nodes.trace(j) ==bestValue
        break;
    end
end

 %--------------------------------------------------------------------------------------------------------------------------------
 %use to plot
 while DF.Nodes.Parent(j)~=1
      
     highlight(H,DF.Nodes.Parent(j),j,'EdgeColor','g')
     highlight(H,DF.Nodes.Parent(j),j,'LineWidth',2)
     j=DF.Nodes.Parent(j);
 end

% 
