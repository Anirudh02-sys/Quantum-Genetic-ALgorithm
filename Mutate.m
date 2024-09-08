function [y1,y2] = Mutate(x1,x2)
  pd = makedist('Normal','mu',0,'sigma',0.05);
  g1 = random(pd,1,3);
  g2 = random(pd,1,3);
  y1 = x1+g1;
  y2 = x2+g2;
end 