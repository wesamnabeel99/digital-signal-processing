function hn = myimpz(num_z, den_z, n_samples)
% Compute impulse response of discrete-time filter using inverse Z transform

% Create test signal x (single impulse at n=0)
x = zeros(1, n_samples);
x(1) = 1;

% Compute impulse response h by inverse Z transform
h = myfilter(num_z, den_z, x);

% Normalize impulse response by dividing by h(1)
hn = h / h(1);
end
