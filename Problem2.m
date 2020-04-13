function val = Problem2(B,x)


    plot(x,f(x)); xlim([-1 0]); xlabel('x'); ylabel('f(x)');legend('B = %f', B)




function val = f(x)

    val = x + e^(-B*x^2)*cos(x);