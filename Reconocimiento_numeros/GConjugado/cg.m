function [ p_new ] = cg(p_old,g,g_old )
%funci�n que reune los datos de beta y p.
beta_=beta(g,g_old);
p_new=p_GC(g,beta_,p_old);


end

