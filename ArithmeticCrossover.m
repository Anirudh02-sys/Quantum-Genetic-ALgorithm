function [y1,y2] = ArithmeticCrossover(x1,x2)

  r = rand(1,1);
  y1 = r*x1 + (1-r)*x2;
  y2 = (1-r)*x1 + r*x2;

end 