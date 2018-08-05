clear ; close all; clc
%usa algoritmo de entrenamiento tg_sig
load('train.mat'); 
Q = size(P, 2); %numero de muestras(100, 50 ceros y 50 unos) 
T = [ones(1,50); -ones(1,50)];
T = [T [-ones(1,50); ones(1,50)]];
P=P';
T=T';
% Valores iniciales
n1 = 6; %neuronas en la capa oculta
maximo=0.1;
minino=-0.1;
W1=mapminmax(rand(400,n1),minino,maximo);
b1=mapminmax(rand(1,n1),minino,maximo);
W2=mapminmax(rand(n1,2),minino,maximo);
b2=mapminmax(rand(1,2),minino,maximo);

alfa = 0.01;
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
   
    fe=sum(sum(0.5*(T-a3).^2)/Q)/2
end
epocas
% Verificación
for q=1:Q
    [a iwin(q)] = max(a3(q,:));
end
iwin=iwin-1;
y = zeros(1,50);
y = [y ones(1,50)];
NumeroAciertos = sum(y==iwin)


%Rutina aleatoria para ver imagen y el reconocimiento
% 
% for veces=1:10
%     q = round(99 *rand + 1);
%     numeroreconocido = iwin(q)
%     imshow(vec2mat(P(q,:),20)','InitialMagnification',300)
%     pause
% end
% load ('prueba.mat');
% close all
% 

