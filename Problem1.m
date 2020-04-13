function val  = Problem1(a,b,i)

format longe
k = 0;

f(a)*f(b) = checkroots;
while k < n 
    
if checkroots > 0
    
    fprintf('f(a) and f(b) are the same sign, cannot use bisection method')
    
    k = n;
elseif checkroots == 0 
    if f(a) = 0
        val = a;
        k = n;
    else
        val = b;
        k = n;
    end
    
elseif
    
c = (a+b)/2 
f_c = f(c); 

    if f(a)*f(c) < 0 
    
    b = c;
    
    elseif f(a)*f(c) > 0 
    
    a = c;
    
    else 
    val = c; 
    
    fprintf('There is a root at f(x) = %f\n', val );
  
    k = n;
   
    end
    k = k + 1;
end 


function f(x) = val

val = x^8 - 36*x^7 + 546*x^6 - 4536*x^5 + 22449*x^4 - 67284*x^3 + 118124*x^2 - 109584*x + 40320;

end
