// Exercise 5: LTI system h(n) = delta(n) + delta(n-1), x(n) = 0.5^n u(n)

clear;
clc;

// Dinh nghia tin hieu
N = 100;
n = 0:N-1;

x = (0.5).^n;   // x(n)
h = zeros(1, N);
h(1) = 1;       // delta(n)
h(2) = 1;       // delta(n-1)

// Tinh DTFT
M = 768; 
omega = linspace(-3*%pi/2, 3*%pi/2, M);

X = zeros(1, M);
H = zeros(1, M);

for k = 1:M
    X(k) = sum(x .* exp(-%i * omega(k) * n));
    H(k) = sum(h .* exp(-%i * omega(k) * n));
end

// Y(omega) = H(omega)X(omega)
Y = H .* X;

// Ve do thi
clf();

subplot(2,1,1);
plot(omega, abs(Y));
xlabel("Truc tan so: w");
ylabel("Truc |Y(w)|");
title("Pho bien do cua Y(w)");
xgrid();

subplot(2,1,2);
plot(omega, atan(imag(Y), real(Y)));
xlabel("Truc tan so: w");
ylabel("Truc angle Y(w)");
title("Pho pha cua Y(w)");
xgrid();
