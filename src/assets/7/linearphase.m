h = [0.1339, 0.1526, 0.1592, 0.1526, 0.1339];

[H, w] = freqz(h, 1, 1024);          % w in rad/sample, 0 to pi

figure;

subplot(2,1,1);
plot(w, abs(H), 'LineWidth', 2);
grid on;
xlabel('\omega (rad/sample)');
ylabel('|H(e^{j\omega})|');
title('Magnitude Response');
xlim([0 pi]);
xticks([0 pi/2 pi]);
xticklabels({'0', '\pi/2', '\pi'});

subplot(2,1,2);
plot(w, unwrap(angle(H)), 'LineWidth', 2);
grid on;
xlabel('\omega (rad/sample)');
ylabel('Phase (rad)');
title('Phase Response');
xlim([0 pi]);
xticks([0 pi/2 pi]);
xticklabels({'0', '\pi/2', '\pi'});
pause;
