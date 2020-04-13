function val = Problem4(n)

x_n = linspace(0,1,100);

f = x-exp(-x);
fprime = 1 + exp(-x);

figure(1)
hold on
plot(x,f, 'k', x, fprime 'm')

y_n = linspace(0,1,n+1); 

for i = 1: n+1
    
    T0(i) = f(x_n(i));
    
    
end

k = 1; 

while k <= n
    
    if k == 1
        for i = 1:4
        T1(i) = (T0(i+1) - T0(i))/(x_n(i+1) - x_n(i));
        
    end
    
    k = 2; 
    
    if k == 2
        
        for i = 1:3
            
           T2(i) = (T1(i+1) - T1(i))/(x_n(i+2) - x_n(i));
        end
        
        k = 3;
    end
    
    if k == 3 
        for i = 1:2
            T3(i) = (T2(i+1) - T2(i))/(x_n(i+3)- x_n(i));
        end
        
        k = 5;
        
        k = n + 1;
        
    end
    
    val = [T0' T1' T2' T3' T4'];
    
end

xvec = linspace(-1,1,100); 

for i = 1:n+1
    
 P_N(i) = T0(i) + T1(i)*(xvec(i) - x_n(1)) + T2(i)*(xvec(i)-x_n(1))*(xvec(i)-x_n(2)) + T3(i)*(xvec(i) - x_n(1))*(xvec(i) - x_n(2))*(xvec(i) - x_n(3))

end
end

end

function val = f(x)

val = 1/(1+(5^2)*(x^2))

end