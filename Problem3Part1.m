%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%MAT 331 Project 3 Problem 3 Connie Reznik%%%%%%%%
%%%%%%%This code repeats problem 1 with Chebyshev nodes%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = Problem3Part1(n)

%this while loop creates the equally spaced Chebyshev nodes
j = 0;
while j <= n+1 
    %finds Chebsyshev node for each x
    x_n(j+1) = cos((((2*j)+1)*pi)/(2*n+1)); 
   
    j = j + 1;
    
end


%creating our table to store the values
T1 = zeros(1,5);
T2 = zeros(1,5);
T3 = zeros(1,5);
T4 = zeros(1,5);
T5 = zeros(1,5);

%for loop running for divided differences- this is a manual approach

%find first function value
for i = 1: n+1
    
    T0(i) = f(x_n(i));
   
end

k = 1; 

%perform divided difference method for the degree we have
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
        k = 4;
        
        if k == 4
        for i = 1
            T4(i) = (T3(i+1) - T3(i))/(x_n(i+4) - x_n(i));
        end
       
        k = 5;
        
        k = n + 1;
        
    end
    
    %place values into column vector
    val = [T0' T1' T2' T3' T4'];
    
    end

%redefine xvec
xvec = linspace(-1,1,100); 

%create for loop that creates our interpolated polynomial against the
%function
for i = 1:100
 
   
 P_N(i) = val(1,1) + val(1,2)*(xvec(i) - x_n(1) ) + val(1,3)*(xvec(i) - x_n(1) )*(xvec(i) - x_n(2) ) + val(1,4)*(xvec(i) - x_n(1) )*(xvec(i) - x_n(2) ) *(xvec(i) - x_n(3) )  + val(1,5)*(xvec(i) - x_n(1) )*(xvec(i) - x_n(2) ) *(xvec(i) - x_n(3) )*(xvec(i) - x_n(4) );
 F_N(i) = f(xvec(i));
 
end
%plot polynomial and function 
figure(1)
hold on
plot(xvec,P_N,'b',xvec,F_N,'r')
legend('Interoplated Polynomial','Function')
xlabel('X')
ylabel('Function Value')
hold off

%Part 3 
for i = 1:11
    %absolute error using values of t and k = 1,2,...11. Sum these abs error to get overall measure of error 
    tvec(i) = -1 + (1/6)*i;
    F_N2(i)=f(tvec(i));
    P_N2(i) = val(1,1) + val(1,2)*(tvec(i) - x_n(1) ) + val(1,3)*(tvec(i) - x_n(1))*(tvec(i) - x_n(2) ) + val(1,4)*(tvec(i) - x_n(1) )*(tvec(i) - x_n(2) ) *(tvec(i) - x_n(3)) + val(1,5)*(tvec(i) - x_n(1) )*(tvec(i) - x_n(2) ) *(tvec(i) - x_n(3) )*(tvec(i) - x_n(4));
    abs_err(i) = abs(F_N2(i)-P_N2(i));
end
%print error sum
err_sum = sum(abs_err)

end

end
end
%function we're performing divided differences on
function val = f(x)

val = 1/(1+(5^2)*(x^2))

end
