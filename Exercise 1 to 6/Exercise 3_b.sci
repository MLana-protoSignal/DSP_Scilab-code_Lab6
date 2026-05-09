// Exercise 3b: x2(n) = delta(n) + delta(n-1) + delta(n-2) + delta(n-3)

clear;
clc;

// Dinh nghia tin hieu
N_max = 10;
n = 0:N_max-1;

x2 = zeros(1, N_max);
x2(1) = 1; // delta(n)
x2(2) = 1; // delta(n-1)
x2(3) = 1; // delta(n-2)
x2(4) = 1; // delta(n-3)

// Tinh DTFT
M = 768; 
omega = linspace(-3*%pi/2, 3*%pi/2, M);
X2 = zeros(1, M);

for k = 1:M
    X2(k) = sum(x2 .* exp(-%i * omega(k) * n));
end

// Ve do thi
clf();

subplot(2,1,1);
plot(omega, abs(X2));
xlabel("Truc tan so: w");
ylabel("Truc |X_2(w)|");
title("Pho bien do cua X_2(w)");
xgrid();

subplot(2,1,2);
plot(omega, atan(imag(X2), real(X2)));
xlabel("Truc tan so: w");
ylabel("Truc angle(X_2(w))");
title("Pho pha cua X_2(w)");
xgrid();
