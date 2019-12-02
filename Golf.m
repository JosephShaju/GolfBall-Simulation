function Golf
[t,x]=ode45(@flightg,[0,8.3],[0,175,0,75,0,0])
plot3(x(:,1),x(:,3),x(:,5),"-ob");
title("Golf Ball Model")
xlabel("X (feet)")
ylabel("Y (feet)")
zlabel("Z (feet)")
ylim([0 150]);
xlim([0 667])
grid on
hold on
end
function xprime=flightg(t,x)
%Parameters
%Drag
C_d=0.21;
rho= 2.34*(10^-3)%.002378;
A=(.25*pi*(1.68/12)^2)*1.00324;
m=(1.5/(16*32.2));
%D =((1/2)*C_d*r*A*V^2
%Square of the velocity is in the equation, therefor
D =((1/2)*C_d*rho*A);
%Magnus
C_l = 0.14;
s=((1/2)*C_l*rho*A);
m=(1.5/(16*32.2));
M=(s/m);
% one way W_i is -50 and w_k is 0
% one way W_i is 0 and w_k is 0 
% one way W_i is -50 and w_k is 110
% see how it affects distance and compare that to the distance of other
% two.
W_I = -50;
W_J=0;
W_K=0;
xprime=zeros(2,1);
%X
xprime(1)=x(2);
xprime(2)=-(D/m)*x(2)^2+M*(W_J*x(6)-W_K*x(4));
%Y
xprime(3)=x(4);
xprime(4)=-32.2-(D/m)*x(4)^2+M*(W_K*x(2)-W_I*x(6));
%Z
xprime(5)=x(6);
xprime(6)=-(D/m)*x(6)^2+M*(W_I*x(4)-W_J*x(2));
end