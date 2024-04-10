clc
clear
a = input('What is the lower limit? ');
b = input('What is the upper limit? ');
epsilon = input('Please enter a small number as termination parameter: ');
xm = (a+b)/2;
L = b-a;
str = input('Give an equation in x: ','s');
f = inline(str,'x');
while (L > epsilon)
    ym = feval(f,xm);
    x1 = a+(L/4);
    x2 = b-(L/4);
    y1 = feval(f,x1);
    y2 = feval(f,x2);
    if y1<ym
        b = xm;
        xm = x1;
    elseif y2<ym
        a = xm;
        xm = x2;
    else
        a = x1;
        b = x2;
    end
    L = b-a;
end
fprintf('The minimum lies in region (%f,%f)',a,b);