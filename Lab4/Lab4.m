 function Lab4()
% 1.1
f = 5; fs = 50;
t = 0: 1/fs : 1;
xn1 = sin(2 * pi * f * t);
N = length(xn1);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn1));
figure (1)
title('Sine Function')
subplot(221); plot(t, xn1); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
% 1.2
xn2 = cos(2 * pi * f * t);
N = length(xn2);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn2));
figure (2)
title('Cosine Function')
subplot(221); plot(t, xn2); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
% 1.3
xn3 = square(2 * pi * f * t);
N = length(xn3);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn3));
figure (3)
title('Square Function')
subplot(221); plot(t, xn3); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
% 1.4
t = 0.1: 0.1:100;
length (t)
xn4 = randn (1000);
length (xn4)
N = length(xn4);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn4));
figure (4)
title('Gaussian Noise')
subplot(221); plot(t, xn4); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
% Just as an extra thing, I am adding noise to all signals I have and plotting them again to show the effect of noise %
xn3 = imnoise(sin(2 * pi * f * t));
N = length(xn3);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn3));
figure (5)
title('Sine Function with gaussian noise')
subplot(221); plot(t, xn3); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

xn3 = imnoise(cos(2 * pi * f * t));
N = length(xn3);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn3));
figure (6)
title('Cosine Function with gaussian noise')
subplot(221); plot(t, xn3); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

xn3 = imnoise(square(2 * pi * f * t));
N = length(xn3);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn3));
figure (7)
title('Square Function with gaussian noise')
subplot(221); plot(t, xn3); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

% 2
f1= 5;
f2=20;
fs = 100;
t = 0: 1/fs : 1;
x1 = sin(2 *pi * f1 * t);
x2= cos(2 *pi * f2 * t);
xn= 4*x1 +3 *x2;
figure(8);
plot(t,xn);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure(9);
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
fs= 10;
figure(10);
plot(t,xn);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure(11);
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
fs= 20;
figure(12);
plot(t,xn);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure(13);
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
fs= 25;
figure(14);
plot(t,xn);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure(15);
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
fs= 40;
figure(16);
plot(t,xn);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure(17);
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
fs= 50;
figure(18);
plot(t,xn);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure(19);
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
fs= 150;
figure(20);
plot(t,xn);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure(21);
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

% 3.1
folder_Im='C:\Users\Saed Khawaldeh\Documents\GitHub\DSP-TP-1617\Lab4\images\1D-DFT'; 
cd (folder_Im)
files=dir;
Images_number=length(files)-2; 
 for i = 1:Images_number
     cell{i} = imread(files(i+2).name);
 end
%3.2
[y,x] = size(cell{1});  
 for idx = 2:Images_number
     [a,b]=size(cell{idx}) 
     if a*b<x*y
     y=a;
     x=b;
     end
 end
 p=1;q=1;
 for i=1:Images_number
    I = imread(files(i+2).name);
    I = double(I);
    [a,b,c]= size(I);
        if c==4 
            I=I(:,:,1);
        end
    I=I/(max(I(:)));  
    Resized_image = imresize(I, [y x]);   
% 3.3   This part of the code is prepared by Saed and Sam 
    z=round(y/2); 
    Profile_1 =Resized_image(z,:);
    N=x;
    fr = (-N/2 : N/2-1);
    x1 = ifftshift(fft(Profile_1)); 
    Profile_1D2 = Resized_image(z+1,:);
    Profile_1D3 = Resized_image(z-1,:); 
    Profile_1D4 = Resized_image(z+2,:); 
    Profile_1D5 = Resized_image(z-2,:); 
    x2 = ifftshift(fft(Profile_1D2));
    x3 = ifftshift(fft(Profile_1D3));
    x4 = ifftshift(fft(Profile_1D4));
    x5 = ifftshift(fft(Profile_1D5)); 
% 3.4
    v1=abs(x1);
    v2=abs(x2);
    v3=abs(x3);
    v4=abs(x4); 
    v5=abs(x5); 
    threshold1=max(v1);
     threshold2=abs(4*max(v1)-max(v2)-max(v3)-max(v4)-max(v5));
    threshold(i) = threshold1*threshold2;
    if (threshold(i)< 40)   
        Barcode_image(p)=i ;
        p=p+1; 
    else
        NonBarcode_image(q)=i; 
        q=q+1;
    end
 end
 figure (22);
 subplot(221);stem(threshold); title('Threshold');
 disp('Barcode');
 subplot(222); stem(Barcode_image); title('Non Barcode Image');
 disp('Non barcode');
 subplot(223);stem(NonBarcode_image); title('Barcode Image');
 Barcode=[1,2,6,44:54]; 
 NonBarcode = [3,4,5,7:43];
 x=length(Barcode);
 u=0;v=0;
 for i=1:length(Barcode)
   for j=1:length(Barcode_image)
     if Barcode_image(j)==Barcode(i)
         u=u+1;
     end
   end
 end
 
 for i=1:length(NonBarcode)
   for j=1:length(Barcode_image)
     if Barcode_image(j)==NonBarcode(i)
         v=v+1;
     end
   end
 end
 v=v+x-u;
 percentage_of_accuracy= ((Images_number-v)/Images_number)*100;
 sprintf('Percentage of correct distinction between the Barcode and NonBarcode images is: %d percent', round(percentage_of_accuracy)) % 85 % accurcy
 end