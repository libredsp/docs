% Ideal (brickwall) lowpass filter: magnitude response
wc = 0.4*pi;                         % cutoff frequency (rad/sample)
w  = linspace(0, pi, 1000);
H  = double(w <= wc);                % 1 in passband, 0 in stopband

figure;
plot(w, H, 'LineWidth', 2);
grid on;
xlabel('\omega (rad/sample)');
ylabel('|H(e^{j\omega})|');
title('Ideal Lowpass (Brickwall) Filter');
ylim([-0.1 1.2]);
xlim([0 pi]);
xticks([0 pi/2 pi]);
xticklabels({'0', '\pi/2', '\pi'});
pause;
