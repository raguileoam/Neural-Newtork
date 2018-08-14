addpath('GConjugado')
addpath('FActivacion')
addpath('RedNeuronal')
clc;clear;close all;
load('Datos/pesos.mat'); % Pesos iniciales para RNA con 6 neuronas en la capa oculta
[aciertos,iwin,P,epocas,e]=Gradiente_conjugado(W1,b1,W2,b2);%para RNA con 6 neuronas en la capa oculta
plot(linspace(1,epocas,epocas),e)
pause
conocidos(P,iwin) %reconocimiento de patrones conocidos
no_conocidos(P,iwin)  %reconocimiento de patrones NO conocidos