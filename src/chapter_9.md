# Chapter 9 - Statistical Filters

This chapter provides a short introduction to *statistical filters*.
The design of statistical filters is based on the theory of **random signals**.
A random discrete-time signal is a signal whose value at each index, \\(x[n]\\), is a *random variable*.
From probability theory, we know that a random variable takes values according to some distribution, such as the exponential or Gaussian distribution.
In statistical filter design, what we are concerned with is the *correlation* between the different values of the random signal.

As a brief introduction or recap, in general, a positive correlation between two values means that when one increases, the other tends to increase as well.
Similarly, when one decreases, the other tends to decrease too.
Negative correlation means the opposite: when one increases, the other tends to decrease, and vice versa.
In statistical filter design, we first identify the correlation between the values of a signal in terms of *auto-correlation* and *cross-correlation*.
To see how auto-correlation and cross-correlation arise in the design of statistical filters, consider the main objective in the design of such filters:

Consider a random signal as input, denoted by \\(x[n]\\).
There is also another random signal called the *desired signal*, denoted by \\(d[n]\\).
The objective of statistical filter design is to obtain the coefficients of an LCCDE such that when \\(x[n]\\) is used as the input of the LCCDE, the output of the filter becomes close to the desired signal \\(d[n]\\).
This is done primarily by minimizing the expected value of the squared error, where the error is the difference between the desired signal and the output of the filter.
Mathematically, if we define the error signal, \\(e[n]\\), as:

\\[
e[n] = d[n] - y[n]
\\]

The objective of statistical filter design is then to minimize:

\\[
E[e^2[n]]
\\]

Here, \\(E[\\cdot]\\) is the expectation operator, and obtaining the above expression requires knowledge of the joint distribution, that is, the probability distribution that describes how the values of the signals behave with respect to each other.
In practice, however, we use the finite data we collect to estimate this expression.
For now, though, assume we know the underlying statistics of the signals and their distributions.

Also note that the desired signal \\(d[n]\\), depending on the problem, can be assumed to be any random signal.
As a concrete example, assume that we have a system, such as an acoustic medium through which sound can propagate.
With some modeling assumptions[^1], we would like to find the "system coefficients" that describe the dynamics of the system.
[^1]: An assumption commonly made for such systems is that they are Linear and Time-Invariant (LTI).
This means that the *principle of superposition* holds for such systems, meaning that a linear combination of different inputs produces the same linear combination in the output.

For such a system, the input is a random signal that we pass through the system, and the output is the signal we collect from it.
For statistical filter design, we would then like to design a filter such that, when the input signal is given to the statistical filter, it produces the same output as we obtained from the system.
Therefore, the input signal \\(x[n]\\) is the signal we gave to the unknown system, and the desired signal \\(d[n]\\) here refers to the output we collected from the system.
The filter should produce a signal \\(y[n]\\) for the input \\(x[n]\\) that would be as close as possible to the desired signal \\(d[n]\\).

For the majority of statistical filter design problems, we restrict ourselves to designing FIR filters.
In this case, the output of the filter is computed as:

\\[
y[n] = \\sum_{i=0}^{L-1} w_i x[n-i]
\\]

where \\(w_i\\) are the weights we are trying to compute.
In vector form, \\(W=[w_0,w_1,\\ldots,w_{L-1}]^T\\) and \\(X[n]=[x[n],x[n-1],\\ldots,x[n-L+1]]^T\\), so that \\(y[n]=W^TX[n]\\).
With this assumption, the task of minimizing the expected value of the squared error becomes:

\\[
\\begin{aligned}
E[e^2[n]]
&= E[(d[n]-W^TX[n])^2] \\\\
&= E[d^2[n]]-2W^Tp+W^TRW
\\end{aligned}
\\]

where \\(R=E[X[n]X^T[n]]\\) and \\(p=E[X[n]d[n]]\\).

Expanding \\(R\\), each entry of the matrix is:

\\[
R_{ij}=E[x[n-i]x[n-j]],
\\quad i,j=0,1,\\ldots,L-1
\\]

This is called the auto-correlation matrix, and its entries represent the correlation between different values of the same random signal.

Similarly, expanding \\(p\\):

\\[
p_i=E[x[n-i]d[n]],
\\quad i=0,1,\\ldots,L-1
\\]

This is called the cross-correlation vector.
Its entries represent the correlation between values of two different signals.

Next, to find the set of coefficients \\(W\\) that minimizes the expected value of the squared error, we differentiate it with respect to the weights.
Doing so yields:

