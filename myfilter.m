function y = myfilter(b, a, x)
% This function implements the filter function in MATLAB
% Inputs:
%   b - the numerator coefficients of the filter
%   a - the denominator coefficients of the filter
%   x - the input signal to be filtered
% Outputs:
%   y - the filtered output signal

% Initialize the output vector y with zeros
y = zeros(size(x));

% Get the lengths of the numerator and denominator coefficient vectors
nb = length(b);
na = length(a);

% Iterate over each sample in the input signal
for n = 1:length(x)
    % Compute the current output sample y(n) using the difference equation
    y(n) = b(1)*x(n);
    for k = 2:nb
        if n-k+1 > 0
            y(n) = y(n) + b(k)*x(n-k+1);
        end
    end
    for k = 2:na
        if n-k+1 > 0
            y(n) = y(n) - a(k)*y(n-k+1);
        end
    end
end
end