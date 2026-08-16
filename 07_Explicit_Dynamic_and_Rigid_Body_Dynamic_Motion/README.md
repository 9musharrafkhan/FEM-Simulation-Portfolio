# 07_Explicit_Dynamics_and_Rigid_Body_Dynamic_Motion

# Explicit Dynamics and Rigid Body Dynamic Motion using ANSYS Mechanical

---

# Overview

This project presents the fundamentals of **Explicit Dynamic Analysis** and **Rigid Body Dynamic Motion**, with emphasis on the differences between static, transient/implicit, and explicit structural analysis.

The analysis concepts are based on the attached reference figures, which explain:

- Static structural analysis
- Transient structural analysis
- Explicit dynamics
- Linear and nonlinear structural behavior
- Geometric nonlinearity
- Material nonlinearity
- Boundary-condition/contact nonlinearity
- Time-dependent loading
- Implicit versus explicit solution procedures
- Dynamic response and inertia effects
- Rigid-body translational and rotational motion

Explicit dynamics is particularly suitable for highly transient events in which inertia, contact, impact, large deformation, and rapidly changing loads are important.

The governing structural dynamic equation is:

```math
[M]\{\ddot{u}\}+[C]\{\dot{u}\}+[K]\{u\}=\{F(t)\}
```

where:

- `[M]` = mass matrix
- `[C]` = damping matrix
- `[K]` = stiffness matrix
- `{u}` = displacement vector
- `{dot u}` = velocity vector
- `{ddot u}` = acceleration vector
- `{F(t)}` = time-dependent external force

The first attached figure introduces the distinction between static structural analysis, transient structural analysis, and explicit dynamics.

**Figure 1 – Static, transient and explicit structural analysis concepts**

![Figure 1 – Static, transient and explicit structural analysis](figures/01_static_transient_explicit.png)

---

# Problem Statement

Structural systems may experience loads that vary rapidly with time. When the loading time is sufficiently short, the acceleration and inertia effects can no longer be neglected.

Examples include:

- Impact
- Crash events
- Drop tests
- Ballistic events
- High-speed forming
- Short-duration contact
- Collision problems
- Large-deformation structural events

The attached reference material explains that dynamic problems are solved by dividing the analysis time into a sequence of time increments. At each increment, the structural state is advanced in time.

For dynamic problems:

```math
[M]\{\ddot{u}\}+[C]\{\dot{u}\}+[K]\{u\}=\{F(t)\}
```

For a static problem, inertia and damping effects are neglected:

```math
[K]\{u\}=\{F\}
```

For a nonlinear static problem, the stiffness depends on the current structural state:

```math
[K(u)]\{u\}=\{F\}
```

These equations are consistent with the matrix-equation comparison shown in the attached reference figure.

**Figure 2 – Matrix equations for linear, nonlinear static and dynamic problems**

![Figure 2 – Matrix equations](figures/02_matrix_equations.png)

---

# Objectives

The objectives of this project are to:

- Understand the fundamentals of explicit dynamic analysis.
- Distinguish explicit dynamics from static and implicit transient analysis.
- Understand the role of inertia in dynamic problems.
- Formulate the governing equation of structural dynamics.
- Understand geometric, material and boundary/contact nonlinearities.
- Develop the central-difference time-integration formulation.
- Understand the explicit stability condition.
- Understand the role of the mass matrix in an explicit solver.
- Study translational rigid-body motion.
- Study rotational rigid-body motion.
- Formulate rigid-body equations of motion.
- Understand contact and impact between rigid and deformable bodies.
- Understand energy conservation and energy transfer during dynamic motion.
- Interpret the appropriate application range of explicit dynamics.

---

# Static, Transient and Explicit Dynamics

## Static Structural Analysis

Static structural analysis is used when loads are constant or vary sufficiently slowly that inertia effects can be neglected.

The governing equation is:

```math
[K]\{u\}=\{F\}
```

