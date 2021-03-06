clear
X_Position=[-2;-2];
Y_Position=[1;1];
Cov=eye(2);

PositionX=X_Position;
PositionY=Y_Position;
px=PositionX(1);
py=PositionX(2);
qx=PositionY(1);
qy=PositionY(2);
for i=2:10
   
        [X_Position,Y_Position,Cov] = online_adversary_random(X_Position,Y_Position,Cov)

        PositionX(:,i)=X_Position;
        PositionY(:,i)=Y_Position;
        p=PositionX(:,i);
        q=PositionY(:,i);
        
        px(i)=p(1);
        py(i)=p(2);
        
        qx(i)=q(1);
        qy(i)=q(2);
        
       covarianceEllipse(Y_Position,Cov,'r', 2.296);
       hold on
end
plot(px,py,'--gs',...
    'LineWidth',1,...
    'MarkerSize',3,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5]);
hold on
plot(qx,qy,'--gs',...
    'LineWidth',1,...
    'MarkerSize',3,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5]);

