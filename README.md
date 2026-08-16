# FEM Simulation Portfolio

## Overview

This repository contains a comprehensive collection of **Finite Element Method (FEM)** and **Computational Mechanics** projects implemented using:

- MATLAB
- Python
- ANSYS Mechanical
- ANSYS APDL
- MPI / Parallel Computing

The portfolio combines **FEM theory, numerical methods, scientific programming, and engineering simulation** to demonstrate the complete workflow from mathematical formulation and discretization to numerical solution, post-processing, verification, and interpretation of results.

The projects cover both **linear and nonlinear mechanics**, including structural, dynamic, contact, material, and computational aspects of FEM.

The main objectives of this portfolio are to develop and demonstrate a strong understanding of:

- FEM formulation and discretization
- Structural mechanics
- Computational mechanics
- Nonlinear finite element analysis
- Contact mechanics
- Material modeling
- Dynamic analysis
- Numerical solution techniques
- Scientific programming
- ANSYS-based industrial simulation workflows
- Verification and validation
- High-performance and parallel FEM computing

---

# Tools and Technologies

## Programming

- MATLAB
- Python
- MPI
- Parallel Computing
- Scientific Computing

## Python Libraries

- NumPy
- SciPy
- Matplotlib
- mpi4py
- meshio
- PyVista

## CAE / FEM Software

- ANSYS Mechanical
- ANSYS APDL
- ANSYS Explicit Dynamics
- ANSYS Rigid Body Dynamics

---

# Topics Covered

## 1. Linear FEM

The portfolio includes fundamental finite element formulations and classical structural mechanics problems.

Topics include:

- 1D beam elements
- Truss elements
- 2D elasticity
- Plane stress
- Plane strain
- Axisymmetric analysis
- Cantilever beam analysis
- Plate analysis
- Structural stiffness formulation
- Boundary conditions
- Load vector formulation
- Mesh generation
- Mesh convergence

The general linear FEM system is represented by:

```text
[K]{u} = {F}
```

where:

- `[K]` = global stiffness matrix
- `{u}` = nodal displacement vector
- `{F}` = global force vector

---

# 2. Nonlinear FEM

Nonlinear finite element projects investigate structural behavior when the relationship between load and response is no longer linear.

Topics include:

- Geometric nonlinearity
- Material nonlinearity
- Boundary/contact nonlinearity
- Large deformation
- Large rotation
- Newton-Raphson solution
- Incremental loading
- Total Lagrangian formulation
- Updated Lagrangian formulation

A nonlinear equilibrium problem can generally be expressed as:

```text
R(u) = F_ext - F_int(u) = 0
```

The Newton-Raphson linearization is:

```text
K_T Δu = R
```

where:

- `R` = residual vector
- `K_T` = tangent stiffness matrix
- `Δu` = displacement correction

---

# 3. Material Nonlinearity

Material nonlinearities are considered when the constitutive response cannot be represented by a simple linear elastic stress-strain relationship.

Topics include:

- Hyperelasticity
- Neo-Hookean material model
- Nonlinear stress-strain response
- Elastic material behavior
- Plasticity concepts
- Constitutive modeling

For a hyperelastic material, the constitutive response can be obtained from the strain-energy density function:

```text
P = ∂W / ∂F
```

where:

- `W` = strain-energy density
- `F` = deformation gradient
- `P` = first Piola-Kirchhoff stress

---

# 4. Contact Mechanics

The portfolio includes FEM problems involving interaction between deformable and rigid bodies.

Topics include:

- Surface-to-surface contact
- Rigid surface interaction
- Penalty-based contact
- Contact stiffness
- Normal contact force
- Contact pressure
- Contact penetration
- Frictional interaction
- Contact convergence

A simplified penalty formulation is:

```text
F_n = k_p δ_n
```

where:

- `F_n` = normal contact force
- `k_p` = penalty/contact stiffness
- `δ_n` = contact penetration

Contact problems introduce additional nonlinearities because the contact status can change between:

```text
OPEN ↔ CLOSED
```

