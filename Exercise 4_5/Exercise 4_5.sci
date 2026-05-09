clear; 
clc;

N = 8; 
n = 0:(N-1); 
x = 2 + 2 * cos(%pi/4 .* n) + cos(%pi/2 .* n) + 1/2 .* cos(3 .* %pi/4 .* n);
k = -3 : (N-3-1);
ck = zeros(1, N);
ck_2 = zeros(1, N);
for i = 1:length(k)
    ck(i) = 1/N * sum(x .* exp(-%i .* 2 .* %pi .* k(i) / N .* n));
    ck_2(i) = abs(ck(i))^2;
end

clf();
plot2d3(k, ck_2);
plot(k, ck_2, "r.");
xlabel("Truc k");
ylabel("Truc |c_k|^2");
title("Pho mat do cong suat");
xgrid();
