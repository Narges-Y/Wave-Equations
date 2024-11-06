# Wave Equations
The Exact Solution and Numerical Methods for Solving Hyperbolic Equations (Linear and Nonlinear Wave Equations)

For the numerical solution of the 1D Inviscid Burgers' equation, explicit methods such as Lax, Upwind Differencing, and Lax-Wendroff, as well as the implicit Beam-Warming method, have been employed.

#### 1D Inviscid Burgers' equation
$$ \( \frac{\partial u}{\partial t} + \frac{\partial F}{\partial x} = 0 \) $$

Linear 

$$ \( F = cu \) → \( \frac{\partial u}{\partial t} + c \frac{\partial u}{\partial x} = 0 \) $$

Nonlinear 

$$ \( F = \frac{u^2}{2} \) → \( \frac{\partial u}{\partial t} + u \frac{\partial u}{\partial x} = 0 \) $$  

In general, it is recommended to keep the Courant number (CFL) below 1 in order to assure the stability of the numerical schemes and accuracy of the solution.

The explicit methods have a stability condition of $$\( CFL =< 1 \)$$, while for implicit method, an appropriate time step must be selected.
