function [aciertos,iwin,P,epocas,e]=Gradiente_conjugado(W1,b1,W2,b2)
addpath('GConjugado')
addpath('FActivacion') %Carpeta que contiene la funcion de activacion Tangecial sigmoide,su derivada,y su segunda derivada
%usa algoritmo de entrenamiento tg_sig
load('Datos/train.mat'); 
Q = size(P, 2); %numero de muestras(100, 50 ceros y 50 unos) 
T = [ones(1,50); -ones(1,50)];
T = [T [-ones(1,50); ones(1,50)]];
P=P';
T=T';
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
epocas
% Verificación
for q=1:Q
    [a iwin(q)] = max(a3(q,:));
end
iwin=iwin-1;
y = zeros(1,50);
y = [y ones(1,50)];
aciertos = sum(y==iwin)

%Rutina aleatoria para ver imagen y el reconocimiento

% for veces=1:10
%     q = round(99 *rand + 1);
%     numeroreconocido = iwin(q)
%     imshow(vec2mat(P(q,:),20)','InitialMagnification',300)
%     pause
% end
% load ('Datos/prueba.mat');
% close all


