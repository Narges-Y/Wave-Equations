# Wave Equations
The Exact Solution and Numerical Methods for Solving Hyperbolic Equations (Linear and Nonlinear Wave Equations)

For the numerical solution of the 1D Inviscid Burgers' equation, explicit methods such as Lax, Upwind Differencing, and Lax-Wendroff, as well as the implicit Beam-Warming method, have been employed.

### 1D Inviscid Burgers' equation
$$ \( \frac{\partial u}{\partial t} + \frac{\partial F}{\partial x} = 0 \) $$

$$ \( F = cu \)  --->  \( \frac{\partial u}{\partial t} + c \frac{\partial u}{\partial x} = 0 \) $$   (Linear)

$$ \( F = \frac{u^2}{2} \)  --->  \( \frac{\partial u}{\partial t} + u \frac{\partial u}{\partial x} = 0 \) $$   (Nonlinear)