The primary quantities of interest are:

- Displacement
- Stress
- Strain
- Reaction force

The attached reference figure describes static analysis as an analysis in which loads do not change with respect to time, or change very slowly.

**Figure 3 – Static structural analysis concept**

![Figure 3 – Static structural analysis](figures/03_static_structural_analysis.png)

---

## Transient Structural Analysis

Transient structural analysis considers the response of a structure as a function of time.

The governing equation is:

```math
[M]\{\ddot{u}\}+[C]\{\dot{u}\}+[K]\{u\}=\{F(t)\}
```

Transient analysis is appropriate when the loading varies with time and the dynamic response is important.

The attached figures emphasize that the analysis time is divided into increments and the structural state is evaluated at successive time points.

---

## Explicit Dynamics

Explicit dynamics solves the dynamic equilibrium equations directly in time using an explicit time-integration scheme.

The key feature is that the acceleration at the current time can be used to advance the solution to the next time level without solving a global nonlinear equilibrium equation at every increment.

The explicit method is particularly attractive for short-duration, highly nonlinear events.

**Figure 4 – Implicit versus explicit solving methods**

![Figure 4 – Implicit versus explicit methods](figures/04_implicit_vs_explicit.png)

---

# Types of Nonlinearity

The attached reference material identifies three major sources of structural nonlinearity.

## 1. Geometric Nonlinearity

Geometric nonlinearity occurs when deformation or rotation is sufficiently large that the structural geometry and stiffness change during the analysis.

Important effects include:

- Large deformation
- Large rotation
- Change in structural configuration
- Stress stiffening
- Membrane effects
- Spin-softening effects in rotating systems

For geometrically nonlinear problems, the relationship between displacement, strain and stress cannot generally be treated using small-deformation assumptions.

A general nonlinear equilibrium equation can be written as:

```math
\mathbf{R}(\mathbf{u},t)=\mathbf{F}_{ext}(t)-\mathbf{F}_{int}(\mathbf{u},t)=\mathbf{0}
```

where:

- `F_ext` = external force vector
- `F_int` = internal force vector
- `R` = residual vector

**Figure 5 – Geometric nonlinearity**

![Figure 5 – Geometric nonlinearity](figures/05_geometric_nonlinearity.png)

---

## 2. Material Nonlinearity

Material nonlinearity occurs when the constitutive relationship between stress and strain is nonlinear.

Examples include:

- Plasticity
- Hyperelasticity
- Viscoelasticity
- Damage
- Temperature-dependent material behavior

For a general nonlinear material:

```math
\boldsymbol{\sigma}=\boldsymbol{\sigma}(\boldsymbol{\varepsilon},\dot{\boldsymbol{\varepsilon}},T,\ldots)
```

For linear elastic material behavior:

```math
\boldsymbol{\sigma}=\mathbf{D}\boldsymbol{\varepsilon}
```

where `D` is the constitutive/material stiffness matrix.

---

## 3. Boundary-Condition and Contact Nonlinearity

Nonlinearity can also originate from changing boundary conditions and contact.

Examples include:

- Opening and closing contact
- Sliding contact
- Separation
- Impact
- Friction
- Changing load-transfer paths

For contact, the normal gap must satisfy a non-penetration condition:

```math
g_n \geq 0
```

with the compressive contact condition:

```math
p_n \geq 0
```

and the complementarity condition:

```math
g_n p_n=0
```

where:

- `g_n` = normal gap
- `p_n` = normal contact pressure

A frictional contact condition may be represented by:

```math
|\mathbf{t}_t|\leq\mu p_n
```

where:

- `t_t` = tangential contact traction
- `μ` = coefficient of friction

---

# Governing Equations of Structural Dynamics

The continuous equation of motion for a structure is:

```math
\rho\frac{\partial^2\mathbf{u}}{\partial t^2}
-\nabla\cdot\boldsymbol{\sigma}
=\mathbf{b}
```

