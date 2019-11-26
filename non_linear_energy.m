N=10;  % antenna number
d1= 5;   % the distance between the source and the relay
d2= 5 ;   % the distance between the relay and the destination
sigma_dBm=-10;%dBm
sigmaA_dBm=sigma_dBm/2;
sigmaA=10^(sigmaA_dBm/10)/(10^3);  %  the additive white Gaussian noise (AWGN) vector variance,W
h=sqrt(1/2)*(randn(N,1)+j*randn(N,1)); % The CSI of source-to-relay
f=sqrt(1/2)*(randn(N,1)+j*randn(N,1)); % The CSI of destination-to-relay
p_s=linspace(10,50,100); 
p_d=linspace(10,50,100);
Ps=10.^(p_s./10)./(10^3);%POWER 计算
Pd=10.^(p_d./10)/(10^3);%POWER 计算
[P_s,P_d] = meshgrid(Ps,Pd);
 for alpha=0.01:0.01:0.99
           for rho=0.01:0.01:0.99
               X=(P_s./d1^2.*norm(h)+P_d./d2^2.*norm(f));%采集到的能量sqrt(1/2)*
               E=(alpha+rho*(1-alpha)/2)*(P_s./d1^2.*norm(h)+P_d./d2.*norm(f)^2+N*sigmaA);%线性采集的能量
               E0=(alpha+rho*(1-alpha)/2)*(24./(1+exp(-0.1689*(P_s./d1^2.*norm(h)^2+P_d./d2^2.*norm(f)^2-16.2083))));
             % E1=(20./(1+exp(-1500*(P_s./d1^2.*norm(h)+P_d./d2^2.*norm(f)-0.0022))));
           end
 end
  E=real(E);
  E0=real(E0);
%   E1=real(E1);
 figure(1),plot(X,E0),view(2)
%  xlabel('Ps'),ylabel('Pd'),zlabel('E(Ps,Pd)')
 figure(2),mesh(P_s,P_d,E),view(3)
%  xlabel('Ps`'),ylabel('Pd`'),zlabel('E(Ps,Pd)')
figure(3),mesh(Ps,Pd,E0),view(3)
% xlabel('Per`'),ylabel('E0'),zlabel('E(Ps,Pd)')
%  figure(4),mesh(P_s,P_d,E1),view(3)
%  xlabel('Ps`'),ylabel('Pd`'),zlabel('E(Ps,Pd)')