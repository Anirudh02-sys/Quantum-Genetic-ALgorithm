function int = Intereference(qpop)

x = -5:.01:5;

int.pdf1 = (qpop(1).Chromosome(1).PDF+qpop(2).Chromosome(1).PDF)/2;
int.pdf2 = (qpop(1).Chromosome(2).PDF+qpop(2).Chromosome(2).PDF)/2;
int.pdf3 = (qpop(1).Chromosome(3).PDF+qpop(2).Chromosome(3).PDF)/2;
int.cdf1 = (qpop(1).Chromosome(1).CDF+qpop(2).Chromosome(1).CDF)/2;
int.cdf2 = (qpop(1).Chromosome(2).CDF+qpop(2).Chromosome(2).CDF)/2;
int.cdf3 = (qpop(1).Chromosome(3).CDF+qpop(2).Chromosome(3).CDF)/2;

figure;
subplot(3,1,1);
plot(x,int.pdf1,'r','LineWidth',2);
subplot(3,1,2);
plot(x,int.pdf2,'r','LineWidth',2);
subplot(3,1,3);
plot(x,int.pdf3,'r','LineWidth',2);


figure;
subplot(3,1,1);
plot(x,int.cdf1,'r','LineWidth',2);
subplot(3,1,2);
plot(x,int.cdf2,'r','LineWidth',2);
subplot(3,1,3);
plot(x,int.cdf3,'r','LineWidth',2);


end