# Wave Equations
The Exact Solution and Numerical Methods for Solving Hyperbolic Equations (Linear and Nonlinear Wave Equations)

For the numerical solution of the 1D Inviscid Burgers' equation, explicit methods such as Lax, Upwind Differencing, and Lax-Wendroff, as well as the implicit Beam-Warming method, have been employed.

#### 1D Inviscid Burgers' equation
$$ \( \frac{\partial u}{\partial t} + \frac{\partial F}{\partial x} = 0 \) $$

Linear 

$$ \( F = cu \) → \( \frac{\partial u}{\partial t} + c \frac{\partial u}{\partial x} = 0 \) $$

Nonlinear 

$$ \( F = \frac{u^2}{2} \) → \( \frac{\partial u}{\partial t} + u \frac{\partial u}{\partial x} = 0 \) $$  

##### CFL 

In general, it is recommended to keep the Courant number (CFL) below 1, in order to assure the stability of the numerical schemes and accuracy of the solution.

The explicit methods have a stability condition of $$\( CFL ≤ 1 \)$$, while for implicit method, an appropriate time step must be selected.

Linear

$$ CFL = c \left( \frac{\Delta t}{\Delta x} \right) \rightarrow c = 1.0 \rightarrow \Delta t = \frac{CFL \cdot (\Delta x)}{c} $$

Nonlinear

$$ \text{CFL} = u \, \text{max} \left( \frac{\Delta t}{\Delta x} \right) \rightarrow u \, \text{max} = 1.0 \rightarrow \Delta t = \frac{\text{CFL} \, (\Delta x)}{u \, \text{max}} $$

##### Grid Generation

$$ \Delta x= \frac{L}{n-1} \rightarrow  x(i)=(i-1) \Delta x $$

##### Boundary Conditions

$$ u(0,t) = 1 $$
$$ u(n,t) = 2 u(n-1,t) - u(n-2,t) $$

## Results

### Linear Equation

![CWMHY6ghStS9BNUS1LWPVfHe](https://github.com/user-attachments/assets/e79e3507-9e8d-4bec-ac1a-5b6c2d9b1465)

### Nonlinear Equation

![138tr9X1AKbBCgPBW1UMRE27](https://github.com/user-attachments/assets/a3becc73-ea9e-423f-b6a3-7bc547f3ae2b)
