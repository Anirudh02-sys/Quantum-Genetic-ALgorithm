function qpop = CreateQPop(cpop,nMax,nMin,nChromo)
      
    for i=1:nChromo
        val = cpop.Chromosome(i);
        if val<0
            g = CreateGene(val,val+nMax,nMin,nMax);
        else
            g = CreateGene(val-nMax,val,nMin,nMax);
        end    
        qpop.Chromosome(i) = g;
    end
end