where:

- `rho` = material density
- `u` = displacement field
- `sigma` = Cauchy stress tensor
- `b` = body-force vector

With appropriate boundary conditions and finite-element discretization, the equation becomes:

```math
[M]\{\ddot{u}\}+[C]\{\dot{u}\}+\{F_int(u)\}=\{F_ext(t)\}
```

For a linear system:

```math
[M]\{\ddot{u}\}+[C]\{\dot{u}\}+[K]\{u\}=\{F(t)\}
```

For a nonlinear system:

```math
[M]\{\ddot{u}\}+[C]\{\dot{u}\}+\{F_int(u)\}=\{F_ext(t)\}
```

The nonlinear internal-force vector depends on the current configuration and material state.

---

# Finite Element Formulation

The displacement field is approximated using shape functions:

```math
\mathbf{u}(\mathbf{x},t)=\mathbf{N}(\mathbf{x})\mathbf{d}(t)
```

where:

- `N` = shape-function matrix
- `d` = nodal displacement vector

The velocity and acceleration are:

```math
\dot{\mathbf{u}}=\mathbf{N}\dot{\mathbf{d}}
```

```math
\ddot{\mathbf{u}}=\mathbf{N}\ddot{\mathbf{d}}
```

The finite-element mass matrix is:

```math
[M]=\int_V \rho\,\mathbf{N}^T\mathbf{N}\,dV
```

The consistent linear-elastic stiffness matrix is:

```math
[K]=\int_V \mathbf{B}^T\mathbf{D}\mathbf{B}\,dV
```

where:

- `B` = strain-displacement matrix
- `D` = material constitutive matrix

The internal force vector is:

```math
\mathbf{F}_{int}=\int_V \mathbf{B}^T\boldsymbol{\sigma}\,dV
```

Thus, the semidiscrete equation becomes:

```math
[M]\ddot{\mathbf{d}}+[C]\dot{\mathbf{d}}+\mathbf{F}_{int}(\mathbf{d})=\mathbf{F}_{ext}(t)
```

---

# Explicit Time Integration

The explicit method commonly uses a central-difference approximation.

The velocity at the half time step is approximated by:

```math
\dot{\mathbf{u}}^{n+\frac{1}{2}}
=
\dot{\mathbf{u}}^{n-\frac{1}{2}}
+
\Delta t\,\ddot{\mathbf{u}}^n
```

The displacement at the next time step is:

```math
\mathbf{u}^{n+1}
=
\mathbf{u}^{n}
+
\Delta t\,\dot{\mathbf{u}}^{n+\frac{1}{2}}
```

The acceleration is obtained from the equation of motion:

```math
\ddot{\mathbf{u}}^n
=
[M]^{-1}
\left[
\mathbf{F}_{ext}^n
-
\mathbf{F}_{int}^n
-
[C]\dot{\mathbf{u}}^n
\right]
```

For an explicit formulation with a lumped diagonal mass matrix:

```math
\ddot{u}_i^n
=
\frac{F_{ext,i}^n-F_{int,i}^n-F_{damp,i}^n}{M_{ii}}
```

No general global stiffness-matrix inversion is required at each explicit time increment.

---

# Lumped Mass Matrix

A major feature of explicit finite-element formulations is the use of a diagonal or lumped mass matrix.

The lumped mass matrix can be represented as:

```math
[M_L]=
\begin{bmatrix}
m_1&0&\cdots&0\\
0&m_2&\cdots&0\\
\vdots&\vdots&\ddots&\vdots\\
0&0&\cdots&m_n
\end{bmatrix}
```

Its inverse is obtained directly:

```math
[M_L]^{-1}=
\begin{bmatrix}
1/m_1&0&\cdots&0\\
0&1/m_2&\cdots&0\\
\vdots&\vdots&\ddots&\vdots\\
0&0&\cdots&1/m_n
\end{bmatrix}
```

