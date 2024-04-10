clc
clear
x1 = input('Enter initial point');
delta = input('Enter the step size');
str = input('Give an equation in x: ','s');
f = inline(str,'x') ;
epsilon = input('Enter termination parameter');
x2 = x1 + delta;
f1 = feval(f,x1);
f2 = feval(f,x2);
if f1 > f2
    x3 = x1 + 2 * delta;
else
    x3 = x1 - delta;
end
f3 = feval(f,x3);
a1 = (f2 - f1)/(x2 - x1);
a2 = (((f3 - f1)/(x3 - x1)) - ((f2 - f1)/(x2 - x1)))/(x3 - x2);
x_bar = ((x1 + x2)/2) - (a1/(2 * a2));
f_xbar = feval(f,x_bar);
list_x = [x1;x2;x3];
list_f = [f1;f2;f3];
[list_f,i] = sort(list_f);
order_x = (list_x(i));
xmin = order_x(1);
fmin = list_f(1);
while (abs(fmin - f_xbar) >= epsilon) && (abs(xmin - x_bar) >= epsilon)
    list_x = [x1;x2;x3;x_bar];
    list_f = [f1;f2;f3;f_xbar];
    [list_f,i] = sort(list_f);
    order_x = (list_x(i));
    order_xc = [order_x(1);order_x(2);order_x(3)];
    order_xc = sort(order_xc);
    x1 = order_xc(1);
    x2 = order_xc(2);
    x3 = order_xc(3);
    f1 = feval(f,x1);
    f2 = feval(f,x2);
    f3 = feval(f,x3);
    a1 = (f2 - f1)/(x2 - x1);
    a2 = (((f3 - f1)/(x3 - x1)) - ((f2 - f1)/(x2 - x1)))/(x3 - x2);
    x_bar = (x1 + x2)/2 - a1/(2 * a2);
    f_xbar = feval(f,x_bar);
end
fprintf('The minimum is at %f',x1);