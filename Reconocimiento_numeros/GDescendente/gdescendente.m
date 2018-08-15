%usa algoritmo de entrenamiento tg_sig
function [a3,P,Q,T,epocas,e,fe,W1,b1,W2,b2]=gdescendente(P,T,W1,b1,W2,b2)
Q = size(P, 1); %numero de muestras(100, 50 ceros y 50 unos) 
% Valores iniciales
alfa = 0.001;
epocas=0;
fe=inf;
[ a3,g_W2,g_W1,g_b2,g_b1 ] = feedfordward( P,W1,W2,b1,b2,T );

while fe>10^-4
    epocas=epocas+1;
    W2 = W2 - alfa*g_W2;
    b2 = b2 - alfa*g_b2;
    W1 = W1 - alfa*g_W1;
    b1 = b1 - alfa*g_b1;
    [ a3,g_W2,g_W1,g_b2,g_b1 ] = feedfordward( P,W1,W2,b1,b2,T );
    fe=sum(sum(0.5*(T-a3).^2)/Q)/2;
    e(epocas)=fe;
end
%epocas
%fe
