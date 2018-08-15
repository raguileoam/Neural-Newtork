function [a3,Q,epocas,e,fe,W1,b1,W2,b2]=gconjugado(P,T,W1,b1,W2,b2)
%basado en http://matlab.izmiran.ru/help/toolbox/nnet/backpr59.html
addpath('FActivacion') %Carpeta que contiene la funcion de activacion Tangecial sigmoide,su derivada,y su segunda derivada
%usa algoritmo de entrenamiento tg_sig 
Q = size(P, 1); %numero de muestras(100, 50 ceros y 50 unos) 
% Valores iniciales
alfa = 0.001;
epocas=0;
fe=inf;  
[ a3,g_W2,g_W1,g_b2,g_b1 ] = feedfordward( P,W1,W2,b1,b2,T);

p_W2=-g_W2;
p_W1=-g_W1;
p_b2=-g_b2;
p_b1=-g_b1;


while fe>10^-4
    epocas=epocas+1;
    g_W2_old=g_W2;
    g_W1_old=g_W1;
    g_b2_old=g_b2;
    g_b1_old=g_b1;
    
    W2 = W2 + alfa*p_W2;
    b2 = b2 + alfa*p_b2;
    W1 = W1 + alfa*p_W1;
    b1 = b1 + alfa*p_b1;
    
    [ a3,g_W2,g_W1,g_b2,g_b1 ] = feedfordward( P,W1,W2,b1,b2,T );
    
    if isnan(g_W2)
        return;
    end
    p_W2=cg(p_W2,g_W2,g_W2_old);
    p_W1=cg(p_W1,g_W1,g_W1_old);
    p_b2=cg(p_b2,g_b2,g_b2_old);
    p_b1=cg(p_b1,g_b1,g_b1_old);
 
        
    fe=sum(sum(0.5*(T-a3).^2)/Q)/2;
    e(epocas)=fe;
end
%epocas
%fe
