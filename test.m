list_x = [1;2;3;1.5];
list_f = [30;20;10;15];
[list_f,i] = sort(list_f);
order_x = (list_x(i));
order_xc = [order_x(1);order_x(2);order_x(3)];
order_xc = sort(order_xc);
fprintf("%.2f\t%.2f\t%.2f",order_xc(1),order_xc(2),order_xc(3));