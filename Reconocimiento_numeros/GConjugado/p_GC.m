function [ p_new ] = p_GC( g,beta,p_old )
%siguiente dirección de busqueda 
p_new=-g+beta*p_old;
end

