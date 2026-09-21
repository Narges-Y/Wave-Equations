# Wave Equations
The Exact Solution and Numerical Methods for Solving Hyperbolic Equations (Linear and Nonlinear Wave Equations)

For the numerical solution of the 1D Inviscid Burgers' equation, explicit methods such as Lax, Upwind Differencing, and Lax-Wendroff, as well as the implicit Beam-Warming method, have been employed.

# 1D Inviscid Burgers' Equation

The one-dimensional inviscid Burgers' equation is written in conservative form as

$$
\frac{\partial u}{\partial t}
+
\frac{\partial F}{\partial x}
= 0
$$

## Linear Case

For a linear flux function,

$$
F = cu
$$

the governing equation becomes

$$
\frac{\partial u}{\partial t}
+
c\frac{\partial u}{\partial x}
= 0
$$

## Nonlinear Case

For the nonlinear Burgers' flux,

$$
F = \frac{u^2}{2}
$$

the governing equation becomes

$$
\frac{\partial u}{\partial t}
+
u\frac{\partial u}{\partial x}
= 0
$$

---

# CFL Condition

In general, it is recommended to keep the Courant number (CFL) below 1 in order to ensure the stability of the numerical schemes and the accuracy of the solution.

For explicit methods, the stability condition is

$$
\mathrm{CFL} \leq 1
$$

For implicit methods, an appropriate time step should still be selected to maintain the desired accuracy.

## Linear Case

The CFL number is defined as

$$
\mathrm{CFL}
=
c\left(\frac{\Delta t}{\Delta x}\right)
$$

For

$$
c = 1.0
$$

the time step is calculated as

$$
\Delta t
=
\frac{\mathrm{CFL}\,\Delta x}{c}
$$

## Nonlinear Case

For the nonlinear Burgers' equation, the CFL number is

$$
\mathrm{CFL}
=
u_{\max}
\left(
\frac{\Delta t}{\Delta x}
\right)
$$

For

$$
u_{\max} = 1.0
$$

the time step is calculated as

$$
\Delta t
=
\frac{\mathrm{CFL}\,\Delta x}{u_{\max}}
$$

---

# Grid Generation

For a one-dimensional domain of length $L$ with $n$ grid points, the spatial grid size is

$$
\Delta x
=
\frac{L}{n-1}
$$

and the grid points are defined as

$$
x(i)
=
(i-1)\Delta x
$$

---

# Boundary Conditions

The boundary conditions are defined as

$$
u(0,t) = 1
$$

and

$$
u(n,t)
=
2u(n-1,t)
-
u(n-2,t)
$$

## Results

### Linear Equation

![CWMHY6ghStS9BNUS1LWPVfHe](https://github.com/user-attachments/assets/e79e3507-9e8d-4bec-ac1a-5b6c2d9b1465)

### Nonlinear Equation

![138tr9X1AKbBCgPBW1UMRE27](https://github.com/user-attachments/assets/a3becc73-ea9e-423f-b6a3-7bc547f3ae2b)
