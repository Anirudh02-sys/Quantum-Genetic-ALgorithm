function out = QGA(problem,params,qpop,empty_individual)

x = -5:.01:5;

%setting values
CostFunction = problem.CostFunction;
nPop = params.nPop;
qPop = params.qPop;
nMax = params.nMax;
nMin = params.nMin;
nChromo = params.nChromo;

%Result of intereference
int = Intereference(qpop);

%Creating classical population - 1
cpop = repmat(empty_individual,nPop,1);
for i=1:2
        temp = CreatePop(int);
        cpop(i).Chromosome = temp.Chromosome;
end

%creating more members using crossover
[cpop(3).Chromosome,cpop(4).Chromosome] = ArithmeticCrossover(cpop(1).Chromosome,cpop(2).Chromosome);
[cpop(5).Chromosome,cpop(6).Chromosome] = Mutate(cpop(3).Chromosome,cpop(4).Chromosome);

for i=1:nPop
    cpop(i).Cost = CostFunction(cpop(i).Chromosome);
end
cpop = SortPopulation(cpop);
disp("Cpop local best costs : ");
disp(cpop(1).Cost);
disp(cpop(2).Cost);

qpop = repmat(empty_individual,qPop,1);
for i=1:2
        temp = CreateQPop(cpop(i),nMax,nMin,nChromo);
        qpop(i).Chromosome = temp.Chromosome;
        qpop(i).Cost = cpop(i).Cost;

end

out.qpop = qpop;

end