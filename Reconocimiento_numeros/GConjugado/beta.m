function [ b ] = beta( g,g_old )
%Actualización de Fletcher-Reeves 
b=(g'*g)./(g_old'*g_old);
b=diag(b,length(b)-1);
end

