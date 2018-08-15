function [ aciertos ] = verificacion( P,Q,a3 ) %P Matriz con los numeros, Q cantidad de numeros manuscritos,a3 respuesta de la red neuronal
% Verificación
for q=1:Q
    [a iwin(q)] = max(a3(q,:));
end
iwin=iwin-1;
y = zeros(1,50);
y = [y ones(1,50)];
aciertos = sum(y==iwin);

%Rutina aleatoria para ver imagen y el reconocimiento
for veces=1:10
    q = round(99 *rand + 1); %se elige un número al azar para reconocer
    numeroreconocido = iwin(q) %reconoce la imagen que esta en el lugar q del conjunto de datos de aprendizaje
    imshow(vec2mat(P(q,:)',20)','InitialMagnification',300) %muestra la imagen
    pause
end
close all

end