This makes the calculation of nodal accelerations computationally efficient.

---

# Explicit Stability Condition

The explicit central-difference method is conditionally stable.

The time increment must remain below a critical value:

```math
\Delta t\leq\Delta t_{cr}
```

For a simplified single-degree-of-freedom system:

```math
\Delta t_{cr}\approx\frac{2}{\omega_{max}}
```

where:

- `omega_max` = highest significant natural angular frequency

Since:

```math
\omega=2\pi f
```

the corresponding estimate is:

```math
\Delta t_{cr}\approx\frac{1}{\pi f_{max}}
```

For a wave-propagation interpretation, a characteristic stable increment is approximately:

```math
\Delta t_{cr}\sim\frac{L_{min}}{c}
```

where:

- `L_min` = characteristic minimum element dimension
- `c` = characteristic wave speed

For a one-dimensional longitudinal wave in a linear elastic solid:

```math
c=\sqrt{\frac{E}{\rho}}
```

Thus, reducing the smallest element size generally reduces the stable explicit time step.

---

# Why Explicit Analysis Uses Small Time Steps

Explicit analysis does not normally require the nonlinear equilibrium iterations used by an implicit method at every time increment.

However, stability requires a sufficiently small time increment.

The attached reference figure illustrates the major difference:

- **Implicit analysis:** comparatively larger time increments, with equilibrium convergence required at each increment.
- **Explicit analysis:** very small time increments, with the state advanced directly from the previous time level.

**Figure 6 – Time-increment comparison between implicit and explicit analysis**

![Figure 6 – Time increments](figures/06_time_increment_comparison.png)

The choice between implicit and explicit methods therefore depends strongly on the time scale and nonlinear character of the physical event.

---

# Implicit versus Explicit Analysis

| Feature | Implicit Analysis | Explicit Analysis |
|---|---|---|
| Basic approach | Solve equilibrium equations | Advance solution directly in time |
| Typical time step | Relatively larger | Very small |
| Equilibrium iterations | Required for nonlinear problems | No global equilibrium iteration in the same sense |
| Mass matrix | Often consistent or other formulations | Commonly lumped/diagonal |
| Stability | Generally not limited by the explicit CFL condition | Conditionally stable |
| Contact/impact | Can be difficult for severe discontinuities | Well suited |
| Large deformation | Possible | Particularly suitable |
| Short-duration events | Less efficient in many cases | Highly suitable |
| Long-duration events | Often more efficient | Can become computationally expensive |
| Typical applications | Slow transient/nonlinear problems | Impact, crash, drop, collision |

The attached reference material specifically contrasts the larger time increments of implicit analysis with the very small time increments used in explicit analysis.

---

# Energy Equations

Energy tracking is important in explicit dynamic analysis.

## Kinetic Energy

The kinetic energy of a system is:

```math
E_K=\frac{1}{2}\dot{\mathbf{u}}^T[M]\dot{\mathbf{u}}
```

For a rigid body undergoing translation:

```math
E_{K,trans}=\frac{1}{2}m\mathbf{v}\cdot\mathbf{v}
```

---

## Strain Energy

For a linear elastic system:

```math
E_S=\frac{1}{2}\mathbf{u}^T[K]\mathbf{u}
```

For a nonlinear system, strain energy is generally obtained from the constitutive response:

```math
E_S=\int_V\int_0^{\boldsymbol{\varepsilon}}
\boldsymbol{\sigma}:d\boldsymbol{\varepsilon}\,dV
```

---

## External Work

The work done by external forces is:

```math
W_{ext}=\int_{t_0}^{t_1}\mathbf{F}_{ext}^T\dot{\mathbf{u}}\,dt
```

---

## Damping Energy

The power dissipated by viscous damping is:

```math
P_d=\dot{\mathbf{u}}^T[C]\dot{\mathbf{u}}
```

and the dissipated energy is:

