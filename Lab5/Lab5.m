function Lab5()

% 1.1
img = zeros(301,301);
img(100:200, 140:160) = 255;
figure(1); imshow(img);
% 1.2
imgFreq = fftshift(fft2(img));
figure(2);
subplot(121);
imagesc(abs(imgFreq));
colormap('gray'); title('Magnitude') 
subplot(122);
imagesc(angle(imgFreq)/pi*180);
colormap('gray'); title('Phase')
% 1.3
img = zeros(301,301);
img(100:200, 140:160) = 255;
imgTrans = zeros(301,301);
imgTrans(150:250, 160:180) = 255;
figure(3); imshow(imgTrans);
imgFreq = fftshift(fft2(imgTrans));
figure(4);
subplot(121);
imagesc(abs(imgFreq));
colormap('gray'); title('Magnitude') 
subplot(122);
imagesc(angle(imgFreq)/pi*180);
colormap('gray'); title('Phase')
imgRot = imrotate(img, 45)
figure(5); imshow(imgRot);
imgFreq = fftshift(fft2(imgRot));
figure(6);
subplot(121);
imagesc(abs(imgFreq));
colormap('gray'); title('Magnitude') 
subplot(122);
imagesc(angle(imgFreq)/pi*180);
colormap('gray'); title('Phase')
img2 = zeros(301,301);
img2(20:120, 140:160) = 255;
img2(180:280, 140:160) = 255;
figure(7); imshow(img2);
imgFreq = fftshift(fft2(img2));
figure(8);
subplot(121);
imagesc(abs(imgFreq));
colormap('gray'); title('Magnitude') 
subplot(122);
imagesc(angle(imgFreq)/pi*180);
colormap('gray'); title('Phase')
img3 = zeros(301,301)
img3(100:200, 145:155) = 255
figure(9); imshow(img3);
imgFreq = fftshift(fft2(img3));
figure(10);
subplot(121);
imagesc(abs(imgFreq));
colormap('gray'); title('Magnitude') 
subplot(122);
imagesc(angle(imgFreq)/pi*180);
colormap('gray'); title('Phase')
% Observations : The translated images has change only in phase spectrum while the rotated image has change in both magnitude and phase spectrum.
% 1.4
Im=0;
N=64;
T=1;
Ts=T/N;
Fs=1/Ts;
df=Fs/N;
Im(N/8:N/4,N/4+1:N/2)=1;
Im(1:N/4,N/2+1:N)=Im;
Im(N/4+1:N/2,:) = Im;
Im(N/2+1:3*N/4,:) = Im(1:N/4,:);
Im(3*N/4+1:N,:) = Im(1:N/4,:);
figure(10); imshow(Im);
imgFreq = fftshift(fft2(Im));
figure(11);
subplot(121);
imagesc(abs(imgFreq));
F= abs(imgFreq);
colormap('gray'); title('Magnitude') 
subplot(122);
imagesc(angle(imgFreq)/pi*180);
colormap('gray'); title('Phase')
size (Im)
centered = mean (Im (:)) % centered =  0.2813
CenteredFreq = imgFreq (N/2+1, N/2+1)/ 64^2 % CenteredFreq = 0.2813
% 1.5 
Im=0;
N=64;
T=1;
Ts=T/N;
Fs=1/Ts;
df=Fs/N;
Im(N/8:N/4,N/4+1:N/2)=1;
Im(1:N/4,N/2+1:N)=Im;
Im(N/4+1:N/2,:) = Im;
Im(N/2+1:3*N/4,:) = Im(1:N/4,:);
Im(3*N/4+1:N,:) = Im(1:N/4,:);
imgFreq = fftshift(fft2(Im));
centered = mean (Im (:)) % centered =  0.2813
CenteredFreq = imgFreq (N/2+1, N/2+1)/ 64^2 % centeredFreq =  0.2813
figure(12);
subplot(131); imshow(Im); title('Input Signal')
subplot(132); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(133); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')
col = imgFreq(:,N/2+1); 
row = imgFreq(N/2+1,:); 
fr = (-N/2 : N/2-1);
figure(13); 
subplot(121); plot(fr,abs(row));title('Plot - If(u,0)')
subplot(122); plot(fr,abs(col));title('Plot - If(0,v)');
% 1.6
lena = imread('C:\Users\Saed Khawaldeh\Documents\GitHub\DSP-TP-1617\Lab5\images\lena-grey.bmp'); 
figure (14)
imshow (lena);
imgFreq = fftshift(fft2(lena));
figure(15);
subplot(121);
imagesc(abs(imgFreq));
colormap('gray'); title('Magnitude') 
subplot(122);
imagesc(angle(imgFreq)/pi*180);
colormap('gray'); title('Phase')
mag1=abs(imgFreq);
phase1=angle(imgFreq);
r1=ifftshift(ifft2(mag1));
r2=ifft2(exp(1i*phase1));
figure (16)
imshow(uint8(r1));
figure (17)
imshow(r2,[]);
% 1.7
Sobel_filter=[-1 0 1; -2 0 2; -1 0 1];
lena = imread('C:\Users\Saed Khawaldeh\Documents\GitHub\DSP-TP-1617\Lab5\images\lena-grey.bmp');
Filter_dim = size(Sobel_filter);
Image_dim = size(lena);
ZP_dim = Image_dim + Filter_dim - 1;
DFT_input = fft2(double(lena), ZP_dim(1), ZP_dim(2));
DFT_filter = fft2(double(Sobel_filter), ZP_dim(1), ZP_dim(2));
DFT_output = DFT_input.*DFT_filter;
Output_Inv = ifft2(DFT_output);
Output = Output_Inv(2:size(lena,1)+1, 2:size(lena,2)+1);
figure(18);
subplot(121);imshow(lena); title('Original Image') ;
subplot(122); imshow(Output,[]); title(' Image after filtering') ;
 end