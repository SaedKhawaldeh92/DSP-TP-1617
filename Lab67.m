% LAB 6 & 7
% Prepared by Saed Khawaldeh
function Lab67()
%  Exercice 1
[x,y] = butter(3,0.5,'low');
[H, W]= freqz(x,y);
figure(1);
subplot(2,2,1);
plot(W/pi, abs(H)); 
title('LP Butterworth Filter');
[x,y] = butter(3,0.5, 'high');
[H, W]= freqz(x,y);
subplot(2,2,2);
plot(W/pi, abs(H)); 
title('HP Butterworth Filter');
[x,y] = butter(3,[0.5 0.7]);
[H, W]= freqz(x,y);
subplot(2,2,3);
plot(W/pi, abs(H));
title('BP Butterworth Filter');
[x,y] = butter(3,[0.5 0.7] , 'stop');
[H, W]= freqz(x,y);
subplot(2,2,4);
plot(W/pi, abs(H));
title('BS - Butterworth');
[x,y] = cheby1(3,1,0.5,'low');  
[H, W]= freqz(x,y);
figure(2);
subplot(2,2,1);
plot(W/pi, abs(H)); 
title('LP Chebychev-I filter');
[x,y] = cheby1(3,1, 0.5, 'high');
[H, W]= freqz(x,y);
subplot(2,2,2);
plot(W/pi, abs(H));
title('HP Chebychev-I filter');
[x,y] = cheby1(3,1, [0.5 0.7]);
[H, W]= freqz(x,y);
subplot(2,2,3);
plot(W/pi, abs(H));
title('BP Chebychev-I filter');
[x,y] = cheby1(3,1, [0.5 0.7] , 'stop');
[H, W]= freqz(x,y);
subplot(2,2,4);
plot(W/pi, abs(H)); 
title('BS Chebychev-I filter');
figure(3);
[x,y] = cheby1(3,1,0.5,'low');
[H, W]= freqz(x,y);
subplot(2,2,1);
plot(W/pi, abs(H));
title('LP Chebyshev-I filter, Order=3');
[x,y] = cheby1(5,1,0.5,'low');
[H, W]= freqz(x,y);
subplot(2,2,2);
plot(W/pi, abs(H)); 
title('LP Chebyshev-I filter, Order=5');
[x,y] = cheby1(10,1,0.5,'low');
[H, W]= freqz(x,y);
subplot(2,2,3);
plot(W/pi, abs(H));
title('LP Chebyshev-I filter, Order=10');
[x,y] = cheby1(20,1,0.5,'low');
[H, W]= freqz(x,y);
subplot(2,2,4);
plot(W/pi, abs(H));
title('LP Chebyshev-I filter, Order=20');
%Observations : Increasing the order makes the gradient of the LP filter steeper (more ideal) and increase the ripple caused by the LP filter
% Exercice 2
Dirac_Function=dirac(40, 20);
figure(4);   
plot(Dirac_Function); 
title('Dirac Function'); xlabel('k'); ylabel('x(k)');
scale_value = 0.5; 
Ts = 1; 
Alpha_Value = scale_value*Ts;  
Alpha_Signal = exp(-Alpha_Value) ;
Dirac_anticausal_smoothing = zeros(length(Dirac_Function),1);
Dirac_length=length(Dirac_Function)-2:-1:1;
for i =  Dirac_length 
 Dirac_anticausal_smoothing(i) = scale_value*Alpha_Value*Alpha_Signal*dirac(i+1)+(2*Alpha_Signal)*Dirac_anticausal_smoothing(i+1)-(Alpha_Signal^2)*Dirac_anticausal_smoothing(i+2);
end
figure(5)
stem (Dirac_anticausal_smoothing) ;
title('Anti-causal Smoothing'); 
Dirac_Causal_Smoothing = zeros(length(Dirac_Function),1);
for i = 3:length(Dirac_Function);
 Dirac_Causal_Smoothing(i) = -scale_value*Alpha_Value*Alpha_Signal*dirac(i-1)+(2*Alpha_Signal)*Dirac_anticausal_smoothing(i-1)-(Alpha_Signal^2)*Dirac_anticausal_smoothing(i-2);
