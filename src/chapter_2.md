# Complex Numbers & Euler's Formula
Many mathematical operations performed in DSP involve complex number.
In this chapter, provides a general overview about these numbers and their connection to what's known as complex exponentials.

A complex number is a number that has the general form
\\[
a + bj
\\]
where \\(a\\) and \\(b\\) are arbitrary real-valued numbers and \\(j=\sqrt{-1}\\).

An important property of complex numbers is that they form a *field*. This means that they obey all the familiar rules such as associativity, commutativity, distributivity, and so on, which real numbers also obey.
For instance, the following expression is valid for complex numbers:
\\[
z_1(z_2 + z_3) = z_1z_2 + z_1z_3
\\]
where \\(z_1\\), \\(z_2\\), and \\(z_3\\) are complex-valued numbers. This is an application of the distributive law.

When dealing with complex numbers, a term that frequently comes up is the *complex conjugate*.
A complex number is a complex conjugate of another complex number if their real parts are the same and their imaginary parts have opposite signs.
For instance, numbers \\(z_1 = 2 + 3j\\) and \\(z_2 = 2 - 3j\\) are the complex conjugates of each other.
Moreover, to show a number is complex conjugate of another number we often use the star symbol.
For example, we write \\(z_1 = z_2^{\star}\\).

What we've seen so far are complex numbers. We also have *complex exponentials*. These are expressions of the form \\(e^{j\theta}\\), where \\(e\\) is Euler's constant, \\(j=\sqrt{-1}\\), and \\(\theta\\) is any real-valued number.

Complex exponentials are related to trigonometric functions via *Euler's formula*. This formula is stated below:
\\[
e^{j\theta} = \cos(\theta) + j\sin(\theta)
\\]
Where does this formula come from?
In one view, Euler's formula can simply be taken as a *definition* of what it means to raise \\(e\\) to the power \\(j\theta\\). In another approach, we first define what it means to raise \\(e\\) to a general complex number \\(z\\):
\\[
e^{z} = \sum_{n=0}^{\infty} \frac{z^n}{n!} = 1 + z + \frac{z^2}{2!} + \frac{z^3}{3!} + \cdots
\\]
Substituting \\(z=j\theta\\) yields Euler's formula. Either way, we arrive at the same result.

But the question that still remains is: how does this relationship (whether defined or derived) help us?

The answer is that almost all of the familiar rules for *real exponentials* also hold for complex exponentials. For instance,
\\[
e^{j(a+b)} = e^{ja}e^{jb}.
\\]

To prove this, we can rewrite the left-hand side using Euler's formula, apply trigonometric identities, and then use Euler's formula again to obtain the right-hand side.

Differentiation also carries over from real exponentials to complex exponentials. Specifically,
\\[
\frac{d}{dx}e^{jx}=je^{jx}.
\\]

Proof:

\\[
\frac{d}{dx}e^{jx} = \frac{d}{dx}(\cos x+j\sin x) = -\sin x+j\cos x = je^{jx}.
\\]

Euler's formula is used extensively in signal processing because it often gives us a shortcut when computing different transforms. More importantly, it allows us to relate certain transforms to other ones, such as the Discrete-time Fourier Transform (DTFT) to the Z-transform, or the Continuous-time Fourier Transform (CTFT) to the Laplace transform.
