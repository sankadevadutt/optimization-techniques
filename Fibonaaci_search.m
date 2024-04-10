clc
clear
a = input ('Enter lower boundary point: ');
b = input ('Enter upper boundary point: ');
n = input ('Enter the desired number of function evaluation (greater than 2): ');
str = input('Give an equation in x: ','s');
f = inline(str,'x') ;
k = 2;     
L = b - a; 
y1 = feval(f,a);
y2 = feval(f,b);
while k <= n
    f_numer = fibonacci(n-k+1+1);
    f_deno = fibonacci(n+1+1);
    Lk_star = (f_numer/f_deno)* L;
    x1 = a + Lk_star;
    x2 = b - Lk_star;
    y1 = feval(f,x1);
    y2 = feval(f,x2); 
    if y1 > y2
        a = x1;
    elseif y1 < y2
        b = x2;
    else
        a = x1;
        b = x2;
    end
    k = k + 1;
end
fprintf ('The minimum lies in the range (%f,%f)',a,b)