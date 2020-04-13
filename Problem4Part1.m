function val = Problem4Part1(n)

x = linspace(0,1,100);


f= x-exp(-x);
fprime=1+exp(-x);

figure(1)
hold on
plot(x,f,'k', x, fprime,'m')
legend('F', 'F-Prime')
xlabel('Xn')
ylabel('Function Value')
hold off

T0=linspace(-1,1,n+1);
T1=zeros(1,n+1);
T2=zeros(1,n+1);
T3=zeros(1,n+1);
T4=zeros(1,n+1);


for i = 1:n+1
    
    x_n(i) = f(T0(i));
end

k=1;

while k<=n
    
    if k==1
        for i=1:4
            T1(i) = (T0(i+1) - T0(i))/(x_n(i+1) - x_n(i));
        end
        k=2;
    end
    
    if k==2
        for i=1:3
            T2(i) = (T1(i+1) - T1(i))/(x_n(i+2) - x_n(i));
        end
        k=3;
    end
    
    if k==3
        for i=1:2
            T3(i) = (T2(i+1) - T2(i))/(x_n(i+3) - x_n(i));
        end
        k=4;
    end
    
   if k==4
        for i=1
            T4(i) = (T3(i+1) - T3(i))/(x_n(i+4) - x_n(i));
        end
        k=5;
    k=n+1;
end
    
    val=[T0' T1' T2' T3' T4'];
    
    i=0;
    P_N = val(1,1) + val(1,2)*(0 - x_n(1) ) + val(1,3)*(0 - x_n(1) )*(0 - x_n(2) ) + val(1,4)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )  + val(1,5)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )*(0 - x_n(4) )    
    F_N = f(P_N)
end
end

function val = f(x)
    val = x - exp(-x);
end

