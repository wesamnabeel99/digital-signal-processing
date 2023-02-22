clc
clear all

num_s = [1 0 2.68e8];
den_s = [1 0.42e4 2.68e8];


f = (0:511) / 512 * 10000;
w = 2 * pi * f;

hs = freqs(num_s,den_s,w);

figure(1)
subplot(4,1,1)
plot(w,abs(hs))
xlabel('w (rad/sec)')
ylabel('Magnitude H(s)')
title('Frequency response of H(s)')
legend('H(s)')
grid on
axis tight

subplot(4,1,2)
plot(w,angle(hs))
xlabel('w (rad/sec)')
ylabel('Angle H(s)')
title('Frequency response of H(s)')
grid on
axis tight

num_z = [0.88 -0.35 0.88];
den_z = [1 -0.35 0.77];


n_samples = 512;
[hz, samples] = freqz(num_z,den_z,n_samples);
subplot(4,1,3)
plot(samples,20*log10(abs(hz)))
xlabel('samples')
ylabel('Magnitude H(z)')
title('Frequency response of H(z)')
legend('H(z)')
grid on
axis tight

subplot(4,1,4)
plot(samples,angle(hz)*180/pi);
xlabel('samples')
ylabel('Angle H(z)')
title('Frequency response of H(z)')
grid on
axis tight

hn = impz(num_z, den_z, n_samples);
Hk = fft(hn);

figure(2)

subplot(2,1,1)
plot(f,abs(Hk))
xlabel('samples')
ylabel('Magnitude H(K)')
title('Frequency response of H(K)')
legend('H(K)')
grid on
axis tight

subplot(2,1,2)
plot(f,unwrap(angle(Hk)));
xlabel('samples')
ylabel('Angle H(K)')
title('Frequency response of H(K)')
grid on
axis tight


figure(3)

subplot(2,1,1)
plot(f,abs(Hk),f,abs(hs))
xlabel('samples')
ylabel('Magnitude H(K), H(S)')
title('H(K) Vs H(S)')
legend('H(K)','H(S)')
grid on
axis tight


