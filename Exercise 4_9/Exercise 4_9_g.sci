clear;
clc;

n = -2:2;
offset = length(n)/2+1;

x = zeros(1, length(n));
x(-2+offset) = -2; 
x(-1+offset) = -1; 
x(0+offset) = 0;
x(1+offset) = 1;
x(1+offset) = 2;

M = 768; 
omega = linspace(-3*%pi/2, 3*%pi/2, M);
X = zeros(1, M);

for k = 1:M
    X(k) = sum(x .* exp(-%i .* omega(k) .* n));
end

clf();

subplot(2,1,1);
plot(omega, abs(X));
xlabel("Truc tan so: w");
ylabel("Truc |X(w)|");
title("Pho bien do cua X(w)");
xgrid();

subplot(2,1,2);
plot(omega, atan(imag(X), real(X)));
xlabel("Truc tan so: w");
ylabel("Truc angle(X(w))");
title("Pho pha cua X(w)");
xgrid();
