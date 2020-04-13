
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%MAT 331 Project 3 Problem 4 Part 2 Connie Reznik%%%%%%%%
%%%%%%%This code approximates the root of the function
%%%%%f(x) = x - exp(-x) using inverse divided differences and 8 nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function val = Prob4Part2(n)
format longe
%create linspace
x=linspace(0,1,100);
%function and fprime
func=x-exp(-x);
funcprime=1+exp(-x);
%plot functions to see if we can do div diff
figure(1)
hold on
plot(x,func,'k', x, funcprime,'m')
legend('F', 'FPrime')
xlabel('Xn')
ylabel('Function Value')
hold off


%Create table to store values in
F0=linspace(0,1,n+1);
F1=zeros(1,n+1);
F2=zeros(1,n+1);
F3=zeros(1,n+1);
F4=zeros(1,n+1);
F5=zeros(1,n+1);
F6=zeros(1,n+1);
F7=zeros(1,n+1);
F8=zeros(1,n+1);

for i=1:n+1
   
    x_n(i)=f(F0(i));
    
end

k=1;
%perform divided differences as like we have before
while k<=n
    
    if k==1
        for i=1:8
            F1(i) = (F0(i+1) - F0(i))/(x_n(i+1) - x_n(i));
        end
        k=2;
    end
    
    if k==2
        for i=1:7
            F2(i) = (F1(i+1) - F1(i))/(x_n(i+2) - x_n(i));
        end
        k=3;
    end
    
    if k==3
        for i=1:6
            F3(i) = (F2(i+1) - F2(i))/(x_n(i+3) - x_n(i));
        end
        k=4;
    end
    
   if k==4
        for i=1:5
            F4(i) = (F3(i+1) - F3(i))/(x_n(i+4) - x_n(i));
        end
        k=5;
   end
   if k==5
        for i=1:4
            F5(i) = (F4(i+1) - F4(i))/(x_n(i+5) - x_n(i));
        end
        k=6;
   end
   
   if k==6
        for i=1:3
            F6(i) = (F5(i+1) - F5(i))/(x_n(i+6) - x_n(i));
        end 
        k=7;
   end
   
   if k==7
        for i=1:2
            F7(i) = (F6(i+1) - F6(i))/(x_n(i+7) - x_n(i));
        end      
        k=8;
   end
   
   if k==8
        for i=1
            F8(i) = (F7(i+1) - F7(i))/(x_n(i+8) - x_n(i));
        end        
        k=9;
   end
end
    %transpose vector of div diffs
    val=[F0' F1' F2' F3' F4' F5' F6' F7' F8'];
    %put together polynomial at 0 
P_N = val(1,1) + val(1,2)*(0 - x_n(1) ) + val(1,3)*(0 - x_n(1) )*(0 - x_n(2) ) + val(1,4)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )  + val(1,5)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )*(0 - x_n(4) )+ val(1,6)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )*(0 - x_n(4) )*(0 - x_n(5) )+ val(1,7)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )*(0 - x_n(4) )*(0 - x_n(5) )*(0 - x_n(6) )+ val(1,8)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )*(0 - x_n(4) )*(0 - x_n(5) )*(0 - x_n(6) )*(0 - x_n(7) )+ val(1,9)*(0 - x_n(1) )*(0 - x_n(2) ) *(0 - x_n(3) )*(0 - x_n(4) )*(0 - x_n(5) )*(0 - x_n(6) )*(0 - x_n(7) )*(0 - x_n(8) )    
F_N = f(P_N)

end


function val = f(x)
val = x-exp(-x);
end