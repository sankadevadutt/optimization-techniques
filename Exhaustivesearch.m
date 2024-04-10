clc
clear
a = input('What is the lower limit? ');
b = input('What is the upper limit? ');
n = input('What is the number of intermediate points? ');
x1 = a;
delta_x = (b-a)/n;
x2 = x1 + delta_x;
x3 = x2 + delta_x;
str = input('Give an equation in x: ','s');
f = inline(str,'x') ;
while (x3 <= b)
    y1 = feval(f,x1);
    y2 = feval(f,x2);
    y3 = feval(f,x3);
    if y1 >= y2 && y2 <= y3
        fprintf('The minimum lies in the region (%f,%f)',x1,x3)
        break
    else
        x1 = x2;    
        x2 = x3;
        x3 = x2 + delta_x;
    end
end