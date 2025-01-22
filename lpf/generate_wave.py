import numpy as np

# Generate 100 samples of a sine wave
samples = 100
amplitude = 50
sine_wave = [int(amplitude * np.sin(2 * np.pi * i / samples)) for i in range(samples)]
print(sine_wave)
