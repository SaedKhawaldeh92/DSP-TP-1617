% Define a 2D convolution function (Only consider zero-padding the image).

% A is the input signal
% k is filter
function smoothing = CONV2Dss(A, k)
% Specify the length of the Inputs and Ouputs
[r c] = size(A);   
[m n] = size(k);

h = rot90(k, 2);
center = floor((size(h)+1)/2);
left = center(2) - 1;
right = n - center(2);
top = center(1) - 1;
bottom = m - center(1);
%Calculate the dimensions of top, left , right and bottom
Rep = zeros(r + top + bottom, c + left + right);
for x = 1 + top : r + top
    for y = 1 + left : c + left
        Rep(x,y) = A(x - top, y - left);
    end
end
B = zeros(r , c);
%Iitialise the variables
for x = 1 : r
    for y = 1 : c
        for i = 1 : m
            for j = 1 : n
                q = x - 1;
                w = y -1;
                B(x, y) = B(x, y) + (Rep(i + q, j + w) * h(i, j));
                %Shifting and Multiplying , And then adding up the stuff
            end
        end
    end
end
smoothing=B;
end