```math
E_d=\int_{t_0}^{t_1}\dot{\mathbf{u}}^T[C]\dot{\mathbf{u}}\,dt
```

---

## Energy Balance

For a closed dynamic system, the numerical solution should satisfy an appropriate energy balance:

```math
W_{ext}\approx E_K+E_S+E_d+E_{other}
```

where `E_other` may include contact dissipation, plastic dissipation, hourglass/control energy, thermal effects, or other modeled energy terms.

Energy balance is an important verification tool for explicit simulations.

---

# Rigid Body Dynamic Motion

A rigid body is an idealization in which distances between all material points remain constant.

For a rigid body, deformation is neglected:

```math
\boldsymbol{\varepsilon}\approx\mathbf{0}
```

The motion can be decomposed into:

1. Translation of the center of mass.
2. Rotation about the center of mass.

---

# Translational Rigid-Body Motion

Newton's second law gives:

```math
\mathbf{F}_{ext}=m\mathbf{a}_G
```

where:

- `m` = rigid-body mass
- `a_G` = acceleration of the center of mass

Therefore:

```math
\mathbf{a}_G=\frac{\mathbf{F}_{ext}}{m}
```

The position of the center of mass is obtained from:

```math
\mathbf{v}_G=\frac{d\mathbf{r}_G}{dt}
```

```math
\mathbf{a}_G=\frac{d\mathbf{v}_G}{dt}
```

For constant acceleration:

```math
\mathbf{v}_G(t)=\mathbf{v}_{G0}+\mathbf{a}_G t
```

and:

```math
\mathbf{r}_G(t)=\mathbf{r}_{G0}+\mathbf{v}_{G0}t+\frac{1}{2}\mathbf{a}_G t^2
```

---

# Rotational Rigid-Body Motion

The rotational equivalent of Newton's second law is:

```math
\sum\mathbf{M}_G=\frac{d\mathbf{H}_G}{dt}
```

where:

- `M_G` = external moment about the center of mass
- `H_G` = angular momentum

For a rigid body:

```math
\mathbf{H}_G=\mathbf{I}_G\boldsymbol{\omega}
```

where:

- `I_G` = inertia tensor about the center of mass
- `omega` = angular velocity

For a fixed principal-axis rotation:

```math
M_G=I_G\alpha
```

where:

```math
\boldsymbol{\alpha}=\frac{d\boldsymbol{\omega}}{dt}
```

---

# Rigid-Body Inertia Tensor

The inertia tensor about the center of mass is:

```math
\mathbf{I}_G=
\begin{bmatrix}
I_{xx}&-I_{xy}&-I_{xz}\\
-I_{xy}&I_{yy}&-I_{yz}\\
-I_{xz}&-I_{yz}&I_{zz}
\end{bmatrix}
```

The diagonal terms are the mass moments of inertia:

```math
I_{xx}=\int_V(y^2+z^2)\rho\,dV
```

```math
I_{yy}=\int_V(x^2+z^2)\rho\,dV
```

```math
I_{zz}=\int_V(x^2+y^2)\rho\,dV
```

The products of inertia are:

```math
I_{xy}=\int_Vxy\rho\,dV
```

```math
I_{xz}=\int_Vxz\rho\,dV
```

```math
I_{yz}=\int_Vyz\rho\,dV
```

The inertia tensor determines the rotational response of a rigid body.

---

# General 3D Rigid-Body Rotation

For general three-dimensional rigid-body motion, Euler's rotational equation is:

```math
\mathbf{M}_G=
\mathbf{I}_G\dot{\boldsymbol{\omega}}
+
\boldsymbol{\omega}\times
(\mathbf{I}_G\boldsymbol{\omega})
```

This equation accounts for:

- Angular acceleration
- Mass distribution
- Gyroscopic effects
- Coupling between rotational axes

For rotation about a principal axis, the gyroscopic coupling term simplifies.

---

