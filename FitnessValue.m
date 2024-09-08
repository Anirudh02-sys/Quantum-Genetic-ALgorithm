function cost = FitnessValue(xbinary,n,ng,xmin,xmax,CostFunction)
    p = linspace(xmin,xmax,2^n+1);
    t = reshape(xbinary,[],ng);
    index = [];
    genes = [];
    for i=1:ng
      index(i) = bin2dec(strjoin(string(t(i,:))))+1;
      genes(i) = p(index(i));
    end
       cost = CostFunction(genes); 
       %disp(cost);
end