# Discrete Fourier Series (DFS) & Discrete Fourier Transform (DFT) 
In this chapter we will discuss Discrete Fourier Series (DFS) and its usage which is to decompose a discrete-time signals in terms of complex exponentials.
Afterwards, we will see a closely related operation called the Discrete Fourier Transform (DFT).
As we will see, the computations performed for DFS is, in fact, identical to DFT and their difference is merely the interpretation of the results. 

Consider a *periodic* discrete-time signal \\(x[n]\\) with period \\(N_0\\). That means

\\[
x[n+N_0]=x[n].
\\]

Where \\(N_0\\) is an integer. 
We can rewrite such signals as sums of complex exponentials:
\\[
\boxed{x[n]=\sum_{k=0}^{N_0-1}a_ke^{jk\omega_0n}, \qquad \omega_0=\frac{2\pi}{N_0}}.
\\]

This is called the **Discrete Fourier Series (DFS)** expansion of the signal \\(x[n]\\).
Expanding the sum gives us \\(N_0\\) equations with \\(N_0\\) unknowns. In matrix notation, we have \\(Ax=b\\), where \\(A\\) is a matrix consisting of complex exponential terms, \\(x\\) is a vector containing the unknown coefficients that we are trying to find, and \\(b\\) contains the values of the signal at different samples.
In other words, DFS is merely a system of \\(N\\) equation and \\(N\\) unknowns.

### Can we apply standard Gaussian elimination to solve such systems?

The answer is yes.
Complex numbers form a field, and Gaussian elimination works on any matrix whose entries belong to a field.
Hence, it can be used to solve \\(Ax=b\\).

Even though Gaussian elimination gives us a method for computing the DFS coefficients, in practice we exploit a special property of the matrix \\(A\\) and compute the coefficients using the closed-form formula:
\\[
a_k=\frac{1}{N_0}\sum_{n=0}^{N_0-1}x[n]e^{-jk\omega_0n}, \qquad \omega_0=\frac{2\pi}{N_0}.
\\]

As an example, suppose we want to compute the DFS coefficients of the periodic signal \\(x[0]=2\\), \\(x[1]=1\\), \\(x[2]=3\\), and \\(x[3]=3\\) (with \\(x[n]=x[n \bmod 4]\\)).

\\[
k=0 \rightarrow e^{j2\pi(n)(0)/4} = 1,1,1,1 \rightarrow a_0=\frac{1}{4}(2+1+3+3)=\frac{9}{4}
\\]

\\[
k=1 \rightarrow e^{j2\pi(n)(1)/4} = 1,-j,-1,j \rightarrow a_1=\frac{1}{4}(2-j-3+3j) = -\frac{1}{4}+j\frac{1}{2}
\\]

\\[
k=2 \rightarrow e^{j2\pi(n)(2)/4} = 1,-1,1,-1 \rightarrow a_2=\frac{1}{4}(2-1+3-3) = \frac{1}{4}
\\]

\\[
k=3 \rightarrow e^{j2\pi(n)(3)/4} = 1,j,-1,-j \rightarrow a_3=\frac{1}{4}(2+j-3-3j) = -\frac{1}{4}-j\frac{1}{2}
\\]

An interesting observation is that, after expanding the signal in terms of complex exponentials, we obtain

\\[
x[n] = \frac{9}{4}e^{j2\pi(0)n/4} + \left(-\frac{1}{4}+j\frac{1}{2}\right)e^{j2\pi n/4} + \frac{1}{4}e^{j4\pi n/4} + \left(-\frac{1}{4}-j\frac{1}{2}\right)e^{j6\pi n/4}
\\]

\\[
= \frac{9}{4}e^{j2\pi(0)n/4} + \left(-\frac{1}{4}+j\frac{1}{2}\right)e^{j2\pi n/4} + \left(-\frac{1}{4}-j\frac{1}{2}\right)e^{-j2\pi n/4} + \frac{1}{4}e^{j\pi n}
\\]

\\[
= \frac{9}{4} - \frac{1}{2}\cos\left(\frac{\pi n}{2}\right) - \sin\left(\frac{\pi n}{2}\right) + \frac{1}{4}\cos(\pi n)
\\]

By rearranging the terms, we expressed the signal as a sum of harmonically related *real-valued* sines and cosines.

> **Note 1:** In general, for any **real-valued** signal, the DFS coefficients satisfy
> \\[
> \boxed{a_{N-k}=a_k^{\ast}},
> \\]
> where \\(N\\) is the period and the operator \\(^{\ast}\\) denotes complex conjugation.
> As a consequence, we can pair the \\(k\\) and \\(N-k\\) terms together to obtain real-valued sinusoids.

> **Note 2:** The DFS we discussed assumes that we have a periodic function, and the coefficients of DFS allow us to decompose that periodic function as a sum of complex exponentials.
> An identical operation to DFS is called the ***Discrete Fourier Transform (DFT)***.
> DFT has exactly the same formulas as DFS, but there, we assume that we are decomposing a *finite-length* signal by complex exponentials.
> Otherwise, all the mathematics is the same.
> In other words, we can treat the finite-length signal as one period of a periodic function, and in that case DFS and DFT become identical.

In the next chapter, we will discuss an algorithm called the Fast Fourier Transform (FFT) which efficiently computes the DFS or DFT coefficients, as well as reconstructs signals using those coefficients.