---

# 5. Stress Recovery

Stress recovery is investigated to improve the calculation and interpretation of element stresses.

Topics include:

- Element stress calculation
- Nodal stress recovery
- Nodal Point Force (NPF) method
- Improved element stress calculation
- Comparison of stress-recovery techniques
- Stress distribution
- Stress concentration

The portfolio includes work related to:

> **Improved Calculation of Element Stresses by Means of Nodal Forces**

The objective is to investigate how nodal forces can be used to obtain improved and more physically meaningful element stress estimates.

---

# 6. Dynamic Analysis

Dynamic FEM projects investigate structural response when inertia and time-dependent effects become important.

Topics include:

- Modal analysis
- Natural frequencies
- Mode shapes
- Transient structural analysis
- Harmonic response
- Frequency response
- Explicit dynamics
- Rigid body dynamic motion
- Moving loads
- Impact-type loading
- Time-dependent loading

The general equation of motion is:

```text
[M]{ü} + [C]{u̇} + [K]{u} = {F(t)}
```

where:

- `[M]` = mass matrix
- `[C]` = damping matrix
- `[K]` = stiffness matrix
- `{u}` = displacement vector
- `{u̇}` = velocity vector
- `{ü}` = acceleration vector
- `{F(t)}` = time-dependent external force

---

# 7. Explicit Dynamics and Rigid Body Dynamic Motion

The explicit dynamics project focuses on the solution of highly transient and nonlinear problems using an explicit time-integration approach.

Topics include:

- Explicit time integration
- Central-difference method
- Lumped mass matrix
- Stable time increment
- Courant-type stability condition
- Inertia effects
- Contact and impact
- Momentum conservation
- Energy balance
- Rigid body translation
- Rigid body rotation
- Angular momentum
- Inertia tensor
- Euler equations
- Rigid/deformable body interaction

For the semi-discrete dynamic FEM system:

```text
[M]{ü} + [C]{u̇} + [K]{u} = {F_ext} - {F_int}
```

The explicit method evaluates acceleration directly:

```text
{ü}_n = [M]⁻¹({F_ext,n} - {F_int,n} - {C}{u̇}_n)
```

For a diagonal/lumped mass matrix, this operation can be performed efficiently without solving a global system of simultaneous equations.

The central-difference velocity and displacement updates are:

```text
{u̇}_{n+1/2} = {u̇}_{n-1/2} + Δt {ü}_n
```

```text
{u}_{n+1} = {u}_n + Δt {u̇}_{n+1/2}
```

The explicit time step is restricted by numerical stability. A simplified characteristic relation is:

```text
Δt_crit ≲ L_min / c
```

where:

- `L_min` = characteristic minimum element dimension
- `c` = characteristic wave speed

For a linear elastic material:

```text
c ≈ √(E / ρ)
```

for the simplified one-dimensional longitudinal-wave case.

The project also considers rigid-body motion. Translational motion follows:

```text
ΣF = m a
```

while rotational motion is governed by:

```text
ΣM = I α
```

For general three-dimensional rigid-body rotation:

```text
M = I α + ω × (Iω)
```

These equations form the basis for studying the motion and interaction of rigid bodies in dynamic simulations.

---

# 8. Thermal Analysis

Thermal FEM projects investigate heat-transfer problems and their coupling with structural behavior.

Topics include:

- Steady-state thermal FEM
- Temperature distribution
- Thermal conductivity
- Thermal boundary conditions
- Heat flux
- Thermal deformation
- Thermo-mechanical coupling

The general steady-state heat equation is:

```text
∇ · (k ∇T) + Q = 0
```

where:

- `k` = thermal conductivity
- `T` = temperature
- `Q` = volumetric heat generation

---

# 9. High Performance Computing

The portfolio also explores the computational aspects of FEM and parallel numerical methods.

Topics include:

- Parallel FEM assembly
- MPI-based computation
- Element-level parallelization
- Distributed computation
- Parallel matrix operations
- Scalability studies
- Strong scaling
- Weak scaling
- Performance analysis

