% 1.1 Defining a signal x and an impulse response h as parameters, write a program convFn to compute
% the convolution product y = h ? x. Do not use the python or matlab function and just consider zero
% padding to solve the border problem.

% If you want user to enter manual input

% x = input('enter a sequence');
% h = input('enter another sequence');

function [conv]=CONVss(x,h)

a = length(x);
b = length(h);
n = a+b-1;                        %output comes out from 0 to a+b-2
y = zeros(1,n);                    
% Pad the output with zero's
l = 1:n;
for i = 0:n
             for j = 0:n
                         if ((i-j+1)>0 && (i-j+1)<=b && (j+1)<=a)
                                       y(i+1) = y(i+1)+ x(j+1).*h(i-j+1);   %Shift and multiply the signal
                         end
            end
end
% disp(y)   % If you want to display the signal 
% stem(l,y)

conv=y;
end