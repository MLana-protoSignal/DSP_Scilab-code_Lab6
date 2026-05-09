clear;
clc;

function re = f_real(w, n_val, x, n_x)
    X = sum(x .* exp(-%i * w * n_x));
    Y = imag(X) + real(X) * exp(%i * 2 * w);
    re = real(Y * exp(%i * w * n_val)) / (2 * %pi);
endfunction

function im = f_imag(w, n_val, x, n_x)
    X = sum(x .* exp(-%i * w * n_x));
    Y = imag(X) + real(X) * exp(%i * 2 * w);
    im = imag(Y * exp(%i * w * n_val)) / (2 * %pi);
endfunction

n_x = -3:1;
x = [1, 0, -1, 2, 3];

n_y = -6:6; 
y = zeros(1, length(n_y));
// Tinh y bang dinh nghia tich phan
for i = 1:length(n_y)
    // Dung intg de anh xa ham ma khong can define omega(w)
    // omega(w) là bien chay nen khong can khai bao vao list
    re = intg(-%pi, %pi, list(f_real, n_y(i), x, n_x)); 
    im = intg(-%pi, %pi, list(f_imag, n_y(i), x, n_x)); 
    y(i) = re + %i * im;
end
// Dung clean de loai bo sai so do lay mau và tinh toan
y = clean(y); 

clf();

subplot(2,1,1);
plot2d3(n_y, real(y));
plot(n_y, real(y),"r.");
xlabel("n");
title("Phan thuc cua y(n)");
xgrid();

subplot(2,1,2);
plot2d3(n_y, imag(y));
plot(n_y, imag(y), "r.");
xlabel("n");
title("Phan ao cua y(n)");
xgrid();
