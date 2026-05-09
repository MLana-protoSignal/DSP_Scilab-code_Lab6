clear;
clc;

M = 768; 
omega = linspace(-3*%pi/2, 3*%pi/2, M);
H = zeros(1, M);

H = 1 ./ (1 + 0.1 .* exp(-%i * omega) + 0.2 .* exp(-%i * 2 * omega));

clf();

subplot(2,1,1);
plot(omega, abs(H));
xlabel("Truc tan so: w");
ylabel("Truc |H(w)|");
title("Pho bien do cua H(w)");
xgrid();

subplot(2,1,2);
plot(omega, atan(imag(H), real(H)));
xlabel("Truc tan so: w");
ylabel("Truc angle(H(w))");
title("Pho pha cua H(w)");
xgrid();
