%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%MAT 331 Project 2 Problem 4 Connie Reznik%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%This code performs Newton's method on the function%%%%%%%%%%%%%%
%%%%%%%%% f(x) = x^3 - 8 and takes initial x as input and runs while 
%%%%%%%%%error is greater than a certain threshold%%%%%%%%%%%%%%%%%%%%%%


function val = Problem4Newtons(xn)
    format longe
    %initialize error
    error = 1; 
    %initialize counter
    i = 1;
    %run while the error is greater than threshold
    while error > 10^(-10)
        k = 2
        %perform Newton's method to calculate next x
        xn1(i) = xn - (k*f(xn)/fprime(xn));
        
        xn = xn1(i);
        
        
        %calculate error and error squared
        error(i) = abs(2 - xn);
        
     
        if i >= 2
        error_squared(i) = error(i)/(error(i-1)^2);
        
        
        end
        
        %increment i
        i = i + 1;
        
       
    end
    
functionvals = [xn1' error' error_squared' ]

end

%function we're performing Newton's method on
function f = f(x)

f = (x^3 - 8)^2;

end
% derivative of function we're performing Newton's method on
function fprime = fprime(x)

fprime = (2*(x^3-8)*(3*x^2));

end




