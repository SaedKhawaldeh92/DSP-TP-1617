% SAM & SAED
% LAB3
% SIGNAL PROCESSING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.2  Test your function, while using the following signal

x = [1, 2, 3, 4] ;

% The first filter is 
% a= ?[k ? 5],

% a=[0 0 0 0 1];
% or 
a = [1 0 0 0 0];

conv1=CONVss(x,a);
figure(1);
stem(conv1);
title('Convolution with &[k-5]');

% The Second filter is 
% a= H[k ? 5],

b=step(1,5);

conv2= CONVss(x,b);
figure(2);
stem(conv2);
title('Convolution with H[k -5]');

% The third filter is 
% e[k?5]

c= [ exp(0) exp(1) exp(2) exp(3) exp(4)];

conv3=CONVss(x,c);
figure(3);
stem(conv3);
title('Convolution with e[k -5]');

d= [-1 1];
conv4=CONVss(x,c);
figure(4);
stem(conv4);
title('Convolution with [-1 1]');

 % 1.3 Consider the previous input signal, wrire it’s extended version while considering symmetry, periodic,
% constant values padding and h = H[k ? 5].

%Symmetric Padding
% The Input is this
x=[1 2 3 4];
% The filter response is this 
h = step(1,5);
% Mirrir the Input Response
xflip=fliplr(x);
% Calculate the length of the Input and the filter
a=length(x);
b=length(h);
% Store the b-1 elements of the Input in the ss
ss=x(1:b-1);

xsymmetric=[fliplr(c),x,xflip(1:b-1)];
                                      
z=zeros(1,a+b-1); 
for l=1:a+b-1
    for m=1:b
        z(l)=z(l)+xsymmetric(b+l-m)*h(m); 
    end
end
figure(5);
stem(z); 
xlabel('n'); 
ylabel('Z(n)'); 
title('Unit Step * Symmetric X');

%Periodic Padding
a=length(x);
b=length(h);
c=fliplr(x(1:b-1));

Xperiodic=[fliplr(c),x,x(1:b-1)] %%padding periodically with 1 2 3 4 in both left and right side 

z=zeros(1,a+b-1);
for l=1:a+b-1
    for m=1:b
        z(l)=z(l)+Xperiodic(b+l-m)*h(m); %same convolution equation again
    end
end
figure(6);
stem(z);
xlabel('n'); 
ylabel('Z[n]'); 
title('Unit Step * Periodic X');


%constant padding
a=length(x);
b=length(h);
% Initiliasing the c
c=ones(1,b-1)

Xconstant=[5*c,x,5*c]; % padding with constant 5 on both left and right side of the X

z=zeros(1,a+b-1);
for l=1:a+b-1
    for m=1:b
        z(l)=z(l)+Xconstant(b+l-m)*h(m);
    end
end
figure(7);
stem(z); 
ylabel('Z[n]'); 
xlabel('n'); 
title('Unit Step * Constant Padded X');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Exercise 2 – 2D Convolution
% 2.2 
% Read and Display the lena Image
sslena=imread('C:\Users\Saed Khawaldeh\Downloads\dsp lab3');
sslena=mat2gray(sslena);
figure(8);
imshow(sslena,[]);
title('Lena Image without Filters');

% Define the gaussian kernel

gausskernel=(1/256).* [1 4 6 4 1;4 16 24 16 4;6 24 36 24 6;4 16 24 16 4;1 4 6 4 1] ;

smoothing =CONV2Dss(sslena,gausskernel);
figure(9);
imshow(smoothing,[]);
title('Lena Image after smoothing');

% 2.3
% Apply sobel filtering using convolution.
% The standard for applying the sobel filtering is that you apply first horizontally.
% Then you apply it verticlly and in the end you take the mean of the two outputs

SobelX = [-1 0 1; -2 0 2; -1 0 1];
SobelY= [1 2 1; 0 0 0; -1 -2 -1];

%Convolving Image with the two filters
lenax=CONV2Dss(sslena,SobelX);
lenay=CONV2Dss(sslena,SobelY);

lenaoutput = sqrt((lenax.*lenax) + (lenay.*lenay));

figure(10);
imshow(lenaoutput,[]);
title('Lena Image after Sobel Filter');

% So the sobel filter is used for the detection of the edges
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Exercise 3 
% Character recognition using cross-correlation

% 3.1 Load “a.png” and “text.png” images, binarized them using otsu thresholding, threshold-otsu in
% python and graythresh in matlab.


A=imread('C:\Users\Usama\Desktop\dsp lab3\a.png');
A=mat2gray(A);

T=imread('C:\Users\Usama\Desktop\dsp lab3\text.png');
T=mat2gray(T);

% binarized using otsu thresholding
threshholdA=graythresh(A);
greatotsuA=im2bw(A, threshholdA);
greatotsuA=+greatotsuA;
greatotsuA= ones(16,16)- greatotsuA;  %Invert the matrx

% binarized using otsu thresholding
threshholdT=graythresh(T);
greatotsuT=im2bw(T, threshholdT);
greatotsuT=+greatotsuT;

figure(11);
imshow(greatotsuA)
title('Image A after applying otsu Inverted threshold')
figure(12);
imshow(greatotsuT)
title('Image TEXT after applying otsu threshold')

% 3.2 3.3
% Use signal.correlate2d and xcorr in python and matlab, respectively to correlate your binarized
% images

 xcorrAandtext = xcorr2(greatotsuT,greatotsuA);
 %We use the xcorr2 function to coorelate the binary Images
 Intensity=mat2gray(xcorrAandtext);
 %I convert it to the intensity image
 [rmax, cmax]= find(Intensity ==max(max(Intensity)));
% find the maximum value in the Intensity Image
 figure(13);
 imshow(Intensity)
 title('Correlation of A and Text')
 
 %I will plot the image in a way you can see the finded a letter
 figure(14);
 imshow(greatotsuT)
 hold on;
 
 plot(cmax-6,rmax-6, 'g+','MarkerSize',6)  
 title('We find the following A letters')
%  You can see the green coloured plus signs which show
%  the pointed areas where the alphabet A is present

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%