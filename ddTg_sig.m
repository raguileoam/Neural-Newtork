function [ y ] = ddTg_sig( n )
%Segunda derivada de la funci�n tangecial-sigmoide
y=-2*tg_sig(n).*dTg_sig(n);
end

