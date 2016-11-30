function [X_after,Y_after,Cov_after] = online_adversary(X_before,Y_before,Cov_before)


c1=eye(2);
c2=0.8*eye(2);
 c3=[0.80 0.05;0.15 0.85];
%c3=[0.75 -0.25;-0.25 0.75];
% c4=[0.25 -0.75;0.75 0.25];
c4=[0.75 0.25;0.25 0.75];
% c5=[0.25 1;-1 0.25]; %coveraged
c5=[0.9 0.1;0.1 0.9];
u=[0.5;0.0];

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
DF.Nodes.BestValue=100;

DF.Nodes.Position={X_before };
DF.Nodes.Y={Y_before };

DF.Nodes.Cov={Cov_before};
DF.Nodes.trace = trace(Cov_before);
End_Generation=5;
Count=1;
Max_Children=5;
Min_Children=4;
done=0;
 bb=1;

while done==0

[Count,DF,AAA,done]=alphaBeta_generate_adversary(Count,DF,End_Generation,Max_Children, Min_Children,c1,c2,c3,c4,c5,u);
bb=bb+1;
end
   
   






DF = rmnode(DF,bb);


[bestValue, ridnode] = alphaBeta(1, -100, 100, DF, [],End_Generation) ;
for j=1:Count
    if DF.Nodes.trace(j) ==bestValue
        break;
    end
end

 %--------------------------------------------------------------------------------------------------------------------------------
 %use to plot
 while DF.Nodes.Parent(j)~=1
     k=j;
     j=DF.Nodes.Parent(j);
 end
% 
Cov_after=cell2mat(DF.Nodes.Cov(k));
X_after=cell2mat(DF.Nodes.Position(j));
Y_after=cell2mat(DF.Nodes.Y(k));
end
