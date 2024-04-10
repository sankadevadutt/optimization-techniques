clc
clear

a = input('Enter lower boundary');
b = input('Enter upper boundary');
str = input('Give an equation in x: ','s');
f = inline(str,'x') ;
epsilon = input('Enter small number');
k =0;
delta_a = delta(a);
f_dash_a = (feval(f,(a + delta_a)) - feval(f,(a - delta_a)))/(2 * delta_a);

delta_b = delta(b);
f_dash_b = (feval(f,(b + delta_b)) - feval(f,(b - delta_b)))/(2 * delta_b);

if f_dash_a < 0 && f_dash_b > 0
    x1 = a;
    x2 = b;
    z = (x1 + x2)/2;    
    delta_z = delta(z);
    f_dash_z = (feval(f,(z + delta_z)) - feval(f,(z - delta_z)))/(2 * delta_z);    
    while abs(f_dash_z) >= epsilon
        if f_dash_z < 0
            x1 = z;
        elseif f_dash_z > 0
            x2 = z;
        end
        z = (x1 + x2)/2;       
        delta_z = delta(z);
        f_dash_z = (feval(f,(z + delta_z)) - feval(f,(z - delta_z)))/(2 * delta_z);
        k = k + 1;
    end
fprintf ('The midpoint is at %f',z);
else
    disp('Change the boundary points');
end


function del_x = delta(x)
if x < -0.01 || x > 0.01
    del_x = 0.01 * abs(x);
else
    del_x = 0.0001;
end
end