# Rigid-Body Kinematics

The velocity of any point `P` on a rigid body can be written as:

```math
\mathbf{v}_P=
\mathbf{v}_G+
\boldsymbol{\omega}\times\mathbf{r}_{P/G}
```

The acceleration is:

```math
\mathbf{a}_P=
\mathbf{a}_G+
\boldsymbol{\alpha}\times\mathbf{r}_{P/G}
+
\boldsymbol{\omega}\times
(\boldsymbol{\omega}\times\mathbf{r}_{P/G})
```

The three terms represent:

- Translational acceleration
- Tangential acceleration
- Centripetal acceleration

---

# Rotational Kinetic Energy

The rotational kinetic energy is:

```math
E_{K,rot}=
\frac{1}{2}
\boldsymbol{\omega}^T
\mathbf{I}_G
\boldsymbol{\omega}
```

Therefore, the total rigid-body kinetic energy is:

```math
E_K=
\frac{1}{2}m\mathbf{v}_G^2
+
\frac{1}{2}
\boldsymbol{\omega}^T
\mathbf{I}_G
\boldsymbol{\omega}
```

---

# Contact and Impact

Explicit dynamics is particularly useful for contact and impact because the contact state can change rapidly.

A simplified normal contact force may be represented by:

```math
F_n=k_n\delta+c_n\dot{\delta}
```

where:

- `k_n` = contact stiffness
- `c_n` = contact damping
- `delta` = penetration/overclosure measure

The normal contact force acts only when contact is active.

For frictional contact:

```math
|F_t|\leq\mu F_n
```

where:

- `F_t` = tangential contact force
- `mu` = coefficient of friction

These equations provide a simplified representation; the exact contact formulation depends on the solver and contact algorithm used.

---

# Impact and Momentum

For a short-duration impact, the impulse-momentum relationship is:

```math
\mathbf{J}=
\int_{t_1}^{t_2}\mathbf{F}(t)\,dt
=
m(\mathbf{v}_2-\mathbf{v}_1)
```

For a system in which external impulse is negligible:

```math
\sum m_i\mathbf{v}_{i,1}
=
\sum m_i\mathbf{v}_{i,2}
```

Momentum conservation is therefore an important verification principle for impact and collision simulations.

---

# Coefficient of Restitution

For a simplified two-body impact, the coefficient of restitution is:

```math
e=
\frac{\text{relative separation speed}}
{\text{relative approach speed}}
```

In one-dimensional form:

```math
e=
\frac{v_{2,2}-v_{1,2}}
{v_{1,1}-v_{2,1}}
```

where the subscripts identify the two bodies and the time/state before and after impact.

For an ideal elastic collision:

```math
e=1
```

For a perfectly inelastic collision:

```math
e=0
```

---

# Time-Dependent Loading

A dynamic load can be represented as:

```math
\mathbf{F}(t)=\mathbf{F}_0 f(t)
```

where `f(t)` describes the loading history.

A general piecewise loading function can be written as:

```math
F(t)=
\begin{cases}
F_1(t),&t_0\leq t<t_1\\
F_2(t),&t_1\leq t<t_2\\
\vdots&\\
F_n(t),&t_{n-1}\leq t\leq t_n
\end{cases}
```

The time-dependent loading history is important because the dynamic response depends not only on the magnitude of the load but also on its duration and rate of application.

---

# Loading Rate and Dynamic Effects

If the loading time is long compared with the structural response time, the problem may behave approximately quasi-statically.

If the loading is sufficiently rapid, inertia becomes important.

A useful characteristic structural time scale can be associated with the natural period:

```math
T=\frac{2\pi}{\omega}
```

The relationship between the loading duration and the structural period helps determine whether dynamic effects are important.

The attached reference figures illustrate the distinction between slowly applied loads and rapidly applied loads.

---

# Analysis Workflow

The general workflow for an explicit dynamic analysis is:

