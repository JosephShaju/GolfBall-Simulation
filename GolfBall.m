function Golfball
[t,x]=ode45(@flightg,[0,5],[0,53,0,38,0,0])
plot3(x(:,1),x(:,3),x(:,5),"-ob");
title("Golf Ball Model")
xlabel("X (m)")
ylabel("Y (m)")
zlabel("Z (m)")
xlim([0 50]);
ylim([0 50]);
grid on
hold on
end
function xprime=flightg(t,x)
%Parameters
%Drag
C_d=0.21;%.15
rho=1.2;
A=59.3393/10000;
m=(45.93/1000);
%D =((1/2)*C_d*r*A*V^2
%Square of the velocity is in the equation, therefor
D =((1/2)*C_d*rho*A);
%Magnus
%s=.000005;
C_l = 0.14;
s = ((1/2)*C_l*rho*A)
M=(s/m);
W_I=-100;%-200
W_J=0;
W_K=110;

xprime=zeros(2,1);
%X
xprime(1)=x(2);
xprime(2)=-(D/m)*x(2)^2+(M*(W_J*x(6)-W_K*x(4)));
%Y
xprime(3)=x(4);
xprime(4)=-9.81-(D/m)*x(4)^2+(M*(W_K*x(2)-W_I*x(6)));
%Z
xprime(5)=x(6);
xprime(6)=-(D/m)*x(6)^2+(M*(W_I*x(4)-W_J*x(2)));
end