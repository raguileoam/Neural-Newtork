%usa algoritmo de entrenamiento tg_sig
function [aciertos,iwin,P,epocas,e]=gdescendente(W1,b1,W2,b2)
load('Datos/train.mat'); % Contiene variable P con los números 1 y 0
Q = size(P, 2); %numero de muestras(100, 50 ceros y 50 unos) 
T = [ones(1,50); -ones(1,50)];
T = [T [-ones(1,50); ones(1,50)]];
P=P';
T=T';
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
epocas
% Verificación
for q=1:Q
    [a iwin(q)] = max(a3(q,:));
end
iwin=iwin-1;
y = zeros(1,50);
y = [y ones(1,50)];
aciertos = sum(y==iwin);
end
