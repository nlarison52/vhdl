% FIR Low-Pass Filter Design for FPGA

clear; clc;

% -------------------- FILTER SPECS --------------------
Fs = 48000;     % Sampling frequency (Hz) - Adjust as needed
Fc = 5000;      % Cutoff frequency (Hz) - Adjust as needed
N = 63;         % Filter order (Higher = sharper roll-off, more resources)

% -------------------- DESIGN THE FILTER --------------------
b = fir1(N-1, Fc/(Fs/2), 'low', hamming(N)); % Hamming window for smooth response

% Scale Coefficients for Fixed-Point Representation (Q15 Format)
b_fixed = round(b * 32768); % Scale to Q15 (-32768 to +32767)

% -------------------- DISPLAY RESULTS --------------------
disp('Filter Coefficients (Q15 Fixed-Point):');
disp(b_fixed);

% -------------------- EXPORT COEFFICIENTS FOR VHDL --------------------
fid = fopen('filter_coefficients.txt', 'w');
fprintf(fid, '%d\n', b_fixed);
fclose(fid);

% -------------------- PLOT THE FILTER RESPONSE --------------------
figure;
freqz(b,1,1024,Fs);
title('Frequency Response of FIR Low-Pass Filter');

figure;
stem(b_fixed);
title('FIR Filter Coefficients (Q15 Fixed-Point)');
xlabel('Tap Number');
ylabel('Coefficient Value');

%%
% Convert coefficients to VHDL format
fid = fopen('filter_rom.vhd', 'w');
fprintf(fid, 'type coeff_array is array (0 to %d) of integer;\n', N-1);
fprintf(fid, 'constant filter_coeff : coeff_array := (\n');

for i = 1:N
    if i == N
        fprintf(fid, '    %d);\n', b_fixed(i));
    else
        fprintf(fid, '    %d,\n', b_fixed(i));
    end
end

fclose(fid);
disp('VHDL coefficient file generated: filter_rom.vhd');