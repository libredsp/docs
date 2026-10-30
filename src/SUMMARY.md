# Introduction

This repo provides a general information about Digital Signal Processing (DSP) alongside a general guide on how to use the LibreDSP library.

Digital Signal Processing (DSP) is the study of techniques and algorithms used to analyze, transform, and synthesize ***discrete-time signals***.
A discrete-time signal is simply a sequence of numbers, and each individual number is called a ***sample***.
An example of a discrete-time signal is the temperature data captured by a microcontroller from a sensor every \\(T\\) seconds.
Another example of a discrete-time signal is audio sampled and stored as a WAV file.
In DSP, we apply a wide range of algorithm and techniques on these sampled values.
Generally, these methods can be categorized into two major categories.
One is the transform and operations based on the theory of what's called the **Fourier Analysis**.
The second type which is called the **statistical DSP**, deals with algorithms for random signals.
Random signal, in contrast to deterministic signals, are the ones that are not known in advanced and can have different values upon realization.
The chapters below provide the general theory behind the common DSP algorithms and discuss how they can be applied via the LibreDSP library.

- [Chapter 1: Introduction](./SUMMARY.md)
- [Chapter 2: Complex Numbers & Euler's Formula](./chapter_2.md)
- [Chapter 3: Discrete Fourier Series (DFS) & Discrete Fourier Transform (DFT)](./chapter_3.md)
- [Chapter 4: Fast Fourier Transform (FFT)](./chapter_4.md)
- [Chapter 5: Discrete-Time Fourier Transform (DTFT)](./chapter_5.md)
- [Chapter 6: Z-Transform & Frequency-Selective Digital Filters](./chapter_6.md)
- [Chapter 7: Digital Filter Design](./chapter_7.md)
- [Chapter 8: TBD]()

## License
This document is licensed under Creative Commons Attribution-ShareAlike 4.0 International.
Visit the LICENSE file in the repo for more info.
