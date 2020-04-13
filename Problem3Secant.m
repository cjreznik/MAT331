%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%MAT 331 Project 2 Problem 3 Connie Reznik%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%This code performs Secant method on the function%%%%%%%%%%%%%%
%%%%%%%%% f(x) = x^3 + x^2 - 8x - 6 and takes a and b as interval inputs
%%%%%%%%% and i at input for number of iterations%%%%%%%%%%%%%%%%%%%%

function Problem3Secant(x_0,x_1,i)

%create vector to plot graph on the right interval 
x = x_0:0.001:x_1;

%function in nested interval form
f_x = -6 + x.*(-8 + x.*(1+x.*(1)));

%plot x and f(x)
figure;
plot(x, f_x)

k = 0;

%while loop runs while k is less than the number of iterations
while k < i
    
    %save iteration to first column of table
    T(k+1,1) = k
    %perform bisection to find the next x value
    x_2 = x_1 - (f(x_1)*(x_1 - x_0))/(f(x_1)-f(x_0))
    %save the next x value to second column of table
    T(k+1,2) = x_2;
    %calculate abs error
    abs_error = abs(x_2 - f(x_2))
    %save abs error to third column of table
    T(k+1, 3) = abs_error;
    
    %if we're on 3rd iteration or higher, calculate error and error squared
    %and save to fourth and fifth columns of table
    if k > 2
        
        error = abs(x_2 - f(x_2))/ abs(x_1 - f(x_1))
        T(k+1,4) = error;
        
        error_squared = abs(x_2 - f(x_2))/ (abs(x_1 - f(x_1))^2)
        T(k+1,5) = error_squared;
        
    end 
        
    %assign new x values, increment counter    
    x_0 = x_1;
    x_1 = x_2;
    k = k + 1;
    
    

end

%print table
T

%function we're performing secant method on
function val = f(x)

val = x.^3 + x.^2 - 8*x - 6;