```text
Create Geometry
      │
      ▼
Define Material Properties
      │
      ▼
Define Rigid / Deformable Bodies
      │
      ▼
Generate Finite Element Mesh
      │
      ▼
Define Contact
      │
      ▼
Apply Boundary Conditions
      │
      ▼
Define Initial Conditions
      │
      ▼
Define Time-Dependent Loading
      │
      ▼
Select Explicit Dynamic Analysis
      │
      ▼
Determine Stable Time Increment
      │
      ▼
Advance Solution in Time
      │
      ▼
Monitor Energy and Contact
      │
      ▼
Post-Process Motion / Stress / Deformation
      │
      ▼
Verify Results
```

---

# Explicit Dynamics Verification

The following quantities should be monitored during an explicit simulation:

## 1. Energy Balance

Check that energy is physically consistent:

```math
W_{ext}\approx E_K+E_S+E_{diss}
```

Large unexplained energy errors may indicate numerical problems.

## 2. Stable Time Step

Verify that:

```math
\Delta t\leq\Delta t_{cr}
```

## 3. Mesh Sensitivity

Repeat the analysis with an appropriately refined mesh and compare:

- Peak stress
- Displacement
- Contact force
- Kinetic energy
- Internal/strain energy

## 4. Contact Behavior

Check that:

- Bodies do not exhibit unrealistic penetration.
- Contact forces are physically reasonable.
- Friction behaves as intended.

## 5. Rigid-Body Motion

For a free rigid body, verify conservation of:

- Linear momentum
- Angular momentum
- Energy, where appropriate

---

# Figure References

The attached reference figures are incorporated into this project documentation as follows:

| Figure | Description | README Reference |
|---|---|---|
| Figure 1 | Static, transient structural and explicit dynamics concepts | Static/Transient/Explicit Dynamics |
| Figure 2 | Matrix equations for linear, nonlinear static and dynamic problems | Governing Equations |
| Figure 3 | Static structural analysis | Static Analysis |
| Figure 4 | Implicit versus explicit solving methods | Numerical Methods |
| Figure 5 | Types of nonlinearity | Nonlinear Analysis |
| Figure 6 | Implicit versus explicit time increments | Time Integration |

The figures should be stored in the `figures/` directory using the filenames shown in the repository structure below.

---

# Repository Structure

```text
07_Explicit_Dynamics_and_Rigid_Body_Dynamic_Motion/
│
├── README.md
│
├── ansys/
│   ├── explicit_dynamics/
│   │   ├── explicit_dynamic.wbpj
│   │   ├── analysis_setup.png
│   │   ├── time_step.png
│   │   └── results/
│   │
│   ├── rigid_body/
│   │   ├── rigid_body_motion.wbpj
│   │   ├── translational_motion.png
│   │   ├── rotational_motion.png
│   │   └── results/
│   │
│   └── contact/
│       ├── contact_setup.png
│       └── contact_results.png
│
├── geometry/
│   └── geometry/
│
├── figures/
│   ├── 01_static_transient_explicit.png
│   ├── 02_matrix_equations.png
│   ├── 03_static_structural_analysis.png
│   ├── 04_implicit_vs_explicit.png
│   ├── 05_geometric_nonlinearity.png
│   └── 06_time_increment_comparison.png
│
└── results/
    ├── animation/
    ├── stress/
    ├── deformation/
    ├── velocity/
    ├── acceleration/
    ├── contact_force/
    └── energy/
```

---

# Applications

Explicit dynamics and rigid-body dynamics are applicable to:

- Automotive crash analysis
- Drop tests
- Impact analysis
- Collision simulations
- Ballistic impact
- Metal forming
- High-speed mechanical events
- Mechanical component impact
- Robot collision analysis
- Rigid-body mechanisms
- Gear and linkage dynamics
- Contact-impact problems
- Structural failure under rapid loading

---

# Limitations

