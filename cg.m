function [ p_new ] = cg(p_old,g,g_old )
%CG Summary of this function goes here
%   Detailed explanation goes here
beta_=beta(g,g_old);
p_new=p(g,beta_,p_old);


end

