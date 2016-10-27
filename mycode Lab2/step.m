function f3 =  step(n,N) 
 
    if ((n<1)||(n>N))
            disp('Error: n should be less than N-1');
    else
            s = zeros(N,1); 
            for i = n:N
            s(i) = 1 ;
            end
            f3 = s;
           
    end
  
end
