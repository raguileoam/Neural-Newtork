function [ b ] = beta( g,g_old )
%BETA Summary of this function goes here
%   Detailed explanation goes here
b=(g'*g)./(g_old'*g_old);
b=diag(b,length(b)-1);
end