Explicit dynamics is computationally attractive for short-duration nonlinear events, but the very small stable time step can make long-duration simulations expensive.

Important limitations include:

- Small stable time increment.
- High computational cost for long-duration events.
- Sensitivity to very small elements.
- Need for careful contact definition.
- Need for appropriate material models.
- Numerical energy errors must be monitored.
- Excessive mass scaling can alter the physical response.
- Results can be sensitive to mesh quality and element formulation.

---

# Mass Scaling

When the stable time increment is controlled by very small elements, mass scaling may sometimes be used to increase the computational time step.

However, artificial mass changes the inertia of the structure.

Therefore, mass scaling should be controlled and verified.

The objective is to increase computational efficiency without significantly changing the physical response.

A comparison should be made between:

- Original mass
- Scaled mass
- Kinetic energy
- Internal energy
- Peak response
- Contact forces

---

# Comparison of Explicit and Implicit Methods

The attached reference material concludes that both approaches divide the analysis time into increments, but they differ in how each increment is solved.

### Implicit

The solution at a new time is obtained by solving an equilibrium problem involving the current configuration.

Advantages:

- Larger time increments can often be used.
- Suitable for slow or moderate transient processes.
- Suitable for many long-duration simulations.

Disadvantages:

- Nonlinear iterations can be expensive.
- Difficult contact changes may cause convergence problems.

### Explicit

The solution is advanced directly from the known state.

Advantages:

- No global nonlinear equilibrium iteration in the same form.
- Highly suitable for impact and severe contact.
- Robust for highly nonlinear short-duration events.

Disadvantages:

- Conditionally stable.
- Requires very small time increments.
- Can be expensive for long-duration simulations.

---

# Key Learnings

This project demonstrates:

- The difference between static and dynamic structural analysis.
- The difference between implicit and explicit solution methods.
- The importance of inertia in rapidly changing loads.
- The three major categories of structural nonlinearity.
- The finite-element dynamic equation of motion.
- Central-difference explicit time integration.
- The explicit critical time-step condition.
- The role of the lumped mass matrix.
- Energy conservation and energy monitoring.
- Translational rigid-body motion.
- Rotational rigid-body motion.
- Rigid-body inertia.
- Contact and impact mechanics.
- Momentum and impulse relationships.
- Appropriate applications of explicit dynamics.

---

# Conclusion

Explicit dynamic analysis is a time-domain method for solving highly transient structural problems in which inertia and nonlinear effects are important.

The governing finite-element equation is:

```math
[M]\{\ddot{u}\}+[C]\{\dot{u}\}+\{F_{int}(u)\}=\{F_{ext}(t)\}
```

The explicit central-difference method advances the structural state using very small time increments. The maximum stable time increment is governed by the highest dynamic frequency or, equivalently, by the smallest characteristic element size and wave speed.

Rigid-body dynamic motion is governed by Newton's translational equation:

```math
\mathbf{F}_{ext}=m\mathbf{a}_G
```

and Euler's rotational equation:

```math
\mathbf{M}_G=
\mathbf{I}_G\dot{\boldsymbol{\omega}}
+
\boldsymbol{\omega}\times
(\mathbf{I}_G\boldsymbol{\omega})
```

Together, these formulations provide the basis for understanding explicit structural dynamics, contact-impact behavior, and rigid-body motion.

The attached figures provide the conceptual foundation for selecting an appropriate analysis method based on loading rate, nonlinear behavior and the required time resolution.

---

# References

1. Attached reference figures provided with this project, covering static structural analysis, transient structural analysis, nonlinear analysis, implicit solving, explicit solving and time-increment selection.
2. ANSYS Mechanical documentation and theory reference for explicit dynamics and structural dynamics.
3. Standard finite-element formulations for structural dynamics, central-difference time integration and rigid-body mechanics.

---

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering  
Otto von Guericke University Magdeburg

---

# License

This project is licensed under the **MIT License**.
