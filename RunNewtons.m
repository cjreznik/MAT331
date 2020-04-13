function iterates =  RunNewtons()

Bvec = [1 5 10 25 50]; 

x = linspace(1, 20, 20);

%this B vec is for x0 = 0
B_0_1 = Prob2Newtons(-.4, Bvec(1));
B_0_5 = Prob2Newtons(-.4, Bvec(2));
B_0_10 = Prob2Newtons(-.33, Bvec(3));
B_0_25 = Prob2Newtons(-.24, Bvec(4));
B_0_50 = Prob2Newtons(-.25, Bvec(5));
T1 = [B_0_1 B_0_5 B_0_10 B_0_25 B_0_50]


%this Bvec is for x0 = -1/2
B_half_1 = Prob2Newtons(-0.5, Bvec(1));
B_half_5 = Prob2Newtons(-0.5, Bvec(2));
B_half_10 = Prob2Newtons(-0.5, Bvec(3));
B_half_25 = Prob2Newtons(-0.5, Bvec(4));
B_half_50 = Prob2Newtons(-0.5, Bvec(5));

T2 = [B_half_1 B_half_5 B_half_10 B_half_25 B_half_50]
%plot first figure with x0 = 0 and different B vec values
figure(1)

hold on
plot(x, B_0_1, 'r',x,B_0_5,'g',x,B_0_10,'c',x,B_0_25,'m',x,B_0_50,'k')

legend('B_0_1','B_0_5', 'B_0_10','B_0_25', 'B_0_50')

hold off

%plot second figure with x0 = -1/2 and different B vec values
% figure(2)
% 
% plot(x,B_half_1,'r',x,B_half_5,'g',x,B_half_10,'c',x,B_half_25,'m',x,B_half_50,'k')
% 
% legend('B_half_1','B_half_5', 'B_half_10','B_half_25', 'B_half_50')
% 
% hold off
