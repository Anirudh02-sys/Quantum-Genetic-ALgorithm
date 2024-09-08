clc;
clear;
close all;
%% Definitions 
%problem
problem.CostFunction = @(x) MinSphere(x);
problem.nVar = 3; % No. of genes in a chromosome

% QGA params
params.MaxIt = 50;
params.nPop = 6;
params.qPop = 2;
params.nChromo = 3;
params.nMin = -5;
params.nMax = 5;

% Initializing first two quantum chromosomes
empty_individual.Chromosome = []; % chromosome
empty_individual.BinVal = [];
empty_individual.Cost = [];
qpop = repmat(empty_individual,params.qPop,1);
for i=1:params.qPop
    for j = 1:params.nChromo
                val = params.nMin + (0-(params.nMin))*rand(1,1);
                g = CreateGene(val,val+params.nMax,params.nMin,params.nMax);
                temp(j) = g;
     end
            qpop(i).Chromosome = temp;
end

% Now we call the algorithm that perfroms interference , generates
% classical population which is used to obtain two best solutions that are
% again used as input
bestsol = repmat(empty_individual,1,1);
bestsol.Cost = 1000;

y = linspace(1,params.MaxIt,params.MaxIt);
best = zeros(1,params.MaxIt);
for i=1:params.MaxIt
    out = QGA(problem,params,qpop,empty_individual);
    if out.qpop(1).Cost < bestsol.Cost
        qpop = out.qpop;
        bestsol.Cost = qpop(1).Cost;
        bestsol.Chromosome = qpop(1).Chromosome;
    end
    disp(['Iteration' num2str(i) ' :Best Cost = ' num2str(qpop(1).Cost)]);
    best(i) = qpop(1).Cost;
end
figure;
plot(y,best);
pdf1 = bestsol.Chromosome(1).PDF;
pdf2 = bestsol.Chromosome(2).PDF;
pdf3 = bestsol.Chromosome(3).PDF;
x = -5:.01:5;
figure;
subplot(3,1,1);
plot(x,pdf1,'r','LineWidth',2);
subplot(3,1,2);
plot(x,pdf2,'r','LineWidth',2);
subplot(3,1,3);
plot(x,pdf3,'r','LineWidth',2);