end    
figure(6)
stem (Dirac_Causal_Smoothing) ;
title('Causal Smmothing'); 
step_10= step(40,10)
step_30= step(40,30)
Step_Final=step_10-step_30;
figure(7)
stem(Step_Final)
Step_Causal = zeros(length (Step_Final),1) ;
for i = 3 : length(Step_Final)
 Step_Causal(i) = Step_Final(i)+Alpha_Signal*(Alpha_Value-1)*Step_Final(i-1)+(2*Alpha_Signal)*Step_Causal(i-1)-(Alpha_Signal^2)*Step_Causal(i-2) ;
end
figure(8)
stem (Step_Causal) ;
title('Causal Deravative');
Step_Anticausal = zeros(length (Step_Final),1);
Step_Length = length(Step_Final)-2 : -1 : 1 ; 
for i = Step_Length  
 Step_Anticausal(i) = Alpha_Signal*(Alpha_Value+1)*step(i+1)-(Alpha_Signal^2)*step(i+2)+(2*Alpha_Signal)*Step_Anticausal(i+1)-(Alpha_Signal^2)*Step_Anticausal(i+2) ;  
end
figure(9)
stem (Step_Anticausal);
title('Anticausal Deravative');
% Exercice 3
Barb_Image = imread('C:\Users\Saed Khawaldeh\Documents\GitHub\DSP-TP-1617\Lab6-7\images\barbara.gif');
figure(10);
imshow(Barb_Image);  
First_Case = zeros(size(Barb_Image)); 
Second_Case = zeros(size(Barb_Image)); 
for i = 1:size(Barb_Image, 2)
    image_1 = Barb_Image(:,i);
    Response_Causal = zeros(length (image_1),1) ;
    for i = 3 : length(image_1)
     Response_Causal(i) = image_1(i)+Alpha_Signal*(Alpha_Value-1)*image_1(i - 1)+(2*Alpha_Signal)*Response_Causal(i-1)-(Alpha_Signal^2)*Response_Causal(i-2) ;
    end
    Response_AntiCausal = zeros(length (image_1 ),1) ;
    Barb_Image_Length = length(image_1)-2 : -1 : 1 ;
    for i =  Barb_Image_Length
     Response_AntiCausal(i) = Alpha_Signal*(Alpha_Value+1)*image_1(i+1)-(Alpha_Signal^2)*image_1(i+2)+(2*Alpha_Signal)*Response_AntiCausal(i+1)-(Alpha_Signal^2)*Response_AntiCausal(i+2) ;
    end
    Total_Response_1 = Response_Causal + Response_AntiCausal;
    First_Case(:,i) = Total_Response_1;            
end
figure(11);
imshow (First_Case, []);
for i = 1:size(Barb_Image, 2)
    image_2 = Barb_Image(i,:);
    Response_Causal = zeros(length (image_2),1) ;
    for i = 3 : length(image_2)
     Response_Causal(i) = image_2(i)+Alpha_Signal*(Alpha_Value-1)*image_2(i - 1)+(2*Alpha_Signal)*Response_Causal(i-1)-(Alpha_Signal^2)*Response_Causal(i-2) ;
    end
    Response_AntiCausal = zeros(length (image_2 ),1) ;
    Barb_Image_Length = length(image_2)-2 : -1 : 1 ;
    for i =  Barb_Image_Length
     Response_AntiCausal(i) = Alpha_Signal*(Alpha_Value+1)*image_2(i+1)-(Alpha_Signal^2)*image_2(i+2)+(2*Alpha_Signal)*Response_AntiCausal(i+1)-(Alpha_Signal^2)*Response_AntiCausal(i+2) ;
    end
    Total_Response_2 = Response_Causal + Response_AntiCausal;
    Second_Case(i,:) = Total_Response_2;   
end
figure(12);
imshow (Second_Case, []);
function F1 =  dirac(n,N)       
    if ((n<1)||(n>N))
        disp('n > N-1');  
        F1= 0;
    else
        s = zeros(1,N);
        s(n) = 1 ;
        F1 = s;   
    end
end
function F1 =  step(n,N) 
    if ((n<1)||(n>N))
        disp('n > N-1'); 
        F1= 0;    
    else   
        s = zeros(N,1);   
        for i = n+1:N
            s(i) = 1 ;
        end
        F1 = s;
        figure(2)
        subplot(3,1,1)
        stem(F1) ;                        
        xlabel('X'); ylabel('Y')   
    end
end 
end