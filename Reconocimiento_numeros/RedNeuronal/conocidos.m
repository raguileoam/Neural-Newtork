function [  ] = uso( P,iwin )
%Rutina aleatoria para ver imagen y el reconocimiento
for veces=1:10
    q = round(99 *rand + 1); %se elige un número al azar para reconocer
    numeroreconocido = iwin(q) %reconoce la imagen que esta en el lugar q del conjunto de datos de aprendizaje
    imshow(vec2mat(P(q,:),20)','InitialMagnification',300) %muestra la imagen
    pause
end
load ('Datos/prueba.mat'); %carga archivos de prueba (imagenes de 1 y 0 no mostradas en proceso de aprendizaje)
close all

end

