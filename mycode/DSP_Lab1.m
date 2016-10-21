function DSP_Lab1()  
    % 1.1
    f1 = Dirac(10,20);
    figure(1); stem(f1);
    xlabel ('k')
    ylabel ('impulse (k)')
    title('Dirac Function for n=10')
    % 1.2
    f2 = step(10,20);
    figure(2); stem(f2);
    xlabel ('k')
    ylabel ('H(k)')
    title('Dirac Function with step @ n = 10') 
    % 1.3
    f3 = ramp(2,10,20);
    figure(3); stem(f3);
    xlabel ('k')
    ylabel ('P(k)')
    title('Ramp Function for a=2 and n=10')   
    % 1.4
    f4= geo(2,10,20);
    figure(4);stem(f4);
    xlabel ('k')
    ylabel ('G(k)')
    title('Geometric function for a=2 and n=10')
    % 1.5
    f5=box(3,10,20);
    figure(5);stem(f5);
    xlabel ('k')
    ylabel ('Ba(k)')
    title('Box Function')
    % 1.6 
    f6=sinewave(10,1/100);
    figure(6);stem(f6);
    xlabel ('t')
    ylabel ('Sin(t)')
    title('Sine Function @ fs=100 Hz')
    f6=sinewave(10,1/1000);
    figure(7);stem(f6);
    xlabel ('t')
    ylabel ('Sin(t)')
    title('Sine Function @ fs=1000 Hz')
    f6=sinewave(10,1/30);
    figure(8);stem(f6);
    xlabel ('t')
    ylabel ('Sin(t)')
    title('Sine Function @ fs=30 Hz')
    % 2.1
    f7 = gauss(1000);
    figure(9); hist (f7);
    histfit(f7);
    xlabel ('xn')
    ylabel ('N')
    title('Histogram of gaussian function')
    f7 = gauss(1000);
    figure(9); hist (f7);
    histfit(f7);
    xlabel ('xn')
    ylabel ('N')
    title('Histogram of gaussian function (1000 samples)')
    f7 = gauss(10000);
    figure(10); hist (f7);
    histfit(f7);
    xlabel ('xn')
    ylabel ('N')
    title('Histogram of gaussian function (10000 samples)')
    
    % Discuss : If we increase the number of samples we notice that our
    % hostogram fits better the gaussian distribution, this means if we
    % make the number of samples equal to infinity it will be perfectly a
    % gaussian distibution 
    
    % 2.2
    f8 = uniform(1000);
    figure(11); hist (f8);
    histfit(f8);
    xlabel ('xu')
    ylabel ('U')
    title('Histogram of uniform function (1000 samples)')
    % 2.3
    f9=corr_gauss();
    figure(12); plot(f9)
    xlabel ('xn')
    ylabel ('N')
    title('Autocorelation of gaussian function')
    f10=corr_uniform();
    figure(13); plot(f10)
    xlabel ('xu')
    ylabel ('U')
    title('Autocorelation of uniform function')
    
    %  Are these noises ”white” ? Conclusion ?
    % White noise means that the noise does not change with changing the
    % frequency, as we observe from the graphs of autocorelation for both
    % Gaussian and Uniform functions; the gaussian function does not change
    % by changing the frquency which shows that it is a white noise, but
    % the uniform noise changes by changing the frquency which shows that
    % it is not a white noise.
    
    % 2.4
    [f11,f12,f13,f14]=binary();
    figure(14); plot(f11);
    xlabel ('i')
    ylabel ('s(i)')
    title('Signal s=s1+s2+s3')
    figure(15); plot(f12);
    xlabel ('samples')
    ylabel ('Cross-correlation')
    title('Cross-corelation between s and s1')
    figure(16); plot(f13);
    xlabel ('samples')
    ylabel ('Cross-correlation')
    title('Cross-corelation between s and s2')
    figure(17); plot(f14);
    xlabel ('samples')
    ylabel ('Cross-correlation')
    title('Cross-corelation between s and s3')
    
    % Comments on the results. The cross-correlation function shows the similarities
    % between two given functions; in our case, the results shown in
    % figures 15, 16, and 17 shows the correlation between s = s1+s2+3 and
    % the functions s1, s2, and s3 respectively. For example, when we cross-correlate
    % s1 with s we see a spike in the range of s which has s1 and same
    % thing for other figures.
    
end



% 1.1
function f1 =  Dirac(n,N) 

    if n >(N-1)
            Disp('Error : n should be less than N-1'); 
    else
            s = zeros(N,1); 
            s(n) = 1 ;
            f1 = s;    
    end
  
end
% 1.2
function f2 =  step(n,N) 
 
    if n >(N-1)
            Disp('Error : n should be less than N-1'); n > N-1
    else
            s = zeros(N,1); 
            for i = n:N
            s(i) = 1 ;
            end
            f2 = s;
           
    end
  
end
% 1.3

function f3 =  ramp(a,n,N) 

    if n >(N-1)
            Disp('Error : n should be less than N-1');
    else     s = zeros(1,N);
            for j = n:N
            s(j) = a*(j-n);
            end
            f3 = s;
    end
  
end
 
% 1.4


function f4 =  geo(a,n,N)
    if n >(N-1)
            Disp('Error : n should be less than N-1'); 
    else
            s = zeros(1,N); 
            for j = n:N
            s(j) = a^(j-n);
            end
            f4 = s;    
    end
  
end

% 1.5 
function f5 =  box(a,n,N) 

    if n >(N-a) || n< (1+a)
            Disp('Error : n should be less than N-a or greater than 1+a'); 
    else      
            s = zeros(1,N);
            for j = n-a:n+a
            s(j) = 1;
            end  
            f5 = s; 
    end
  
end
% 1.6
function f6 =  sinewave(f,Ts) 

   st = 0.10;      
   t = (0:Ts:st-Ts);                    
   f6 = sin(2*pi*f*t);

end

% 2.1

function f7 =  gauss(n) 
a = mean (randn (n,1));
b = std(randn (n,1));
f7 = a.*randn(n,1) + b;
end
 
% 2.2
function f8 =  uniform(n) 
f8 = rand (n,1);
end

% 2.3
function f9 =  corr_gauss()
f9 = randn(1000,1);
f9=xcorr(f9,'biased');
end

function f10 =  corr_uniform()

f10 = rand(1000,1);
f10=xcorr(f10,'biased');
end 

% 2.4 
function [f11,f12,f13,f14] =  binary()
s1=round(rand(1,50));
s2=round(rand(1,50));
s3=round(rand(1,50));
s=zeros(300,1);
    for i= 1:50
        s(i)=s1(i);   
    end
    for i=51 :300
        s1(i)=0;
    end

    for i=1:50
        s(i+150)=s2(i);
    end
    for i=51 :300
        s2(i)=0;
    end
    
    for i=1:50
        s(i+250)=s3(i);
    end
    for i=51 :300
        s3(i)=0;
    end
f11=s;
f12=xcorr(f11,s1); 
f13=xcorr(f11,s2);
f14=xcorr(f11,s3);
end