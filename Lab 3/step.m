function y2 =  step(n,N) %Function Defination 

    if n >(N-1)
            Disp('Error : n should be inferior then N-1'); %Display error in n > N-1
    else
            s = zeros(N,1);  % 
            for i = n+1:N
            s(i) = 1 ;
            end
            y2 = s;
           
    end
  figure;
  stem(y2)
end