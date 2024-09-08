function cpop = CreatePop(int)
    
    index = zeros(3);
    for i = 1:3 
        index(i) = (1-0).*rand(1,1) + 0;
    end
    x = linspace(-5, 5, 1000);
    
    tol = 0.001;
    cg1 = find(abs(int.cdf1 - index(1))<tol);
    cg2 = find(abs(int.cdf2 - index(2))<tol);
    cg3 = find(abs(int.cdf3 - index(3))<tol);
   
    cpop.Chromosome = [x(cg1(1)),x(cg2(1)),x(cg3(1))];
  

end