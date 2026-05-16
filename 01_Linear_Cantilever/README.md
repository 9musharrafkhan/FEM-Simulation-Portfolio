# 01_Linear_Cantilever

# Linear Cantilever Beam Analysis using FEM

---

# Overview

This project presents the Finite Element Analysis (FEM) of a cantilever beam subjected to a tip load.

The beam problem is solved using:

- MATLAB FEM implementation
- Python postprocessing and comparison scripts
- ANSYS Mechanical validation
- Analytical beam theory validation

The objective of this project is to:

- Implement FEM formulation from scratch
- Compare different boundary condition implementation methods
- Validate FEM results against analytical solution
- Compare MATLAB and ANSYS solutions
- Study computational efficiency
- Demonstrate professional FEM workflow

---

# Problem Description

A cantilever beam with fixed support at one end is subjected to a concentrated downward load at the free end.

---

# Geometry

| Parameter | Value |
|---|---|
| Length | 300 mm |
| Cross Section | 20 mm × 20 mm |
| Area | 400 mm² |
| Second Moment of Area | 13333.33 mm⁴ |

---

# Material Properties

| Property | Value |
|---|---|
| Material | Structural Steel |
| Young’s Modulus (E) | 210000 MPa |
| Poisson Ratio | 0.3 |

---

# Loading

| Parameter | Value |
|---|---|
| Load Type | Point Load |
| Load Magnitude | 1000 N |
| Load Location | Free End |

---

# Mesh Information

| Parameter | Value |
|---|---|
| Element Size | 5 mm |
| Number of Elements | 960 |

The same mesh size is used for:

- MATLAB FEM model
- ANSYS beam element model
- ANSYS solid element model

---

# Governing Equation

The Euler-Bernoulli beam equation is:

```math
EI \frac{d^4w}{dx^4} = q(x)
```

Where:

- \(E\) = Young’s modulus
- \(I\) = second moment of area
- \(w\) = beam deflection
- \(q(x)\) = applied loading

---

# Analytical Solution

## Second Moment of Area

For a square cross section:

```math
I = \frac{bh^3}{12}
```

Substituting:

```math
I = \frac{20 \times 20^3}{12}
```

```math
I = 13333.33 \ mm^4
```

---

## Maximum Deflection

For a cantilever beam with tip load:

```math
\delta_{max} = \frac{PL^3}{3EI}
```

Substituting:

```math
\delta_{max} =
\frac{1000 \times 300^3}
{3 \times 210000 \times 13333.33}
```

```math
\delta_{max} = 3.2143 \ mm
```

---

## Maximum Bending Stress

Maximum bending stress:

```math
\sigma_{max} = \frac{Mc}{I}
```

Where:

```math
M = PL
```

```math
M = 1000 \times 300
```

```math
M = 300000 \ Nmm
```

```math
c = 10 \ mm
```

Substituting:

```math
\sigma_{max} =
\frac{300000 \times 10}{13333.33}
```

```math
\sigma_{max} = 225 \ MPa
```

---

# FEM Formulation

The cantilever beam problem is solved using the Finite Element Method (FEM) based on 3D linear elasticity formulation.

The implementation uses:

- 8-node hexahedral isoparametric elements (HEX8)
- Gaussian numerical integration
- Jacobian coordinate transformation
- Strain-displacement matrix formulation
- 3D isotropic constitutive law

The element stiffness matrix is computed using:

```math
K_e = \int_V B^T C B \, dV
```

Where:

- \(B\) = strain-displacement matrix
- \(C\) = constitutive matrix
- \(V\) = element volume

---

# Isoparametric HEX8 Element

The solid element contains:

- 8 nodes
- 3 displacement DOFs per node

Total degrees of freedom per element:

```math
24 = 8 \times 3
```

The nodal displacement vector becomes:

```math
q_e =
[w_1,u_1,v_1,\dots,w_8,u_8,v_8]^T
```

---

# Shape Functions

The geometry and displacement field are interpolated using trilinear shape functions:

```math
N_i(\xi,\eta,\zeta)
=
\frac{1}{8}
(1+\xi_i\xi)
(1+\eta_i\eta)
(1+\zeta_i\zeta)
```

