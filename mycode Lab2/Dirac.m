function f1 =  Dirac(n,N) 

    if ((n<1)||(n>N))
            disp('Error: n should be less than N-1'); 
            f1=0;
    else
            s = zeros(1,N); 
            s(n) = 1 ;
            f1 = s;    
    end
  
end