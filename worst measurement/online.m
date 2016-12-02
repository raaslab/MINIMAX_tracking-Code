function [Position,Cov] = online(Position_before,Cov_before)

 y=randn(2,5);


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

DF.Nodes.Position={Position_before };
DF.Nodes.Y={[mean(y(1,:));mean(y(2,:))] };

DF.Nodes.Cov={Cov_before};
DF.Nodes.trace = trace(diag([1 1]));
End_Generation=5;
Count=1;
Max_Children=5;
Min_Children=4;
done=0;
 bb=1;

while done==0

[Count,DF,AAA,done]=alphaBeta_generate_2(Count,DF,End_Generation,Max_Children, Min_Children,y);

end
   
   


F(bb) = getframe;
bb=bb+1;


% 
% 
Lastnode=size(DF.Nodes);
DF = rmnode(DF,Lastnode(1));
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
Cov=cell2mat(DF.Nodes.Cov(k));
Position=cell2mat(DF.Nodes.Position(j));
end
