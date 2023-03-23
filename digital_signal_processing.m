clc
clear all

num_s = [1 0 2.68e8];
den_s = [1 0.42e4 2.68e8];

n_samples = 512;

f = (0:(n_samples-1)) / n_samples * 10000;
w = 2 * pi * f;

hs = freqs_manual(num_s,den_s,w);

figure(1)
subplot(4,1,1)
plot(w,abs(hs),"LineWidth",1)
xlabel('w (rad/sec)')
ylabel('Magnitude H(s)')
title('magnitude response of H(s)')
legend('H(s)')
grid on
axis tight

subplot(4,1,2)
plot(w,angle(hs),"LineWidth",1)
xlabel('w (rad/sec)')
ylabel('phase H(s)')
title('phase response of H(s)')
grid on
axis tight

num_z = [0.88 -0.35 0.88];
den_z = [1 -0.35 0.77];


[hz, samples] = freqz_manual(num_z,den_z,n_samples);
subplot(4,1,3)
plot(samples, abs(hz), 'o-')
xlabel('samples')
ylabel('Magnitude H(z)')
title('magnitude response of H(z)')
legend('H(z)')
grid on
axis tight

subplot(4,1,4)
plot(samples,angle(hz)*180/pi,'o-');
xlabel('samples')
ylabel('phase H(z)')
title('phase response of H(z)')
grid on
axis tight

hn = myimpz(num_z, den_z, n_samples);
Hk = myfft(hn);

figure(2)

subplot(2,1,1)
plot(f,abs(Hk) / max(abs(Hk)))
xlabel('f(Hz)')
ylabel('Magnitude H(K)')
title('magnitude response of H(K)')
legend('H(K)')
grid on
axis tight

subplot(2,1,2)
plot(f,angle(Hk));
xlabel('f(Hz)')
ylabel('phase H(K)')
title('phase response of H(K)')
grid on
axis tight


figure(3)

subplot(2,1,1)
plot(f,abs(Hk)/max(abs(Hk)),f,abs(hs))
xlabel('f(Hz)')
ylabel('Magnitude H(K), H(S)')
title('H(K) Vs H(S)')
legend('H(K)','H(S)')
grid on
axis tight
