clc
clear

x0 = input('Enter the initial guess: ');
delta_x = input ('Enter the increment: ');

k = 0; 
x1 = x0 - delta_x;
x2 = x0;    
x3 = x0 + delta_x;


str = input('Give an equation in x: ','s'); 
f = inline(str,'x');


y1 = feval(f,x1);
y2 = feval(f,x2);
y3 = feval(f,x3);

if y1 >= y2 && y2 >= y3
    increment_x = abs (delta_x);
elseif y1 <= y2 && y2 <= y3
    increment_x = -abs (delta_x);
elseif y1 >= y2 && y2 <= y3
    fprintf('The minimum lies in the region (%.f,%.f)',x1,x3)
else
    disp('Please change the initial point')
end
x3=x2 + (2^k)*increment_x;
y3=feval(f,x3);
while (y3<y2)
    k = k+1;
    x1 = x2;
    x2 = x3;
    x3 = x2 + (2^k)*increment_x;
    y2 = feval(f,x2);
    y3 = feval(f,x3);
end
fprintf('The minimum lies in the region (%.2f,%.2f)',min(x1,x3),max(x1,x3))
