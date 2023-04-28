clear all
clc

% Define the desired signal d(n) and the input signal x(n)
d = [1 2 -2 2];
x = [0.5 1 -1 1];

% Initialize the adaptive filter coefficients with zeros
w = 0;

% Set the learning rate
mu = 0.5;

% Initialize the output signal y and the error signal e
y = zeros(size(d));
e = zeros(size(d));

% Iterate over the samples of the input signal
for iteration = 1:2
    for n = 1:length(x)
        
        % Compute the filter output y(n) as the dot product of w and x
        y(n) = w * x(n);
    
        % Compute the error signal e(n) as the difference between d(n) and y(n)
        e(n) = d(n) - y(n);
        
        % Update the filter coefficients using the LMS algorithm
        w = w + 2 * mu * e(n) * x(n);
        
    end
end

% Plot the results
figure;
subplot(3,1,1);stem(d);title('Desired signal');xlabel('Sample index');ylabel('Amplitude');
subplot(3,1,2);stem(y);title('Filter output signal');xlabel('Sample index');ylabel('Amplitude');
subplot(3,1,3);stem(e);title('Error signal');xlabel('Sample index');ylabel('Amplitude');

% Print the final filter coefficients
disp('Final filter coefficients:');
disp(w);
