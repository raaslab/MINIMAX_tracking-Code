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
DF.Nodes.BestValue=100;

DF.Nodes.Position={[-10;-10] };
DF.Nodes.Y={[0;0] };

DF.Nodes.Cov={diag([1 1]);};
DF.Nodes.trace = trace(diag([1 1]));
End_Generation=11;
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

bb=bb+1
end




% 
