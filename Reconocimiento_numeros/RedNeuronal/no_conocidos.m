function [  ] = no_conocidos( P,iwin )
%NO_CONOCIDOS Summary of this function goes here
%   Detailed explanation goes here
%Rutina aleatoria para ver imagen y el reconocimiento

for veces=1:10
    q = round(99 *rand + 1);
    numeroreconocido = iwin(q)
    imshow(vec2mat(P(q,:),20)','InitialMagnification',300)
    pause
end
load ('Datos/prueba.mat');
close all

end

