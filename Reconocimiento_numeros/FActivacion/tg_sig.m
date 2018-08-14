function y = tg_sig(n)
y = (exp(n) - exp(-n))./(exp(n) + exp(-n)); %función tangecial sigmoide para activar neurona
end