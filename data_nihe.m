x=[4.36,10,16.664,20,26.664,30,35,40,45,50,55,60,65,70];
y=[3.78,6.99,11.32,15.32,19.67,24,24.33,24,25,23,23.47,24,22.9,23.9];
 %myfunc = inline('beta(1)./(1+exp(-beta(2).*(x-beta(3))))','beta','x');%模型，三参数
myfunc = inline('24./(1+exp(-beta(1).*(x-beta(2))))','beta','x');%假定M是20
beta0 = [0.2,0.2];
[beta,r] = nlinfit(x,y,myfunc,beta0);%计算beta（1）和beta（2）