The general motivation is to reduce computational time by distributing independent FEM operations across multiple processing units.

---

# Verification and Validation

Verification and validation are important parts of the portfolio.

Where applicable, numerical results are compared against:

- Analytical solutions
- Classical mechanics solutions
- MATLAB implementations
- Python implementations
- ANSYS Mechanical
- ANSYS APDL
- Mesh-refined solutions
- Literature/reference solutions

Typical verification procedures include:

## Mesh Convergence

```text
Mesh refinement
      ↓
FEM solution
      ↓
Record stress/displacement/frequency
      ↓
Refine mesh
      ↓
Repeat
      ↓
Check result variation
```

## Analytical Comparison

Numerical results are compared with known analytical solutions whenever an appropriate closed-form solution is available.

## Cross-Solver Comparison

Selected problems are solved independently using:

- MATLAB
- Python
- ANSYS

This provides an additional method of checking implementation and numerical results.

---

# Repository Structure

```text
FEM-Simulation-Portfolio/
│
├── README.md
│
├── 01_Linear_Cantilever/
│   ├── README.md
│   ├── matlab/
│   ├── python/
│   └── ansys/
│
├── 02_Truss_Structure/
│   ├── README.md
│   ├── matlab/
│   └── ansys/
│
├── 03_/
│   ├── README.md
│   └── ...
│
├── 04_/
│   ├── README.md
│   └── ...
│
├── 05_/
│   ├── README.md
│   └── ...
│
├── 06_3_i_Stairs_Ascend/
│   ├── README.md
│   ├── ansys/
│   ├── geometry/
│   ├── figures/
│   └── results/
│
└── 07_Explicit_Dynamics_and_Rigid_Body_Dynamic_Motion/
    ├── README.md
    ├── ansys/
    ├── geometry/
    ├── figures/
    └── results/
```

---

# Project Organization

Each project is intended to contain its own:

```text
README.md
```

The project README documents:

- Problem statement
- Objectives
- Geometry
- Material properties
- Governing equations
- Boundary conditions
- Loading conditions
- FEM formulation
- Solver settings
- Mesh information
- Mesh convergence
- Results
- Verification
- Interpretation
- Limitations
- Future work

This makes every project independently understandable while maintaining a common structure across the portfolio.

---

# Simulation Workflow

The general FEM workflow used throughout the portfolio is:

```text
Engineering Problem
        │
        ▼
Mathematical Formulation
        │
        ▼
Governing Equations
        │
        ▼
Geometry
        │
        ▼
Material Model
        │
        ▼
Boundary Conditions
        │
        ▼
Loading
        │
        ▼
Mesh Generation
        │
        ▼
FEM Discretization
        │
        ▼
Numerical Solution
        │
        ▼
Post-Processing
        │
        ▼
Verification
        │
        ▼
Validation
        │
        ▼
Engineering Interpretation
```

---

# Example FEM Workflow

For a typical structural FEM problem:

```text
Create Geometry
      ↓
Define Material
      ↓
Generate Mesh
      ↓
Apply Boundary Conditions
      ↓
Apply Loads
      ↓
Assemble FEM System
      ↓
Solve
      ↓
Calculate Displacement
      ↓
Recover Strain
      ↓
Recover Stress
      ↓
Check Convergence
      ↓
Compare with Reference Solution
```

---

# Dynamic FEM Workflow

For transient and explicit dynamic problems:

```text
Define Geometry
      ↓
Define Material and Density
      ↓
Generate Mesh
      ↓
Define Initial Conditions
      ↓
Apply Boundary Conditions
      ↓
Define Time-Dependent Loading
      ↓
Calculate Mass / Stiffness
      ↓
Select Time Integration Method
      ↓
Advance Time Step
      ↓
Calculate Acceleration
      ↓
Update Velocity
      ↓
Update Displacement
      ↓
Calculate Contact / Internal Forces
      ↓
Repeat Until Final Time
      ↓
Post-Process Dynamic Response
```

