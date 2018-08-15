% ------------------------------------------------------------------------------------%
% Aprendizaje mediante entrenamiento de redes de aproximaci�n
% Reconocimiento de n�meros mediante redes neuronales artificiales
% Aliwen Melill�n(ICI) - Diego Vega(ICI) - Felipe S�nchez(ICEL) - Diego Obando(ICEL)
% M�todos Num�ricos - Profesor Eduardo Uribe
% Universidad de La Frontera
% ------------------------------------------------------------------------------------%
addpath('GDescendente'); %Agrega carpetas a usar
addpath('FActivacion'); %Agrega carpetas a usar
addpath('RedNeuronal'); %Agrega carpetas a usar
addpath('GConjugado'); %Agrega carpetas a usar
clc;clear;close all; %Limpia y cierrca workspace y comandos para evitar problemas con variables
load('Datos/entrenamiento.mat');  %Matriz P con los n�meros a usar y matriz T con los valores que debe interpretar la red neuronal ante los valores de P(dise�ado exclusivamente para funci�n de activacion sigmoide tangencial)
load('Datos/pesos.mat'); % Pesos iniciales para red con 6 neuronas en la capa oculta

disp("Eliga m�todo a usar:")
op=input('1) Gradiente descendente 2) Gradiente conjugado 0)Salir\n');
if op==1
    disp("Gradiente descendente");
   [a3,P,Q,T,epocas,e,fe,W1,b1,W2,b2]=gdescendente(P,T,W1,b1,W2,b2); %para red con 6 neuronas en la capa oculta
elseif op==2
    disp("Gradiente conjugado");
   [a3,Q,epocas,e,fe,W1,b1,W2,b2]=gconjugado(P,T,W1,b1,W2,b2);%para RNA con 6 neuronas en la capa oculta
elseif op==0
   return
else
    op=input('N�mero invalido.Ingrese su opcion nuevamente: \n');
end


disp("Espere un momento...");
plot(linspace(1,epocas,epocas),e); %Muestra error a lo largo de las iteraciones
disp("Error: "+fe);disp("Iteraciones: "+epocas);
disp("Presione cualquier tecla para avanzar...");
pause;

disp("Prueba aleatoria con datos conocidos(10),Presione cualquier tecla para avanzar...");
ac_train=verificacion(P,Q,a3); %reconocimiento de patrones conocidos
disp("N�meros de la matriz de entrenamiento acertados correctamente: "+ac_train+"%");

disp("Prueba aleatoria con nuevos datos(10),Presione cualquier tecla para avanzar...");
load ('Datos/prueba.mat'); %carga archivos de prueba (imagenes de 1 y 0 no mostradas en proceso de aprendizaje)
a3_=feedfordward( P_',W1,W2,b1,b2,T ); %Con nuevos pesos hace proceso feedforward con la matriz con numeros de prueba
ac_test=verificacion(P_',Q,a3_);  %reconocimiento de patrones NO conocidos
disp("N�meros de la matriz de prueba acertados correctamente: "+ac_test+"%");