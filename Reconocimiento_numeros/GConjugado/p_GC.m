function [ p_new ] = p_GC( g,beta,p_old )
%siguiente direcci�n de busqueda 
p_new=-g+beta*p_old;
end

