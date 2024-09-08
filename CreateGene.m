function gene = CreateGene(a,b,nMin,nMax)
    %function to create a single gene within a given range

    pd = makedist('Uniform','lower',a,'upper',b);

    x = nMin:.01:nMax;
    PDF = pdf(pd,x);
    CDF = cdf(pd,x);
    %Store values
    gene.lower = pd.Lower;
    gene.upper = pd.Upper;
    gene.PDF = PDF;
    gene.CDF = CDF;
    

end