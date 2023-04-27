function H = freqs_manual(b,a,w)
% Compute the frequency response H(s) of a continuous-time filter
% defined by coefficients b and a at the frequencies specified in w.
% Inputs:
%   b: numerator coefficients of the transfer function
%   a: denominator coefficients of the transfer function
%   w: frequency vector at which to compute the frequency response (in rad/sec)
% Output:
%   H: frequency response of the filter at the frequencies specified in w

N = length(w);
H = zeros(N,1);
for k = 1:N
    s = 1j * w(k);
    H(k) = polyval(b,s) / polyval(a,s);
end

end