Where:

- \(\xi,\eta,\zeta\) are natural coordinates
- \(N_i\) are interpolation functions

The implementation computes derivatives of shape functions with respect to natural coordinates:

```math
\frac{\partial N}{\partial \xi},
\quad
\frac{\partial N}{\partial \eta},
\quad
\frac{\partial N}{\partial \zeta}
```

---

# Gaussian Integration

The stiffness matrix integration is performed numerically using 2×2×2 Gauss quadrature.

The Gauss points used are:

```math
\xi_G = \pm \frac{1}{\sqrt{3}}
```

Total integration points:

```math
2 \times 2 \times 2 = 8
```

---

# Jacobian Transformation

The Jacobian matrix transforms natural coordinates into physical coordinates:

```math
J =
\frac{\partial(x,y,z)}
{\partial(\xi,\eta,\zeta)}
```

The Jacobian is computed as:

```math
J = N_{,\xi} \cdot x
```

Where:

- \(N_{,\xi}\) = derivatives of shape functions
- \(x\) = nodal coordinates

The determinant of the Jacobian:

```math
det(J)
```

is used for volume transformation during integration.

---

# Constitutive Matrix

The constitutive matrix corresponds to 3D isotropic linear elasticity:

```math
\sigma = C\varepsilon
```

The constitutive matrix is constructed using:

- Young’s modulus \(E\)
- Poisson ratio \(\nu\)

The formulation includes:

- Normal stresses
- Shear stresses

for full three-dimensional elasticity.

---

# Strain-Displacement Matrix (B-Matrix)

The strain-displacement matrix relates nodal displacements to strains:

```math
\varepsilon = Bu
```

The B-matrix contains:

- Normal strain terms
- Shear strain terms

The matrix size is:

```math
B \in \mathbb{R}^{6 \times 24}
```

---

# Element Stiffness Matrix Computation

At each Gauss point, the element stiffness contribution is computed as:

```math
K_e =
\sum_{GP}
B^T C B \ det(J) w_i
```

Where:

- \(B^T\) = transpose of strain-displacement matrix
- \(C\) = constitutive matrix
- \(det(J)\) = Jacobian determinant
- \(w_i\) = Gauss integration weights

The final element stiffness matrix has size:

```math
K_e \in \mathbb{R}^{24 \times 24}
```

---

# Global Assembly

The global stiffness matrix is assembled using element connectivity:

```math
K = \sum K_e
```

The final FEM system becomes:

```math
Ku = F
```

Where:

- \(K\) = global stiffness matrix
- \(u\) = displacement vector
- \(F\) = external force vector

---

# MATLAB Implementation

Two different approaches were implemented for applying boundary conditions.

---

# Method 1 — Delete Row and Column Method

Boundary conditions are imposed by deleting the rows and columns corresponding to constrained degrees of freedom.

## Results

| Quantity | Value |
|---|---|
| Maximum Deflection | -3.2539 mm |
| Computation Time | 14.835 s |

---

# Method 2 — Higher Stiffness Method

Boundary conditions are imposed using a very large stiffness value at constrained DOFs.

## Results

| Quantity | Value |
|---|---|
| Maximum Deflection | -3.2539 mm |
| Computation Time | 1.58 s |

---

# Total MATLAB Runtime

| Quantity | Value |
|---|---|
| Total Time | 55.52 s |

---

# ANSYS Validation

The same cantilever beam problem was solved in ANSYS Mechanical using:

- Beam elements
- Solid elements

---

# ANSYS Solid Element Result

| Quantity | Value |
|---|---|
| Maximum Deflection | -3.3705 mm |

---

# ANSYS Beam Element Result

| Quantity | Value |
|---|---|
| Maximum Deflection | -3.3866 mm |

---

# Result Comparison

| Method | Maximum Deflection (mm) |
|---|---|
| Analytical Solution | -3.2143 |
| MATLAB FEM (Delete Row/Column) | -3.2539 |
| MATLAB FEM (Higher Stiffness) | -3.2539 |
| ANSYS Solid Element | -3.3705 |
| ANSYS Beam Element | -3.3866 |

