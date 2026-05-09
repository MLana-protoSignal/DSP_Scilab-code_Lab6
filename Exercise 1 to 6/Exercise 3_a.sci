clear;
clc;

N = 100; // Do dai tin hieu
n = 0:N-1;
x1 = (0.1).^n; // x1(n) = 0.1^n * u(n)

// Tinh DTFT tren luoi tan so omega
M = 768; // So diem tan so
omega = linspace(-3*%pi/2, 3*%pi/2, M); 
X1 = zeros(1, M);

for k = 1:M
    X1(k) = sum(x1 .* exp(-%i * omega(k) * n));
end

// Ve do thi
clf();

subplot(2,1,1);
plot(omega, abs(X1));
xlabel("Truc tan so: w");
ylabel("Truc |X_1(w)|");
title("Pho bien do cua X_1(w)");
xgrid();

subplot(2,1,2);
plot(omega, atan(imag(X1), real(X1)));
xlabel("Truc tan so: w");
ylabel("Truc angle(X_1(w))");
title("Pho pha cua X_1(w)");
xgrid();
