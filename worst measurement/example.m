clear
Position=[-7;-7];
Cov=eye(2);

for i=1:10
    if  i==1
        Position_update=Position;
        Cov_update=Cov;
    else
        [Position_update,Cov_update] = online(Position_update,Cov_update);
        Position(:,i)=Position_update;
    end
    p=Position(:,i)
    px(i)=p(1);
    py(i)=p(2);
    covarianceEllipse([0;0],Cov_update,'r', 5.296);
    hold on
end
plot(px,py)
 axis([-11 5 -11 5])