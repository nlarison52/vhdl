[b, a] = butter(1, 0.2); % Generate Butterworth filter coefficients
b = round(b * 128);      % Scale feedforward coefficients
a = round(a * 128);      % Scale feedback coefficients
