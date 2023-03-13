function y = myfft(x)
% Compute the N-point FFT of x using the Cooley-Tukey algorithm
% where N is the length of x and N is a power of 2.

N = length(x);

if N == 1
    % Base case
    y = x;
else
    % Recursive case
    X = reshape(x, 2, N/2);
    x_even = X(1,:);
    x_odd = X(2,:);
    y_even = myfft(x_even);
    y_odd = myfft(x_odd);
    W_N = exp(-2i*pi/N).^(0:N/2-1);
    y_top = y_even + W_N.*y_odd;
    y_bottom = y_even - W_N.*y_odd;
    y = [y_top, y_bottom];
end