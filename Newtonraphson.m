clc
clear
x0 = input('Choose an initial guess');
str = input('Give an equation in x: ','s');
f = inline(str,'x') ;
epsilon = input('Enter small number');

delta_x0 = delta(x0);
f_dash_x0 = (feval(f,(x0 + delta_x0)) - feval(f,(x0 - delta_x0)))/(2 * delta_x0);
f_doubledash_x0 = (feval(f,(x0 + delta_x0)) - 2 * feval(f,x0) + feval(f,(x0 - delta_x0)))/(delta_x0 ^ 2);

x1 = x0 - (f_dash_x0/f_doubledash_x0);
x0 = x1;
delta_x0 = delta(x0);
f_dash_x0 = (feval(f,(x0 + delta_x0)) - feval(f,(x0 - delta_x0)))/(2 * delta_x0);

while abs(f_dash_x0) >= epsilon
    f_doubledash_x0 = (feval(f,(x0 + delta_x0)) - 2 * feval(f,x0) + feval(f,(x0 - delta_x0)))/(delta_x0 ^ 2);
    x1 = x0 - (f_dash_x0/f_doubledash_x0);
    x0 = x1;
    delta_x0 = delta(x0);
    f_dash_x0 = (feval(f,(x0 + delta_x0)) - feval(f,(x0 - delta_x0)))/(2 * delta_x0); 
end
fprintf('The minimum of the function is at %.4f',x0);


function del_x = delta(x)
if x < -0.01 || x > 0.01
    del_x = 0.01 * abs(x);
else
    del_x = 0.0001;
end
end