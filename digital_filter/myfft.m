function X = myfft(x)
% Compute the discrete Fourier transform of a signal x using the radix-2
% Cooley-Tukey algorithm.



N = length(x);

if N == 1
    % Base case of recursion
    X = x;
else
    % Divide the signal into even and odd indices
    x_even = x(1:2:N);
    x_odd = x(2:2:N);
    
    % Recursively compute the DFT of each half
    X_even = myfft(x_even);
    X_odd = myfft(x_odd);
    
    % Combine the two halves
    n = 0:N-1;
    W_N = exp(-1i*2*pi/N*n);
    X = [X_even + W_N(1:N/2).*X_odd, X_even + W_N(N/2+1:N).*X_odd];
end

end
