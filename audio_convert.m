clear; clc;

% Load Noisy WAV File
[file, Fs] = audioread('TroubledMusic.wav'); 

% Convert to Mono if Stereo
if size(file, 2) == 2
    file = mean(file, 2); 
end

% Normalize to Q15 Fixed-Point Format
file_q15 = round(file * 32768);  

% Save as a Text File for VHDL
fid = fopen('audio_samples.txt', 'w');
fprintf(fid, '%d\n', file_q15);
fclose(fid);

% Plot the waveform for verification
figure;
plot(file_q15);
title('Noisy Audio Signal (Q15 Format)');
xlabel('Sample Index');
ylabel('Amplitude');

disp('Audio samples saved to audio_samples.txt');