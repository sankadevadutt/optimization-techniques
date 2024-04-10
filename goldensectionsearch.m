clc
clear
a = input ('Enter lower boundary point: ');
b = input ('Enter upper boundary point: ');
sn = input ('Enter a very small number: ');
str = input('Give an equation in x: ','s');
f = inline(str,'x');
aw = 0;
bw = 1;
Lw = 1;
k = 1;
while (b-a)*Lw >= sn
    w1 = (aw + .618 * Lw)*(b-a)+a;
    w2 = (bw - .618 * Lw)*(b-a)+a;
    y1 = feval(f,(w1));
    y2 = feval(f,(w2));
    if y1 < y2  
        aw = bw - .618 * Lw;
    else
        bw = aw + .618 * Lw;
    end
    Lw=bw-aw;
    k = k + 1;
end
fprintf('The minimum lies in the region (%.4f ,%.4f)',aw*(b-a)+a,bw*(b-a)+a);