function y = myfilter(b, a, x)
% Apply a digital filter defined by coefficients b and a to a discrete-time signal x

N = length(x);  % number of input samples
M = max(length(b), length(a));  % filter order
d = [zeros(1,M-1) x];  % delay line (initially all zeros)
y = zeros(1,N);  % output signal

for n = 1:N
    % Compute current output sample y(n) using difference equation
    y(n) = b(1)*d(n+M-1) + b(2)*d(n+M-2);
    for k = 3:length(b)
        y(n) = y(n) + b(k)*d(n+M-k);
    end
    for k = 2:length(a)
        if n+M-k > 0 && n+M-k <= N
            y(n) = y(n) - a(k)*y(n+M-k);
        end
    end

    % Shift delay line
    d = [d(2:end) x(n)];
end

end
