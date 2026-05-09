clear;
clc;

n = 0:1000;

u_1 = (n>=0);
u_2 = (n>=6);
x = u_1 - u_2; 

M = 768; 
omega = linspace(-3*%pi/2, 3*%pi/2, M);
X = zeros(1, M);

for k = 1:M
    X(k) = sum(x .* exp(-%i * omega(k) * n));
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
