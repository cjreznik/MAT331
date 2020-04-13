%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%MAT 331 Project 2 Problem 2 Connie Reznik%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%This code performs Newton's method on the function%%%%%%%%%%%%%%
%%%%%%%%% f(x) = x + e^(-Bx^2)*cos(x) and takes B and x as inputs

function val = Prob2Newtons(xn,B)    

format long    %format decimal places
n = 1;    % initialize counter

%while loop runs while the number of iterations is less than 20
while n <= 20    
    f_x = f(xn);    
    
    f_prime = f_deriv(xn);    
    %calculate next iteration using Newton's method
    
    xn1 = xn - (f_x/f_prime);   
    %set new point equal to previous point
    xn = xn1;   
    newx(n) = xn;  
    n = n+1;    
end


%transpose output
val = newx';

% plot(xvec,real_func)   
% xlabel('x')    
% ylabel('f(x)')    

%function we're performing Newton's on
    function f = f(x)
        f = x + exp((-1*B)*(x.^2))*cos(x);
    end
%derivative of function we're performing Newton's on
    function fprime = f_deriv(x)
        fprime = 1 - sin(x)*exp((-1*B)*(x.^2)) - 2*B*x*cos(x)*exp((-1*B)*(x.^2));
    end

    end
    