---

# Results and Post-Processing

Depending on the analysis type, the portfolio evaluates:

### Structural

- Total deformation
- Directional deformation
- Equivalent von-Mises stress
- Principal stress
- Principal strain
- Reaction forces
- Strain energy

### Dynamic

- Natural frequencies
- Mode shapes
- Time-history response
- Acceleration
- Velocity
- Displacement
- Dynamic stress
- Frequency response
- Harmonic response

### Contact

- Contact pressure
- Penetration
- Contact force
- Sliding
- Frictional behavior

### Thermal

- Temperature
- Heat flux
- Thermal deformation
- Thermal stress

### Computational

- Runtime
- Iteration count
- Parallel efficiency
- Speedup
- Scalability

---

# Engineering Applications

The methods developed in this portfolio are applicable to:

- Mechanical structures
- Automotive components
- Aerospace structures
- Industrial machinery
- Bridges and platforms
- Pressure-loaded components
- Impact and crash-type problems
- Contact assemblies
- Composite structures
- Thermal-mechanical systems
- High-performance engineering simulations

---

# Current Portfolio Projects

| Project | Main Topic | Primary Tools |
|---|---|---|
| `01_Linear_Cantilever` | Linear FEM / Beam Analysis | MATLAB, ANSYS |
| `02_Truss_Structure` | Truss FEM | MATLAB, ANSYS |
| `03_` | FEM / Structural Analysis | MATLAB, ANSYS |
| `04_` | FEM / Structural Analysis | MATLAB, ANSYS |
| `05_` | Nonlinear / Advanced FEM | MATLAB, ANSYS |
| `06_3_i_Stairs_Ascend` | Transient Structural Analysis / Moving Load | ANSYS Mechanical |
| `07_Explicit_Dynamics_and_Rigid_Body_Dynamic_Motion` | Explicit Dynamics / Rigid Body Dynamics | ANSYS Mechanical |

---

# Key Learning Outcomes

This portfolio demonstrates practical experience with:

- Finite element discretization
- Element formulation
- Global matrix assembly
- Boundary-condition implementation
- Numerical linear algebra
- Nonlinear solution methods
- Newton-Raphson iteration
- Material constitutive modeling
- Contact mechanics
- Dynamic time integration
- Explicit FEM
- Rigid-body dynamics
- Stress recovery
- Mesh convergence
- Verification and validation
- Scientific programming
- Parallel computing
- Engineering post-processing

---

# Future Development

Planned extensions of the portfolio include:

- Advanced nonlinear FEM
- Large-deformation contact
- Hyperelastic finite element implementation
- Plasticity and elastoplasticity
- Composite material modeling
- Fluid-structure interaction
- Coupled thermo-mechanical analysis
- Explicit impact simulations
- Advanced rigid-body dynamics
- GPU-accelerated FEM
- Parallel sparse linear solvers
- Automated mesh convergence
- Automated FEM post-processing
- Optimization and topology optimization
- Reduced-order modeling

---

# Author

**Musharraf Khan**

M.Sc. Computational Methods in Engineering  
Otto von Guericke University Magdeburg

B.Tech. Mechanical Engineering  
Aligarh Muslim University

---

# License

This repository is licensed under the **MIT License**.

The code, scripts, FEM implementations, documentation, and educational material in this repository are provided for learning, research, and demonstration purposes.

```text
MIT License

Copyright (c) 2026 Musharraf Khan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files, to deal in the Software
without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

# Disclaimer

The simulations in this repository are intended primarily for **educational, research, and portfolio demonstration purposes**.

Numerical results should not be used directly for safety-critical engineering design without appropriate:

- Model verification
- Experimental validation
- Material characterization
- Mesh-convergence studies
- Boundary-condition validation
- Solver verification
- Engineering standards and design-code checks
- Independent engineering review

---

# Contact

**Musharraf Khan**

For questions, collaboration, or discussion regarding the FEM projects, numerical methods, or computational mechanics implementations, please refer to the contact information associated with this repository.

