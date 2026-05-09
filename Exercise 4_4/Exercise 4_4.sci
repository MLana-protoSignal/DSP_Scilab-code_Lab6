clear; 
clc;

N = 9; 
n = 0:(N-1);
x = zeros(1, length(n))
offset = 1;
x(0+offset) = 3; 
x(1+offset) = 2; 
x(2+offset) = 1; 
x(4+offset) = 1; 
x(5+offset) = 1; 
x(7+offset) = 1; 
x(8+offset) = 2; 

ck = zeros(1, length(n));

for i = 1:length(n)
    ck(i) = 1/N * sum(x .* exp(-%i .* 2 .* %pi .* n(i) ./ N .* n));
end

clf();

subplot(2,1,1);
plot2d3(n, abs(ck));
plot(n, abs(ck),"r.");
xlabel("Truc k");
ylabel("Truc |ck|");
title("Pho bien do");
xgrid();

subplot(2,1,2);
plot2d3(n, atan(imag(ck), real(ck)));
plot(n, atan(imag(ck), real(ck)),"r.");
xlabel("Truc k");
ylabel("Truc angle(ck)");
title("Pho pha");
xgrid();