\\[
\\frac{\\partial E[e^2[n]]}{\\partial W}
=-2p+2RW=0
\\]

Hence, the optimal weights are computed as:

\\[
W^*=R^{-1}p
\\]

where \\(R^{-1}\\) is the inverse of the auto-correlation matrix \\(R\\), and \\(p\\) is the cross-correlation vector, provided \\(R\\) is invertible.
Such optimal solution is called the ***Wiener solution***.

## Some note about \\(R\\) and \\(p\\)

As we have seen, the entries of the matrices \\(R\\) and \\(p\\) contain expected values \\(E[...]\\).
Computing these terms, as we said in the previous subsection, requires knowledge of the statistical distributions of the random signals.
In practice, we often do not know them and merely have a finite amount of data from such signals.
To estimate these expressions using the data we collect, we then impose two assumptions in the statistical filter design problem:

(i) The signals are *jointly wide-sense stationary (WSS)*, meaning that their means are constant and their auto-correlation and cross-correlation depend only on the "lag", i.e., the difference between the two indices.

(ii) The process is *ergodic*, meaning that we can estimate the "true" expected value from a single realization of the collected data.

With these assumptions, the auto-correlation of a random signal, with lag \\(r=n_2-n_1\\), is estimated from \\(N\\) samples as:

\\[
R_{xx}[r]=E[x[n]x[n-r]]
\\approx\\frac{1}{N}\\sum_{n=r}^{N-1}x[n]x[n-r]
\\]

Similarly, the cross-correlation measures the correlation between two different signals, \\(d[n]\\) and \\(x[n]\\).
Again, with the WSS and ergodicity assumptions, we can estimate it as:

\\[
R_{dx}[r]=E[d[n]x[n-r]]
\\approx\\frac{1}{N}\\sum_{n=r}^{N-1}d[n]x[n-r]
\\]

Here, samples outside \\(0,\\ldots,N-1\\) are unavailable, and the \\(1/N\\) factor makes these the biased estimators.


## Wiener solution versus other statistical fitlers
The Wiener solution relies on inverting the matrix \\(R\\), which can be large in practice.
However, inverting that matrix and multiplying it by the vector \\(p\\) yields the optimal solution in "one shot".
If the statistics of the random signals are constantly changing, we should compute the Wiener solution iteratively on chunks of data, for instance, in fixed time intervals.

There are different algorithms to design statistical filters besides computing the Wiener solution.
A famous one is called the Least Mean Squares algorithm, or LMS for short.
In this method, we iteratively estimate the expected value of the squared error we defined earlier:

\\[
E[e^2[n]]
\\]

By single data points, that is:

\\[
E[e^2[n]] \\approx e^2[n] = (d[n]-W^TX[n])^2
\\]

This algorithm is a form of what is called an *adaptive filter*, because the solution is updated with every new sample, so the weights adapt over time and can track changes in the statistics of the signals.
If the statistics of the random signals stay constant, the LMS solution eventually converges to the Wiener solution.

There are a variety of statistical and adaptive algorithms, such as Newton-LMS and RLS.
Each algorithm has its own strengths and weaknesses, and there are tradeoffs that should be considered before choosing one.

## Obtaining statistical filters in LibreDSP
The following code demonstrates using the LibreDSP library to obtain Wiener filter that recovers the coefficients of an unknown filter.

```rust
use libredsp::filter_design::statistical::{LMS, wiener};
use libredsp::signal::Signal;

fn main() {
    let mut res = Vec::with_capacity(64);

    for _ in 0..64 {
        let u1: f64 = rand::random_range(0.0..1.0);
        let u2: f64 = rand::random_range(0.0..1.0);
        let z = (-2.0 * u1.ln()).sqrt() * (2.0 * std::f64::consts::PI * u2).cos();

        res.push(z);
    }

    let x = Signal::new(res);

    // d[n] = x[n] + 0.5x[n-1], with x[-1] = 0
    let mut d = vec![0.0; x.len()];

    for n in 0..x.len() {
        d[n] = x[n] + if n > 0 { 0.5 * x[n - 1] } else { 0.0 };
    }

    let d = Signal::new(d);

    let w = wiener(&x, &d, 2);

    assert!((w[0] - 1.0).abs() < 0.05, "w[0] = {}", w[0]);
    assert!((w[1] - 0.5).abs() < 0.05, "w[1] = {}", w[1]);
}
```
The code above passes the asserts successfully.
The above code retrives the output without any added noise, hence, it can be shown that Wiener solution gives the coefficients of the unknown filter exactly.