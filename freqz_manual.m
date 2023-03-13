
function [H,samples] = freqz_manual(b,a,N)
% Compute the frequency response H(e^(j*w)) of a discrete-time filter
% defined by coefficients b and a using the FFT method.
% Inputs:
%   b: numerator coefficients of the transfer function
%   a: denominator coefficients of the transfer function
%   N: number of frequency samples to compute
% Output:
%   H: frequency response of the filter at the N equally spaced frequencies
%   samples: frequency vector corresponding to the FFT bins

M = max(length(b),length(a));
x = [b zeros(1,N-M)];
y = [a zeros(1,N-M)];
X = myfft(x);
Y = myfft(y);
H = X./Y;
samples = (0:N-1)/N*2*pi;

end