---

# Error Comparison

## MATLAB FEM Error

```math
\text{Error} =
\frac{|3.2539 - 3.2143|}
{3.2143}
\times 100
```

```math
\text{Error} = 1.23\%
```

---

## ANSYS Solid Element Error

```math
\text{Error} =
\frac{|3.3705 - 3.2143|}
{3.2143}
\times 100
```

```math
\text{Error} = 4.86\%
```

---

## ANSYS Beam Element Error

```math
\text{Error} =
\frac{|3.3866 - 3.2143|}
{3.2143}
\times 100
```

```math
\text{Error} = 5.36\%
```

---

# Repository Structure

```text
01_Linear_Cantilever/
│
├── README.md
│
├── matlab/
│   ├── main.m
│   ├── material.m
│   ├── geometry.m
│   ├── mesh_hex8.m
│   ├── boundary.m
│   ├── force.m
│   ├── element.m
│   ├── stiff.m
│   ├── assemble_global.m
│   ├── force_global.m
│   ├── process_boundV1.m
│   ├── process_boundV2.m
│   ├── Plot_Def_3D.m
│   └── postprocess.m
│
├── python/
│   ├── convergence_plot.py
│   ├── comparison_plot.py
│   ├── validation_analysis.py
│   └── postprocess.py
│
├── ansys/
│   ├── cantilever_beam.wbpj
│   ├── screenshots/
│   └── exported_results/
│
├── results/
│   ├── displacement_comparison.png
│   ├── stress_distribution.png
│   ├── convergence_plot.png
│   └── analytical_vs_FEM.png
│
├── report/
│   └── cantilever_report.pdf
│
└── data/
    ├── analytical_solution.csv
    └── FEM_results.csv
```

---

# MATLAB Files Description

| File | Purpose |
|---|---|
| main.m | Main simulation driver |
| material.m | Material properties |
| geometry.m | Geometry definition |
| mesh_hex8.m | HEX8 mesh generation |
| boundary.m | Dirichlet boundary conditions |
| force.m | Neumann boundary conditions |
| element.m | Element definition |
| stiff.m | Computes element stiffness matrix |
| assemble_global.m | Global stiffness assembly |
| force_global.m | Global force assembly |
| process_boundV1.m | Delete row and column method |
| process_boundV2.m | Higher stiffness method |
| Plot_Def_3D.m | Deformed shape visualization |
| postprocess.m | Result visualization |

---

# Python Files Description

| File | Purpose |
|---|---|
| convergence_plot.py | Mesh convergence visualization |
| comparison_plot.py | MATLAB vs ANSYS comparison |
| validation_analysis.py | Error analysis |
| postprocess.py | Generates plots and graphs |

---

# ANSYS Workflow

The ANSYS validation includes:

1. Geometry creation  
2. Material assignment  
3. Mesh generation  
4. Static structural setup  
5. Beam and solid element comparison  
6. Postprocessing  

---

# Key Learnings

This project demonstrates:

- FEM formulation using HEX8 elements
- Gaussian numerical integration
- Jacobian transformation
- B-matrix formulation
- Matrix assembly procedures
- Boundary condition implementation methods
- Computational efficiency comparison
- Validation against analytical solutions
- ANSYS verification workflow
- Professional FEM documentation

---

# Conclusions

- Both MATLAB methods produced identical displacement results.
- The higher stiffness method was computationally faster.
- MATLAB FEM showed very good agreement with analytical beam theory.
- ANSYS beam and solid models validated the numerical implementation.
- Small differences arise due to element formulation and numerical approximations.

---

# Future Extensions

Planned future extensions include:

- Geometric nonlinearity
- Material nonlinearity
- Contact mechanics
- Hyperelastic materials
- Modal analysis
- Parallel FEM implementation

---

# Author

Musharraf Khan

M.Sc. Computational Methods in Engineering  
Otto von Guericke University Magdeburg

---

# Tools Used

- MATLAB
- Python
- ANSYS Mechanical

---

# License

This project is licensed under the MIT License.
