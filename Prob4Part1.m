
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%MAT 331 Project 3 Problem 4 Part 1 Connie Reznik%%%%%%%%
%%%%%%%This code approximates the root of the function
%%%%%f(x) = x - exp(-x) using inverse divided differences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = Prob4Part1(n)
%create linspace
x=linspace(0,1,100);
%this is function and fprime
func=x-exp(-x);
funcprime=1+exp(-x);
%plot functions to see if we can perform inverse divided differences 

figure(1)
hold on
plot(x,func,'k', x, funcprime,'m')
legend('F', 'FPrime')
xlabel('')
ylabel('Function Value')
hold off


%Create table to store values in
T0=linspace(0,1,n+1);
T1=zeros(1,n+1);
T2=zeros(1,n+1);
T3=zeros(1,n+1);
T4=zeros(1,n+1);

for i=1:n+1
   
    x_n(i)=f(T0(i));
    
end

k=1;
%perform divided differences like we have before
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
    %transpose vector of div diffs
    val=[T0' T1' T2' T3' T4'];
    %put together the polynomial at 0 
    i=0;
    P_N = val(1,1) + val(1,2)*(0 - x_n(1) ) + val(1,3)*(0 - x_n(1) )*(0 - x_n(2) ) + val(1,4)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )  + val(1,5)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )*(0 - x_n(4) )    
    F_N = f(P_N)
end
end
%function we're doing inverse divided difference on
function val = f(x)
val = x-exp(-x);
end