function Lab2()

fs = 20 ;
f = 1;
t = [0:1/fs:20];
f1 = sin(2*pi*f*t);
f2 = sin(2*pi*(f/fs)*t);

figure(1)
plot(t,f1);
title('Sin Function')
xlabel('t')
ylabel(' sin(2*pi*f*t1) ')

figure(2)
plot(t,f2);
title('Sin Function')
xlabel('t')
ylabel(' sin(2*pi*(f/fs)*t2)')



%Exercise:1 Causality
%Part1.1
f = step(4,20);
for k= 1:19
    y(k) = f(k)/2+ (f(k+1))/2;
end

figure(3)
stem(f)
title('Step')
xlabel('x(k) ')
ylabel(' y(k) ')

figure(4)
stem(y)
title('Non Causal System')
xlabel('x(k) ')
ylabel(' y(k) ')

%Part1.2 : Propose a modification to obtain a causal version and comment 
%your observations.
for k= 2:20
    y(k) = f(k)/2+ (f(k-1))/2;
end

figure(5)
stem(y)
title('Causal System')
xlabel('x(k) ')
ylabel(' y(k) ')
%Comments:
%In first part of the problem the system contains k+1 in the its equation
%which makes it non-causal because it contain future values
%A system whose present response depends on future values of the inputs is 
%called as a non-causal system.
%A system is said to be causal system if its output depends on present and
%past inputs only and not on future inputs, The above system bacame
%causal by replacing k+1 by k-1; because the system does not depend on
%future inputs.





%Exercise 2 
%Part 2.1
f3 = f; 
for i = 2:1:20
    f3(i) = f3(i-1)+f(i);
end

figure(6)
stem(f3)
title('Accumulation')
xlabel('x(k) ')
ylabel('f(k)')

%Part 2.2
d = Dirac(4,20); %d is a step function
f4 = d;
for i = 2:1:20
    f4(i) = f4(i-1)+d(i);
end

figure(7)
stem(f4) 
title('Stable System')
xlabel('d(k) ')
ylabel('f(k)')


%Part 2.3 
d = Dirac(4,20);
f5 = d;
for i = 2:1:20
    f5(i) = d(i)+ 2*(f5(i-1));
end

figure(8)
stem(f5);
title('Unstable System')
xlabel('d(k) ')
ylabel('f(k)')



%Part 2.4: Stability
d = Dirac(4,20);
f6 = d;
for i = 2:1:20
    f6(i) = d(i)+ (f6(i-1)/3);
end

figure(9)
stem(f6)  
title('Stable System')
xlabel('d(k) ')
ylabel('f(k)')

%Comments:
%Part 1.1 : Unstable system because it keep adding previous values till our range and
%it doesn't approach to zero, The signal keep increasing with constant
%addition of 1.
%Part 1.2 :As we are using a dirac function so it is 1 til all its range which makes
%it stable and constant for all range of values.
%Part 1.3 : Exponential increasing so its not a stable system.
%Part 1.4 : Exponential increasing in negative direction approaching
%to zero so stable sytem.



%Exercise 3:Invariance and linearity
%Part 3.1 
xa=[0 0 0 0 1 2 3 4 5 0 0 0 0 0 0 0 0 0 0];
xb=[0 0 0 0 0 0 0 0 0 4 3 2 1 0 0 0 0 0 0];
fa(1)=0;
fb(1)=0;

for i=2:1:19-1
    fa(i)=3*xa(i-1)-2*xa(i)+xa(i+1);
end

figure(10);
stem(fa) 
title('System Xa')
xlabel('x(a) ')
ylabel('f(a)')

% Part 3.2  
for i=2:1:19-1
    fb(i)=3*xb(i-1)-2*xb(i)+xb(i+1);
end

figure(11)
stem(fb) 
title('System Xa')
xlabel('x(b) ')
ylabel('f(b)')


% Part 3.3  
h=[1,-2,3];
f=xa+xb; 
f1=conv(f,h);

figure(12)
stem(f1);
title('Convolution of two signal')
xlabel('X = conv(xa) + conv(xb) ')
ylabel('f)')


% Part 3.4 
f2=conv(xa,h)+conv(xb,h); 

figure(13)
stem(f1);
title('Convolution of two signal')
xlabel('X = conv(xa + xb) ')
ylabel('f)')
%Comments:
%LTI system can be characterized entirely by a single function called the 
%system's impulse response , So we take impulse response h and check
%whether the sytem is LTI System or not, So From results we can clearly see
%that there is no change in the sytem,SO sytem in LTI system

end





   
  
 